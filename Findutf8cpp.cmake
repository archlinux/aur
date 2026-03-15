find_package(utf8cpp CONFIG REQUIRED)

if(utf8cpp_FOUND)
    if(TARGET utf8cpp::utf8cpp AND NOT TARGET utf8cpp)
        message(STATUS "Found utf8cpp::utf8cpp, creating alias target 'utf8cpp'")
        add_library(utf8cpp INTERFACE IMPORTED)
        set_target_properties(utf8cpp PROPERTIES
            INTERFACE_LINK_LIBRARIES utf8cpp::utf8cpp
        )
    endif()
endif()
