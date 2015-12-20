int DowngradePackage(char *package) {
	tmpchar=NULL;
	
	int isincache = IsPackageInCache(package); // Here also parsing pacman.log and using flag actions.package_never_upgraded
	//printf ("IsPackageInCache checked\n"); //DEBUG
	if (isincache) {
		if (!quiet_downgrade) printf("Downgrading from Cache, to version %s\n",install_version);
		//printf ("command: %s\n",install_command); //DEBUG
		system(install_command);
		return 0;
	}
	if (pkg_never_upgraded==1) {
		strcpy(install_version,installed_pkg_ver);
		ret = IsPackageInArm(package, install_version);
		if (arm_pkgs[ret].link) {
			if (!quiet_downgrade) printf("Downgrade %s from ARM to version %s\n", package,arm_pkgs[ret+2].version);
				strcpy(install_command,"sudo pacman -U "); strcat(install_command,arm_pkgs[ret+2].link);
				//printf ("command: %s\n",install_command); //DEBUG
				system(install_command);
				return 0;
		}
	}
	return 1;
}
int GetChoiseForPackage(char *package) {
	int pac_num;
	
	tmpint=0;
	ret = PacmanInit();
    if (ret) {
		if(!quiet_downgrade) printf("Pacman not initialized! Interrupted\n");
		return -1;
	}
	ret = CheckDowngradePossibility(package);
	//printf ("Downgrade possibility checked\n"); //DEBUG
	if (ret<0) return -1;
	ret = IsPackageInCache(package);
	for (int i=1;i<MAX_PKGS_FROM_ARM_FOR_USER && i<=pkgs_in_arm;i++) {
		printf("%d: %s-%s", i, arm_pkgs[i].name, arm_pkgs[i].version);
		if (!strcmp(arm_pkgs[i].version, installed_pkg_ver)) printf(" [installed]\n");
		else if (!strcmp(arm_pkgs[i].version, install_version)) { printf(" [will be installed by default]\n"); tmpint=i; }
		else printf("\n");
	}
	printf (">> Please enter package number, [q] to quit ");
	if (tmpint>0) printf(", [d] to install default package: ");
	scanf ("%s",package_number);
	return 0;
}
int IsPackageInstalled(char *package) {
    const char *local;
    
    pkg = alpm_db_get_pkg(db_local,package);
    local = alpm_pkg_get_name(pkg);
    if(!local) return 0; // pkg not found in system
    else {
        installed_pkg_ver = alpm_pkg_get_version(pkg);
        return 1;
    }
}
int CheckDowngradePossibility(char *package) {

	ret = IsPackageInstalled(package);
	if (!ret) {
		if(!quiet_downgrade) printf("Package '%s' not installed.\n", package);
		return -1;
	}
	ret = IsPackageInAur(package);
	if (ret>0) { // Package in aur
		if(!quiet_downgrade) printf("Package '%s' in AUR. Downgrade impossible.\n", package);
		return -1;
	}
	else if(ret<0) { // inet connection error
		printf ("Please check you internet connection. Error 1\n");
		return -1;
	}	
	ret = ReadArm(package);
	if (!ret) {
		printf ("Sorry, in ARM 0 packages, or ARM temporary unavailable. Downgrade impossible.\n");
		return -1;
	}
	//printf ("Downgrade possibility checked\n"); //DEBUG
	return 0;
}
int IsPackageInCache(char *package) {
	char full_path_to_packet[300];
	
	if(sizeof(void*) == 4) tmpchar = (char *)"i686"; // architecture,  
	else if (sizeof(void*) == 8) tmpchar = (char *)"x86_64";
	pkg_never_upgraded = 1;
	for (;pacmanlog_length>0;pacmanlog_length--) {
		if (!strcmp(package,pkgs[pacmanlog_length].name) && !strcmp("upgraded",pkgs[pacmanlog_length].action)) { // found necessary package
			if (strcmp(pkgs[pacmanlog_length].cur_version, pkgs[pacmanlog_length].prev_version)) { // if the same version - search next
				strcpy (full_path_to_packet,"/var/cache/pacman/pkg/");
				strcat (full_path_to_packet,package);
				strcat (full_path_to_packet,"-");
				strcat (full_path_to_packet,pkgs[pacmanlog_length].prev_version);
				strcat (full_path_to_packet,"-");
				strcat (full_path_to_packet,tmpchar);
				strcat (full_path_to_packet,".pkg.tar.xz");
				//printf("%s\n",full_path_to_packet); //DEBUG
				pkg_never_upgraded = 0; // Package upgraded at least 1 time
				break;
			}
		}
	}
	//printf("1: %s\n",full_path_to_packet); //DEBUG
	strcpy(install_version,pkgs[pacmanlog_length].prev_version);
	//printf("2: %s\n",full_path_to_packet); //DEBUG
	if(access(full_path_to_packet, F_OK) != -1) { // previously version available in cache
		strcpy(tmp_string,"sudo pacman -U "); // install
		strcat(tmp_string,full_path_to_packet);
		strcpy(install_command,tmp_string);
		//printf("install_command: %s\n",install_command); //DEBUG
		return 1;
	}
	else return 0;
}
static size_t curl_handler(char *data, size_t size, size_t nmemb, void *userp) {

	size_t realsize = size * nmemb;
	struct curl_MemoryStruct *mem = (struct curl_MemoryStruct *)userp;
	mem->memory = realloc(mem->memory, mem->size + realsize + 1);
	memcpy(&(mem->memory[mem->size]), data, realsize);
	mem->size += realsize;
	mem->memory[mem->size] = 0;
	return realsize;
}
int IsPackageInAur(char *package) {

	chunk.memory = malloc(1);
	chunk.size = 0;
	curl_global_init(CURL_GLOBAL_ALL);
	curl = curl_easy_init();
	sprintf(tmp_string,"https://aur.archlinux.org/rpc.php?type=search&arg=%s",package);
	curl_easy_setopt(curl, CURLOPT_URL, tmp_string);
	curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, curl_handler);
	curl_easy_setopt(curl, CURLOPT_WRITEDATA, (void *)&chunk);
	curl_easy_setopt(curl, CURLOPT_USERAGENT, "libcurl-agent/1.0");
	result = curl_easy_perform(curl);
	if(result != CURLE_OK) return -1; // Exit with error
	//// Parsing AUR response
	cJSON *root = cJSON_Parse(chunk.memory);
	cJSON *item = cJSON_GetObjectItem(root,"results");
	for (int i=0;i<cJSON_GetArraySize(item);i++) {
		cJSON *subitem=cJSON_GetArrayItem(item,i);
		tmpchar= cJSON_GetObjectItem(subitem,"Name")->valuestring;
		if (!strcmp(tmpchar,package)) return 1; // package in AUR
	}
	cJSON_Delete(root);

	curl_easy_cleanup(curl);
	if(chunk.memory) free(chunk.memory);
	curl_global_cleanup();
  	return 0; // package not in AUR
}
void ReadPacmanLog() {
	char *buff = NULL;
	size_t len;
	char *date, *time, *operat, *pack_name, *cur_version, *prev_version, *fake;
	int i=0;

	loglines_counter=0;
	pFile=fopen("/var/log/pacman.log","r");
	while (!feof(pFile)) {  // Count lines q-ty in pacman.log
		getline(&buff, &len, pFile);
		loglines_counter++;
	}
	rewind(pFile);

	pkgs = realloc(pkgs, loglines_counter * sizeof(struct packs));

	loglines_counter=0;
	while (!feof(pFile)) {  // Count lines q-ty in pacman.log
		getline(&buff, &len, pFile);
		date = strtok(buff," ");
		date++;
		time = strtok(NULL,"] ");
		fake = strtok(NULL," ");
		operat = strtok(NULL," ");
		pack_name = strtok(NULL," ");
		//printf("Line: %d, operat: %s\n",i, operat); // DEBUG:
		if (!operat) continue;
		if (!strcmp(operat,"upgraded")) {
			//printf("Upgraded: %s, line: %d\n", pack_name, i+1); //DEBUG:
			prev_version = strtok(NULL," ");
			prev_version++;
			cur_version = strtok(NULL," ");
			cur_version = strtok(NULL,")");
			strcpy(pkgs[loglines_counter].date,date);
			strcpy(pkgs[loglines_counter].time,time);
			strcpy(pkgs[loglines_counter].name,pack_name);
			strcpy(pkgs[loglines_counter].action,operat);
			strcpy(pkgs[loglines_counter].cur_version,cur_version);
			strcpy(pkgs[loglines_counter].prev_version,prev_version);
			loglines_counter++;
			//printf ("date: %s, time: %s, operat: %s, pack_name: %s\n", date, time, operat, pack_name); //DEBUG
		}
		i++;
	}
	fclose(pFile);
	pacmanlog_length =loglines_counter;
}
int ReadArm(char *package) {
	char  *str, *last, *architecture, *pointer;
	int counter, counter2;
	
	if(sizeof(void*) == 4) { architecture = (char *)"i686";  }
	else if (sizeof(void*) == 8) { architecture = (char *)"x86_64"; }

	chunk.memory = malloc(1);
	chunk.size = 0;
	//printf ("Memory init\n"); //DEBUG
	curl_global_init(CURL_GLOBAL_ALL);
	curl = curl_easy_init();
	//sprintf (conte,"http://arm.konnichi.com/search/raw.php?a=%s&q=^%s%24&core=1&extra=1&community=1",architecture,package);
	sprintf (tmp_string,"http://repo-arm.archlinuxcn.org/search?arch=%s&pkgname=%s",architecture,package);
	curl_easy_setopt(curl, CURLOPT_URL, tmp_string);
	curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, curl_handler);
	curl_easy_setopt(curl, CURLOPT_WRITEDATA, (void *)&chunk);
	result = curl_easy_perform(curl);
	if(result != CURLE_OK) {
		printf ("Please check you internet connection. Error 2 (Can`t read ARM)\n");
		return -1; // Exit with error
	}		
	curl_easy_cleanup(curl);
	curl_global_cleanup();
	counter2=0;
	pointer = chunk.memory;
	str = strtok(pointer, "\n");
	strcpy(arm_pkgs[counter2].full_path,str);
	counter2++;
	for (;str = strtok(NULL, "\n"); counter2++) {
		strcpy(arm_pkgs[counter2].full_path,str);
	}
	
	pkgs_in_arm = counter2;
	counter=0;

	int l=0, i=1;
	char full[1000];
	while (i<MAX_PKGS_FROM_ARM_FOR_USER) { // Get info about packages in ARM
		if (!strlen(arm_pkgs[l].full_path)) break;
		strcpy(full,arm_pkgs[l].full_path);
		str = strtok(full, "|");
		if (strcmp(str,"testing")) { // Exclude packages from `testing`
			strcpy(arm_pkgs[i].repository,str); 
			//printf("%d: Repo: %s",i, arm_pkgs[i].repository); // DEBUG
			str = strtok(NULL, "|");
			strcpy(arm_pkgs[i].name,str); //printf(", name: %s",arm_pkgs[i].name); //DEBUG
			str = strtok(NULL, "|");
			str = strtok(NULL, "|");
			strcpy(arm_pkgs[i].version,str); //printf(", version: %s",arm_pkgs[i].version);
			str = strtok(NULL, "|");
			strcpy(arm_pkgs[i].link,str); //printf(", link: %s\n",arm_pkgs[i].link);
			str = strtok(NULL, "|");
			strcpy(arm_pkgs[i].pkg_release,str);
			i++;
		}
		l++;
	}
	pkgs_in_arm = i-1; // finally packages q-ty in ARM
	//if(!quiet_downgrade) printf("Packages in ARM: %d\n",pkgs_in_arm); // DEBUG

	if(chunk.memory) free(chunk.memory);

