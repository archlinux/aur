void ShowHelpWindow() {
	printf("\nDowngrader, version %s (libalpm.so.8)\n",VERSION);
	printf(" usage: downgrader [ -h ] [-q] [ -l <package name> ] <PACKAGE_NAME>\n");
	printf("  options:\n");
	printf("   -h   <print this help and exit>\n");
	printf("   -q   <quiet working, without any notifications> \n");
	printf("   -l N   <gave a list of available packages versions for downgrade package N>\n");
} 
