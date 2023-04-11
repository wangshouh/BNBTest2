// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

import "forge-std/Script.sol";
import "../src/EIP1822.sol";

contract ProxyScript is Script {
    function run() external {
        vm.startBroadcast();

        NumberStorage number = new NumberStorage();
        NumberStorageUp numberUp = new NumberStorageUp();

        address numberAddress = address(number);
        
        Proxy proxy = new Proxy(
            abi.encodeWithSignature("constructor1()"),
            numberAddress
        );

        vm.stopBroadcast();
    }
}