return pkgs_in_arm;
//return 0;
}
int IsPackageInArm(char *package, char *version) {
	int arm_flag=0;
	char t_pack[100];
	
	sprintf(t_pack,"%s-%s",package,version);
	for(tmpint=0;strlen(arm_pkgs[tmpint].full_path)>0;tmpint++) {
		//printf("%s\n",arm_pkgs[tmpint].full_path); // DEBUG
		//printf("%s\n",t_pack); // DEBUG
		if (strstr(arm_pkgs[tmpint].full_path,t_pack)) {
			arm_flag=1;
			break;
		}
	}
	if (arm_flag==1) return tmpint;
	else return 0;
}
int PacmanInit() {

	pkgs = calloc(1, sizeof(struct packs));
	arm_pkgs = calloc(1, sizeof(struct arm_packs));
	arm_pkgs = realloc(arm_pkgs, MAX_PKGS_FROM_ARM_FOR_USER*sizeof(struct arm_packs));

    alpm_handle = NULL;
    alpm_handle = alpm_initialize("/","/var/lib/pacman/",0);
    if(!alpm_handle) {
        printf("Libalpm initialize error!\n");
        return 1;
    }
    db_local = alpm_get_localdb(alpm_handle);
    ReadPacmanLog();

    return 0;
}
int PacmanDeinit() {
	free(pkgs);
	free(arm_pkgs);
	alpm_release(alpm_handle);
	return 0;
}
