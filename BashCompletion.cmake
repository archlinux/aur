macro (BASHCOMP_INSTALL SCRIPT_NAME)
	install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${SCRIPT_NAME}" DESTINATION share/bash-completion/completions)
endmacro ()
