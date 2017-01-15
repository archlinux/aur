project (epos)
cmake_minimum_required (VERSION 2.6)

set (COMPILE_FLAGS 
	"-Wall" "-Wunused" "-pipe" "-gstabs+" "-fdefer-pop")

#option (WANT_DMALLOC "dmalloc debugging library" OFF)
option (FORGET_CHARSETS "Do not allow automatic conversions between character sets" OFF)

include (CheckIncludeFile)
CHECK_INCLUDE_FILE ("strings.h" HAVE_STRINGS_H)
CHECK_INCLUDE_FILE ("string.h" HAVE_STRING_H)
CHECK_INCLUDE_FILE ("io.h" HAVE_IO_H)
CHECK_INCLUDE_FILE ("rx.h" HAVE_RX_H)
CHECK_INCLUDE_FILE ("regex.h" HAVE_REGEX_H)
CHECK_INCLUDE_FILE ("errno.h" HAVE_ERRNO_H)
CHECK_INCLUDE_FILE ("wait.h" HAVE_WAIT_H)
CHECK_INCLUDE_FILE ("unistd.h" HAVE_UNISTD_H)
CHECK_INCLUDE_FILE ("unix.h" HAVE_UNIX_H)
CHECK_INCLUDE_FILE ("signal.h" HAVE_SIGNAL_H)
CHECK_INCLUDE_FILE ("syslog.h" HAVE_SYSLOG_H)
CHECK_INCLUDE_FILE ("time.h" HAVE_TIME_H)
CHECK_INCLUDE_FILE ("sys/soundcard.h" HAVE_SYS_SOUNDCARD_H)
CHECK_INCLUDE_FILE ("sys/audio.h" HAVE_SYS_AUDIO_H)
CHECK_INCLUDE_FILE ("sys/stat.h" HAVE_SYS_STAT_H)
CHECK_INCLUDE_FILE ("sys/ioctl.h" HAVE_SYS_IOCTL_H)
CHECK_INCLUDE_FILE ("sys/socket.h" HAVE_SYS_SOCKET_H)
CHECK_INCLUDE_FILE ("sys/select.h" HAVE_SYS_SELECT_H)
CHECK_INCLUDE_FILE ("sys/time.h" HAVE_SYS_TIME_H)
CHECK_INCLUDE_FILE ("sys/types.h" HAVE_SYS_TYPES_H)
CHECK_INCLUDE_FILE ("sys/termios.h" HAVE_SYS_TERMIOS_H)
CHECK_INCLUDE_FILE ("netdb.h" HAVE_NETDB_H)
CHECK_INCLUDE_FILE ("netinet/in.h" HAVE_NETINET_IN_H)
CHECK_INCLUDE_FILE ("linux/kd.h" HAVE_LINUX_KD_H)
CHECK_INCLUDE_FILE ("sys/kernel.h" HAVE_SYS_KERNEL_H)
CHECK_INCLUDE_FILE ("sys/name.h" HAVE_SYS_NAME_H)
CHECK_INCLUDE_FILE ("fcntl.h" HAVE_FCNTL_H)

include (CheckFunctionExists)
CHECK_FUNCTION_EXISTS ("strerror" HAVE_STRERROR)
CHECK_FUNCTION_EXISTS ("strdup" HAVE_STRDUP)
CHECK_FUNCTION_EXISTS ("fork" HAVE_FORK)
CHECK_FUNCTION_EXISTS ("getegid" HAVE_GETEGID)
CHECK_FUNCTION_EXISTS ("strcasecmp" HAVE_STRCASECMP)
CHECK_FUNCTION_EXISTS ("stricmp" HAVE_STRICMP)
CHECK_FUNCTION_EXISTS ("gethostname" HAVE_GETHOSTNAME)
CHECK_FUNCTION_EXISTS ("gettimeofday" HAVE_GETTIMEOFDAY)
CHECK_FUNCTION_EXISTS ("qnx_name_attach" HAVE_QNX_NAME_ATTACH)
CHECK_FUNCTION_EXISTS ("abort" HAVE_ABORT)

include (CheckLibraryExists)
CHECK_LIBRARY_EXISTS (socket main "${CMAKE_SYSTEM_LIBRARY_PATH}" HAVE_LIBSOCKET)
CHECK_LIBRARY_EXISTS (lnsl main "${CMAKE_SYSTEM_LIBRARY_PATH}" HAVE_LIBLNSL)

include (CheckCXXSourceCompiles)

CHECK_CXX_SOURCE_COMPILES (
"int main () {bool b; return 0;}"
HAVE_BOOL)

