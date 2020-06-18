cmake_minimum_required(VERSION 3.17)
project(Vegastrike)

INSTALL(DIRECTORY .vegastrike/ DESTINATION share/vegastrike/.vegastrike
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY ai/ DESTINATION share/vegastrike/ai
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY animations/ DESTINATION share/vegastrike/animations
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY bases/ DESTINATION share/vegastrike/bases
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY cgi-accountserver/ DESTINATION share/vegastrike/cgi-accountserver 
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY cockpits/ DESTINATION share/vegastrike/cockpits 
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY communications/ DESTINATION share/vegastrike/communications
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY documentation/ DESTINATION share/vegastrike/documentation
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY history/ DESTINATION share/vegastrike/history
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY meshes/ DESTINATION share/vegastrike/meshes
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY mission/ DESTINATION share/vegastrike/mission
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY modules/ DESTINATION share/vegastrike/modules
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY music/ DESTINATION share/vegastrike/music
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY parts/ DESTINATION share/vegastrike/parts
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY programs/ DESTINATION share/vegastrike/programs
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY sectors/ DESTINATION share/vegastrike/sectors
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY sounds/ DESTINATION share/vegastrike/sounds
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY sprites/ DESTINATION share/vegastrike/sprites
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY techniques/ DESTINATION share/vegastrike/techniques
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY textures/ DESTINATION share/vegastrike/textures
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY units/ DESTINATION share/vegastrike/units
        PATTERN "*.am" EXCLUDE)

INSTALL(DIRECTORY universe/ DESTINATION share/vegastrike/universe
        PATTERN "*.am" EXCLUDE)

INSTALL(FILES New_Game DESTINATION share/vegastrike)

INSTALL(FILES Version.txt DESTINATION share/vegastrike)

INSTALL(FILES factions.xml DESTINATION share/vegastrike)

INSTALL(FILES New_Game DESTINATION share/vegastrike)

INSTALL(FILES py27_modules.7z DESTINATION share/vegastrike)

INSTALL(FILES py3_modules.7z DESTINATION share/vegastrike)

INSTALL(FILES setup.config DESTINATION share/vegastrike)

INSTALL(FILES vega-license.txt DESTINATION share/vegastrike)

INSTALL(FILES weapon_list.xml DESTINATION share/vegastrike)


#Linux specific locations from here on out.

INSTALL(FILES vegastrike.config DESTINATION share/vegastrike)

INSTALL(FILES vegastrike.desktop DESTINATION share/applications)

INSTALL(FILES vegastrike.png DESTINATION share/pixmaps)

INSTALL(FILES vegastrike.xpm DESTINATION share/pixmaps)

INSTALL(FILES vs DESTINATION bin PERMISSIONS 
	OWNER_READ OWNER_WRITE OWNER_EXECUTE 
	GROUP_READ GROUP_WRITE GROUP_EXECUTE 
	WORLD_READ WORLD_WRITE WORLD_EXECUTE)

INSTALL(FILES vsettings DESTINATION bin PERMISSIONS 
        OWNER_READ OWNER_WRITE OWNER_EXECUTE 
        GROUP_READ GROUP_WRITE GROUP_EXECUTE 
        WORLD_READ WORLD_WRITE WORLD_EXECUTE)