if (HAVE_SYS_SOCKET_H)
	set (_sockethdr "<sys/socket.h>")
else (HAVE_SYS_SOCKET_H)
	set (_sockethdr "<sys/types.h>")
endif (HAVE_SYS_SOCKET_H)

CHECK_CXX_SOURCE_COMPILES (
"#include ${_sockethdr}
socklen_t x;
int main () {return 0;}"
HAVE_SOCKLEN_T)

if (HAVE_RX_H)
	set (_regexhdr "<rx.h>")
elseif (HAVE_REGEX_H)
	set (_regexhdr "<regex.h>")
else (HAVE_RX_H)
	set (_regexhdr "\"rx.h\"")
endif (HAVE_RX_H)

CHECK_CXX_SOURCE_COMPILES (
"#include <sys/types.h>
#include ${_regexhdr}
int main () {int result = REG_EEND; return 0;}"
HAVE_REG_EEND)

CHECK_CXX_SOURCE_COMPILES (
"#include <sys/types.h>
#include ${_regexhdr}
int main () {regmatch_t rt; rt.rm_so; return 0;}"
HAVE_RM_SO)

CHECK_CXX_SOURCE_COMPILES (
"template <class any_type> class some_type{}; template class some_type<int>;
int main () {return 0;}"
HAVE_TEMPL_INST)

include (CheckCXXSourceRuns)

CHECK_CXX_SOURCE_RUNS (
"extern \"C\" void exit(int);
enum t { a, b, c };
struct s {
	t m : 2;
	t n : 2;
	t o : 2;
} arr[2] = {{a, b, c},{c, c, c}};
int main () {exit (arr[1].n == 2);}"
BROKEN_ENUM_BITFIELDS)

configure_file ("${epos_SOURCE_DIR}/config.h.in" "${epos_BINARY_DIR}/config.h")
include_directories ("${epos_BINARY_DIR}")

set (epos_HEADERS
	src/common.h src/defaults.h
	src/unit.h src/parser.h
	src/rule.h src/text.h
	src/encoding.h src/interf.h
	src/function.h src/options.h
	src/hash.h src/synth.h
	src/voice.h src/exc.h)
list (APPEND epos_HEADERS
	src/waveform.h src/ktdsyn.h
	src/ptdsyn.h src/lpcsyn.h
	src/tdpsyn.h src/tcpsyn.h
	src/slab.h src/rx.h
	src/client.h src/agent.h
# If these didn't have this stupid extension,
# they could be here. CMake sees them
# as files to compile, not headers.
#	src/nnet.cc src/block.cc src/exc.cc
	src/options.lst)

set (epos_MODULES_SOURCES
	src/parser.cc src/unit.cc src/rule.cc
	src/text.cc src/encoding.cc
	src/interf.cc src/function.cc
	src/options.cc src/synth.cc src/ktdsyn.cc
	src/ptdsyn.cc src/lpcsyn.cc src/tdpsyn.cc
	src/tcpsyn.cc src/voice.cc src/waveform.cc)

set (epos_EPOS_SOURCES
	${epos_MODULES_SOURCES}
	src/hashd.cc src/daemon.cc src/agent.cc
	src/ttscp.cc src/nonblock.cc src/client.cc)
set (epos_EPOSM_SOURCES
	${epos_MODULES_SOURCES}
	src/monolith.cc src/hash.cc src/client.cc)

if (WIN32)
	set (epos_PLATFORM_SOURCES
		src/rx.c)
	list (APPEND epos_EPOS_SOURCES
		arch/win/service/service.cpp
		arch/win/service/service.h)
endif (WIN32)

add_definitions ("-DBASE_DIR=${CMAKE_INSTALL_PREFIX}/lib/epos")

add_executable (epos ${epos_EPOS_SOURCES} ${epos_PLATFORM_SOURCES} ${epos_HEADERS})
add_executable (eposm EXCLUDE_FROM_ALL ${epos_EPOSM_SOURCES} ${epos_PLATFORM_SOURCES} ${epos_HEADERS})
target_link_libraries (epos pulse-simple pulse)

add_executable (say src/say.cc ${epos_HEADERS})
add_executable (vrfy src/vrfy.cc)
add_executable (gauge src/gauge.cc ${epos_HEADERS})

install (TARGETS epos say vrfy gauge RUNTIME DESTINATION bin)
install (DIRECTORY cfg/ DESTINATION lib/epos)
install (DIRECTORY doc DESTINATION lib/epos)

