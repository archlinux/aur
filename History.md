
uuu_1.5.11 / 2022-11-01
=======================

  * fix windows build failure
  * add nvme_all build-in command
  * Add Write command to allow use mmc write to write image
  * error.cpp - fixed race conditions of g_last_error_str and g_last_err_id variables
  * add support for stm vendor fastboot

uuu_1.5.4 / 2022-09-26
======================

  * Fix Mac build error
  * bump version to 1.5
  * Fixed windows release version crash
  * fix memory leak cause by getaddrinfo
  * fix crash when last block actual size < m_output_size
  * add -dm to disable small memory for debug purpose
  * fixed a dead lock when reset stream
  * stop http download when error happen
  * add error check for all request_data
  * fix linux build warning
  * fix linux build issue
  * zstd have option field in head to show decompress file size
  * Add gzip stream support
  * Rework buffer management to support small memory version
  * Fix support of empty environment variables in Windows OS
  * fix crash when environment variable is last word in script
  * update libusb path
  * update libusb submodule
  * drop vs2017 support.
  * use $(DefaultPlatformToolset)
  * try remove PlatformToolset and set WindowsTargetPlatformVersion to 10.0

uuu_1.4.243 / 2022-08-23
========================

  * zstd ZSTD_getFrameContentSize can return decompress size
  * Create SCR-mfgtools.txt
  * Update README.md for zstd

uuu_1.4.240 / 2022-08-12
========================

  * Fix ZSTD stopping

uuu_1.4.237 / 2022-07-26
========================

  * fix fail open file begin with > in script

uuu_1.4.236 / 2022-07-26
========================

  * fix build failure at windows
  * fix warning at trans.cpp and usbhotplug.cpp
  * fix warning at sdp.cpp
  * fix warning at cmd.cpp
  * fix build warning at buffer.cpp
  * Fixed build warning at fastboot.cpp
  * Improve error message after code consolidate
  * Fixed bz2 decompress fail at 26% for a specific file

uuu_1.4.232 / 2022-07-22
========================

  * Fix #328 Current Directory not appending

uuu_1.4.231 / 2022-07-18
========================

  * Fix Http Loading
  * Fixes logical issue with patch 219cf39
  * Merge branch 'master' of github.com:NXPmicro/mfgtools
  * Fix #326 Skipping First Character
  * Fix #326 Skipping First Character
  * Generalized FSCompressStream checks
  * Shows loading progress for single thread BZ2
  * Consolidate Reload Function for File Types
  * Fix #325 appending header twice issue

uuu_1.4.224 / 2022-06-22
========================

  * Automatically decompress ZSTD file from -b
  * fix crc command -format
  * Add async for zstd
  * add async support for gz
  * try to fix MacOS build failure at appveyor
  * try to fix macos build
  * Revert "Try fix macOS build after zstd patch"
  * try fix macOS build after zstd patch
  * Merge branch 'master' of github.com:NXPmicro/mfgtools
  * Try fix macOS build after zstd patch
  * Try fix macos build after zstd patch
  * Update Ubuntu to 18.04
  * try to fix linux build appveyor
  * Try to fix mac build appveyor
  * Try to fix Linux Build fail at appveyor
  * Added libzstd-dev to snap
  * better fix appveryor vs build problem
  * test build environment
  * try to fix appveyor build problem
  * try to fix zstd build error at appveyor
  * Update README.md
  * fix build error after add zstd lib
  * zstd  decompression
  * Add zstd library into uuu
  * Fix error message
  * Show CRC check progress
  * implements crc check for images

uuu_1.4.201 / 2022-04-26
========================

  * Fix crash when download bz2 from http
  * Fix uuu_version in generated uuu.inputlog in shell mode
  * Fix argument names in print_cfg()
  * Fix crash when download speed slower than decompress speed and need resize buffer
  * Merge branch 'master' of github.com:codeauroraforum/mfgtools
  * Specify 'ios::binary' in ofstream initialization
  * Add i.MX93 support

uuu_1.4.193 / 2022-01-18
========================

  * consolidated libusb_init and libusb_deinit into CAutoDeInit

uuu_1.4.191 / 2022-01-04
========================

  * Fixed 314 Corrupt image with larger transfer sizes at sdp(s)
  * fixed missed true at else branch at built-in script
  * Added CAutoDeInit to call libusb_exit() automatically
  * Replaced all libusb_get_device_list calls with CAutoList objects
  * can't call libusb_exit at uuu_for_each_devices
  * fixed missed call libusb_free_device_list at look_for_match_device
  * Fixed invalid progress percentage in verbose mode

uuu_1.4.182 / 2021-12-13
========================

  * Add NXP FB/FBK/SDPV device PID
  * Fixed QSPI flashing script
  * Fix cmake warning related to uuu tool
  * Add zlib1g-dev to fix snap build failure

uuu_1.4.174 / 2021-11-04
========================

  * Fix invalid test on fastboot_bytes on lst script
  * ubuntu 16 still use old libusb version
  * Fix depracated method TLSv1_2_client_method
  * Remove depracated function libusb_set_debug
  * Remove dependences from fastboot_bytes that is specific to freescale uboot
  * fix #297 print error when run quit cmd in shell mode
  * remove unnecessary libzip dependency
  * Fix #180 support check getval return value

uuu_1.4.165 / 2021-09-28
========================

  * Fixed new line in help and minor typos

1.4.164 / 2021-09-24
====================

  * fixed assert when use wic file, instead wic.bz2

1.4.163 / 2021-09-20
====================

  * fix linux build failure
  * fix 8mp ROMAPI download size is wrong when extract from wic file
  * sdp just request 8M data
  * sdps can return failure early when wic have not include terminate tags
  * Add support extract boot loader from wic image
  * fix buildin script bz2 have not replaced with bz2\* if path included space
  * fix build error at vs2017
  * Fix formatting
  * Add 'upload' fastboot command support
  * fixed #284: deadloop when using built-in script with filename include _
  * jump command -ivt should be flow 0
  * fix block SDPV: write -f u-boot.itb
  * Fix sdp jump command ivt implement to support uboot plugin
  * Fix some spelling errors
  * issue #278 - instructions for out of source build

uuu_1.4.149 / 2021-08-03
========================

  * CMake: Support version 3.4 again
  * Fix a potential crash if open usb device 400ms after detect attached
  * retry open usb device at windows platform
  * Increase const'ness of built-in scripts
  * Utilize regular expression to detect arguments
  * Minor adjustments all around the code
  * Reduce visibility where applicable
  * Spread some const around buildincmd
  * Rename member variables too
  * Rename classes and move Arg into BuiltInScript
  * Completely document buildincmd
  * Reorder buildincmd.h
  * Move definitions into source file
  * Do not introduce namespace std in buildincmd.h
  * fixed #274 struct stat64 is deprecated on macOS
  * add bcd version check
  * Add basic if and error cmd support
  * Fix a build warning
  * try fix uuu return success even ucp failure

uuu_1.4.139 / 2021-06-02
========================

  * Fix trail data missed at some sparse file

uuu_1.4.138 / 2021-05-25
========================

  * fix linux build fail
  * Add help option -IgSerNum to set windows registry
  * add usb_next_timeout to break infinit wait between stages
  * usbhotplug: avoid code duplication and make it thread save
  * usbhotplug: remove unused variable
  * return out of memory when allocate failure
  * Create post-refresh
  * Revert "Disable snap home interface attribute to avoid manual review"
  * -bshow error message add new line
  * -bshow show error message at stderr
  * -bshow don't show uuu version information and recover cursor ESC

uuu_1.4.127 / 2021-03-30
========================

  * Fix 8ulp only download spl
  * remove alias universal-update-utility
  * test snapcraft webhook 2
  * test snapcraft webhook
  * test snapcraft 3
  * test snapcraft 2
  * test snapcraft
  * Disable snap home interface attribute to avoid manual review
  * Migrate snap base to core18 to mitigate submodule clone error
  * Allow reading the SUDO_USER's uuu script whenthe snap is run as root
  * Warn snap confinement issues when program errors
  * Sync snap metadata with store listing
  * Fix selective-checkout wrongly checking out v2.8.0 tag
  * Fix selective checkout part definition
  * Update README.md
  * Revert "update selective-checkout of snap.yaml"

uuu_1.4.107 / 2021-03-05
========================

  * mv snap/license to snap/local
  * update selective-checkout of snap.yaml
  * update snap svg
  * snap: Fix missing copyright declaration
  * snap: Add MIT license file
  * Ignore locally built snaps from Git
  * snap: Drop packaging revision which is only useful with out-of-repo recipe
  * snap: Use in-repo source instead of cloning from GitHub
  * Implement snap packaging (#221)
  * Add Snap badges

uuu_1.4.95 / 2021-02-24
=======================

  * Build all after added mac build
  * deloy uuu_mac
  * update path
  * fix path on mac build
  * try build on macos
  * test build on MacOS
  * try build on macos
  * try build on macos
  * try build on macos
  * Test macOS build
  * Add mac prebuild image
  * fails to build on alpine arm32v6'; fix adding interpreter to uuu/gen_txt_include.sh

uuu_1.4.77 / 2021-01-22
=======================

  * Add 8ULP support
  * uuu: Move rules to priority 70
  * uuu: Use uaccess instead of '0666' in the udev rule
  * update bzip2 to bzip2-1.0.8
  * update bzip2 to official git repo

uuu_1.4.72 / 2021-01-13
=======================

  * fix a chuck missed when sparse file split happen at whole chunck
  * fix android super image failure

uuu_1.4.69 / 2020-12-09
=======================

  * http\https add port support at url
  * fastboot: default to logical-block-size 4096
  * improve progress show when burn android sparse image
  * use macOS brewed openssl symbolic link to resolve root dir for cmake
  * hardening: follow default compiler behavior for PIE
  * reproducible builds: do not embed build path in the generated binaries
  * Add macOS build instructions, improve Travis-CI job for macOS, improve README
  * fixed #214: Wrong output path in uuu(-static-link).vcxproj
  * remove c.txt prebuild generate in uuu-static-link project file
  * remove c.txt prebuild generate in project file
  * include g++ in the dependency list for Linux build

uuu_1.4.43 / 2020-08-10
=======================

  * fix windows env param read terminates command
  * fix multiple occurrence of @ variables
  * try to fix travis build failure
  * add parameter to modify enviroment variables
  * add environment variable support command
  * Fix some typo at error message
  * Added support for 'FB:reboot' and 'FASTBOOT:reboot'
  * Simplify notify.cpp
  * Modernize version.cpp
  * Minor adjustments to error handling definitions
  * Solve leftover compiler warnings for rominfo.h
  * Deduplicate GetFlashHeaderSize
  * Introduce offsets to GetFlashHeaderSize
  * Modernize CheckHeader
  * Further simplify both search_rom_info functions
  * Modernize search_rom_info(const char *s)
  * Drop "using namespace std" directive from buffer.h
  * Reduce visibility of Zip_file_info members
  * Add missing "pragma once" to http.h
  * Reduce visibility of Fat class members
  * Reduce visibility of class members in fastboot.h
  * Reduce visibility of a further few variables
  * Reduce visibility of members of CmdBase
  * Forbid copying CmdCtx
  * Adjust SDPCmdBase
  * Adjust SDPWriteCmd
  * Adjust SDPReadMemCmd
  * Adjust SDPDcdCmd
  * Minor changes to help code models
  * Make member variable of SDPSCmd private
  * Adjust SDPWriteMemCmd
  * Adjust SDPJumpCmd
  * Add more override specifiers in trivial places
  * Adjust SDPBootCmd
  * Adjust Backfile
  * Adjust m_socket within HttpStream
  * Fix compiler warnings for uuu.cpp
  * Move function prototypes to source that uses them
  * Drop using namespace std directive from config.h
  * Use default member initializer in HttpStream
  * Modify HttpStream member function visibility
  * Forbid copying TransBase
  * Drop using namespace std directive from trans.h
  * Make BulkTrans fields private and some const
  * Make fields of HIDTrans private
  * Make USBTrans::m_EPs protected
  * Reduce visibility of TransBase::m_devhandle
  * Drop unused m_path member from TransBase
  * allow to pass sparse limit from command line
  * fix #193 fb:< echo ucmd print failure
  * fix fat_write partition parser error
  * Update version number support build number > 255
  * libuuu/CMakeLists.txt: don't overwrite CMAKE_CXX_FLAGS

uuu_1.3.191 / 2020-05-08
========================

  * Added missed license header
  * Workaround problem: some data pattern affect download at some win10
  * Drop std:: from source files
  * Make applicable function const and/or noexcept
  * Make allocation ways enum scoped and var private
  * Make more parameters const-ref
  * Add override specifiers in buffer.cpp
  * Replace all NULL by nullptr
  * Reduce dependencies of fastboot.h
  * Drop dependency of hidreport.h on trans.h
  * Drop dependency of sdp.h on hidreport.h & trans.h
  * Reduce include directives of zip.h
  * Drop liberror.h include from sparse.h
  * Drop dependency of cmd.h on config.h
  * Minor polishing for tar.h
  * Move Backfile declaration into own header
  * Attempt at fixing compilation fail on Ubuntu 16.04
  * Reduce includes of buffer.h
  * Move non-trivial FileBuffer functions into source
  * Move functions from trans.h to trans.cpp
  * Move functions from sdp.h to sdp.cpp
  * Move functions from zip.h to zip.cpp
  * Minor polishing for sparse.h
  * Move non-trivial SparseFile functions into source
  * Move non-trivial functions from fat.h to fat.cpp
  * Move non-trivial functions from cmd.h to cmd.cpp
  * Add hipreport.cpp to VS files
  * Parameter type of HIDReport::set_out_package_size
  * Unify str->unsigned conversion functions
  * Minor polishing for HIDReport
  * Polish HIDReport header
  * Reduce HIDReport variable accessibility
  * Make use of modern initialization to drop init fun
  * Remove HIDReport default constructor
  * Move non-trivial HIDReport functions to source
  * Silence clang code model warnings
  * Add and use safe str->uint16_t conversion function
  * Get rid of warnings concerning terminal color strs
  * nand:  fix fail if uboot have not defined nandfit_part
  * update 7D ROM free memory address

uuu_1.3.171 / 2020-04-20
========================

  * skip build when create tag

uuu_1.3.169 / 2020-04-20
========================

  * fix directory structure in tarbal

uuu_1.3.167 / 2020-04-15
========================

  * Added zip support
  * remove reduntant uuu-source
  * use name uuu_source-<version number>.tar.gz
  * Added deploy source.tar.gz
  * add .tarball_version to source tar
  * Fixed missed HEAD
  * First try create tar.gz by CI system
  * Fix compiler error on Windows
  * Use constexpr variables instead of preprocessor
  * Improve headers and use forward declaration
  * Use default member initializer and member ini list
  * Make parameter const-ref
  * Modernize SDPSCmd
  * Make g_RomInfo a constexpr std::array
  * Constify cmd members of Fastboot command classes
  * Modernize further Fastboot CmdBase descendants
  * Modernize FastBoot
  * Various modernizations to configuration impl
  * Minor adjustments for configuration classes
  * Make const-ref where applicable
  * Modernize CmdBase descendants in cmd.h
  * Modernize TransBase and its descendants
  * Modernize CmdBase
  * Make Param's type enumeration scoped
  * Modernize Param
  * Modernize CmdCtx and CmdUsbCtx
  * Modernize ConfigItem
  * Modernize EPInfo
  * Set CMAKE_CXX_STANDARD to "14"
  * libuuu: add missing fastboot Boundary Devices IDs

uuu_1.3.154 / 2020-03-13
========================

  * libuuu: allow to build without git
  * libuuu: fastboot: use sparse only if max-download-size is available
  * libuuu: fastboot: fix oem command separator
  * Fix crash when download bz2 file
  * fix linux build failure because UINT64
  * ffu basic download
  * libuuu: add Boundary Devices USB ids
  * Added basic fastboot logical partition support
  * README: add libssl-dev to required packages

uuu_1.3.136 / 2020-02-19
========================

  * Batter handle image which included V2X containter

uuu_1.3.134 / 2020-02-17
========================

  * fix spl qxp\qm download failure
  * Fix for arguments order for script ( -b option )

uuu_1.3.130 / 2020-01-27
========================

  * 8DXL can download image
  * print extra line for no verbose mode
  * sd support burn difference uboot

uuu_1.3.126 / 2020-01-15
========================

  * Added i.MX8DXL PID/VID

1.3.124 / 2019-12-12
====================

  * Add i.MX865 PID information
  * fix show 99% when complete download
  * libuuu: usb hotplug: configurable usb polling period (-pp)
  * sdp: bootcmd: add support for --dcdaddr
  * sdp: clear dcd flag (jump/boot on close devices)
  * Fix miss ucmd in nand built script
  * change the nand lst for nandbcb support
  * use system time instead of tick as timesample
  * add missed copyright for http.cpp
  * fix build error with openssl 1.1
  * Add support for fastboot Continue feature

uuu_1.3.102 / 2019-10-28
========================

  * fix CI build issue
  * fix miss openssl include file
  * http request require \r\n
  * Use ubuntu 16.04 as prebuild image
  * Add zip64 support

uuu_1.3.96 / 2019-10-18
=======================

  * support static link openssl

uuu_1.3.93 / 2019-10-11
=======================

  * Fix wait for ever at decompress bz2 sometime when download from http
  * show http download progress for sync load
  * Fix https download failure at finial transfer
  * linux support basic https
  * Fix crash when bz2 file is not exist at http link
  * Enable https support for windows platform
  * use get_file_buffer for zip file
  * fix #136: fix decompress md5 file fail in zip
  * libuuu: fix compiler warnings
  * Make it possible to execute scripts from file with arguments with -b option.

uuu_1.3.82 / 2019-09-19
=======================

  * fixed #123: implement timeout for wait known usb device apprear
  * auto detect sdp interrupt out ep number
  * add -lsusb to list known connected devices
  * improved error handle when http download failure

uuu_1.3.74 / 2019-09-04
=======================

  * improve http download process message

uuu_1.3.72 / 2019-09-03
=======================

  * Fix linux build error
  * Show download process
  * auto added /* for bz2 file for buildin script
  * http download and bz2 decompress at the same time
  * Add basic http download support
  * README: add cmake in list of required packages on Linux

uuu_1.3.63 / 2019-08-27
=======================

  * treat EPIPE error as normal
  * Fix FBK: ucp t:- filename

uuu_1.3.61 / 2019-08-26
=======================

  * fix missed last chuck data of android sparse image

uuu_1.3.59 / 2019-08-21
=======================

  * show uncompress tar.gz progress
  * Added tar.gz format support
  * added support for tar.bz2, as well as fixed the previous decompression issue with pbzip2
  * delete 0001-static-link-c-lirary.patch
  * Fix build error because libusb change output dir
  * Remove msvc/libusb_static_2017.vcxproj
  * update libusb v1.0.23-rc2
  * set known file size flag after scan whole bz2 file
  * Check memory resize return value
  * added very simple tar support

uuu_1.3.34 / 2019-07-25
=======================

  * use bit mask to decide loaded and known buffer size
  * Change all to use shared_ptr for FileBuffer
  * Fix Zip file download fail because missed wakeup
  * build in appveyor visual studio 2019 image
  * Change FileBuffer memory management
  * fix linux build problem
  * fix no display position when async decompress
  * Added timestamp for each notification
  * fix data currupt after decompress
  * basic implement download and decompress at the same time
  * Added coverity support
  * fix a error for building  solution in vs2019
  * add git clean before build uuu-static-link
  * Remove qspi flash header check because old uboot have not built in setexpr
  * use qsphdr dump check if qsphdr cmd exist
  * Increase timeout for qspihdr command
  * Added --skipfhdr to skip flex flash header
  * fix windows build failure
  * added nand build script
  * Add dry run option to check if script is correct
  * Update CMakeLists.txt
  * fix appveryor build error
  * Added DEBIAN_FRONTEND=noninteractive
  * Add -D 'STATIC for appveryor
  * allow true dynamic linking for Linux build
  * Update README.md
  * Fix issue when download uboot > 2MB by SPL SDP protocal.

uuu_1.2.135 / 2019-05-28
========================

  * Fix decompress data missed bug when use sdcard.bz2/* if enable -O2

uuu_1.2.130 / 2018-07-20
========================

  * Support i.MX 815 chip
  * add license shield io
  * fix crash when console 47 < width < 54
  * Increase string size for device numeration
  * Fixed Typo
  * Typo in Debian/Ubuntu dependencies
  * Remove xcode8 build
  * build: Only create gitversion.h on success
  * gen_ver.sh: Don't ignore errors
  * version: Drop GIT_VERSION define
  * enable -O2 for build option
  * Add imx28 support
  * libuuu: add commands for reading and writting a memory address for iMX6/iMX7
  * uuu: resize status bar for longer error messages
  * libuuu: remove redefinitions of ROM_WRITE_ACK, ROM_STATUS_ACK and ROM_OK_ACK
  * Only run sdps log read when write success.
  * improve build-in list to burn different files

uuu_1.2.91 / 2019-02-25
=======================

  * fix uuu -b qspi flash_qxp_spl.flexspi failure problem

uuu_1.2.89 / 2019-02-22
=======================

  * correct emmc_ack env check method
  * check uboot environment emmc_ack
  * update build tag link
  * Added travis build tag
  * Update .travis.yml
  * Update .travis.yml
  * Update .travis.yml
  * Update .travis.yml
  * Update .travis.yml
  * Update .travis.yml
  * Update .travis.yml
  * Update .travis.yml
  * Update by use tab .travis.yml
  * update .travis.yml
  * Update .travis.yml
  * Create .travis.yml
  * set the CMAKE_CXX_STANDARD to c++11 explicitly to fix the compile error on Mac OSX.

uuu_1.2.68 / 2019-01-31
=======================

  * Fixed random stop at linux environment

uuu_1.2.66 / 2019-01-25
=======================

  * fixed crash when DONE cmd is not last one
  * fixed #79 all data is zero when file transfer from target to windows PC
  * fix -b qspi failure
  * FB added set_active command
  * Avoid add addition space when convert cmd arg

uuu_1.2.61 / 2019-01-16
=======================

  * Fix 8mq skipspl ivt search problem
  * Old i.MX8MQ SPL bcd use 0x9999
  * fix memory leak
  * fix windows random crash when multi device running
  * remove duplicated SDPV line

uuu_1.2.56 / 2019-01-09
=======================

  * Fix linux build failure
  * fix windows built failure
  * fixed #70 usbfs: process uuu did not claim interface 0 before use
  * Image size need minus IVT offset
  * update default SDPV command option
  * Update built-in script to support SDPV command
  * Support -skipspl option at sdp protocol
  * Change SPPV usb bcd version from 0x500
  * Support Filter a range or BCDVersion number
  * MAC build success
  * Update Readme.md to add pkg-config to linux apt
  * Fix typos in user visible strings
  * fix -Wreturn-type in `runshell`
  * usb bcd distinguish SDPU
  * Only download size that imx8qm and imxqxp's container header indicator
  * Fixed windows build failure
  * add built-in script fat_write

uuu_1.2.39 / 2018-12-13
=======================

  * Update libusb link to folk's link
  * Only show auto complete help message when print help
  * notify.cpp: prevent crash by catching exception
  * doxygen support

uuu_1.2.31 / 2018-11-29
=======================

  * Update Readme for better format
  * Update license info
  * Update appveyor.yml
  * Added static link project for windows

uuu_1.2.26 / 2018-11-28
=======================

  * Fix add quota for FB[-t 1000]: Only filename need quota

uuu_1.2.24 / 2018-11-27
=======================

  * fix built-in script always have quota
  * Support space in Path
  * Fixed uuu "fb[-t 1000]:" ucmd problem
  * fix a2x build problem when wiki include signed off
  * Fix sudo uuu auto complete problem
  * add help -udev option to generate udev rule
  * tell sudo uuu have problem
  * Improve uuu autocomplete txt and put into Microsoft.PowerShell_profile.ps1
  * Add one more new line about autocomplete
  * Fix crash when parameter more than script required
  * fall back to verbose mode if vt mode enable failure
  * improve linux auto complete
  * skip x86 build output file
  * skip debug and x86 build for linux side
  * Add debug version build
  * fix rebase missed e3c4b56 commit change
  * Move auto complete into separate file
  * powershell auto complete basic work
  * Remove VT color code at win7 environment
  * win32 also use static link
  * Fix windows 32bit build problem
  * Update appveyor.yml
  * Update appveyor.yml
  * fix auto complete problem with path
  * Fix windows version build failure
  * fix uboot command in shell mode
  * show help tell user use auto complete
  * linux basic auto complete work
  * linux auto complete basic work
  * just print help if run uuu
  * SPDS support BLOG
  * SPL：added SDPU: done command
  * SDPU fetch log blog command
  * Add timeout support for HID read command
  * EXPERIMENTAL: Added Blog command to capture console log
  * Add a u-boot shell command mode.
  * lookup libbz2 not by filename but by library name
  * flush output after wait for known usb device appear
  * Update Readme add build status-badges

uuu_1.2.0 / 2018-10-31
======================

  * update version number to 1.2.x

uuu_1.1.112 / 2018-10-31
========================

  * update appveyor.xml to add history of uuu.pdf
  * Update README.md
  * Update README.md

uuu_1.1.108 / 2018-10-30
========================

  * update artifacts
  * linux clone mfgtools.wiki.git
  * linux install rename
  * Update appveyor.yml
  * Update appveyor.yml
  * Update appveyor.yml
  * Update appveyor.yml
  * Use static link C library
  * Update appveyor.yml
  * Update appveyor.yml
  * Update appveyor.yml
  * Update README.md

uuu_1.1.95 / 2018-10-25
=======================

  * Update README.md
  * Add missed bz2 project file
  * libbz2 have not provide pkg-config
  * add linux build support
  * support decompress bz2 file
  * add bzip2 code
  * Rewrite zip and sdcard fat handle code
  * check original file size to avoid crash when use small image
  * Fix jump command overwrite data that caused security image boot failure
  * Update README.md

uuu_1.1.87 / 2018-10-17
=======================

  * increase qspl write timeout value to 20s
  * Merge pull request #60 from cwald/patch-1
  * Update README.md
  * fix linux build error
  * Move shell mode to low priority
  * windows: using FSCTL_REQUEST_OPLOCK to monitor file change

uuu_1.1.81 / 2018-09-26
=======================

  * Update qspi_burn_loader.lst

uuu_1.1.79 / 2018-09-25
=======================

  * correct fix windows file lock problem
  * Remove debug message
  * In windows system don't buffer memory mapped file because it prevent update target file during daemon mode.

uuu_1.1.76 / 2018-09-25
=======================

  * Fix crash for some imx6/7's image
  * convert uuu.cpp to unix text format
  * fix linux build error and popen fail if mode is "rb" in linux
  * fix linux build failure
  * Add shell command support
  * Merge pull request #56 from angolini/typo2
  * uuu.cpp: Fix Typo
  * Increase max each bulk transfer to 1M
  * Reduce polling to 200ms because libusb_get_device_list take 66ms.
  * Move common command under _ALL: to avoid copy to each protocol

uuu_1.1.61 / 2018-09-13
=======================

  * improve error message for libusb
  * Limited max download size to 16M for sparse file to avoid long timeout
  * Merge pull request #55 from angolini/typo
  * libuuu: Fix typo in error message
  * Merge pull request #53 from nsjodk/cosmetic
  * cosmetic: fix indentation
  * Merge pull request #52 from nsjodk/master
  * cmake: make install, installs uuu in bin
  * Merge pull request #51 from Raphexion/master
  * remove unused (un-read) variable
  * Merge pull request #50 from nsjodk/doc
  * Merge pull request #49 from nsjodk/master
  * README: correct the github path
  * modern cmake: set cxx standard
  * Update README.md
  * Merge pull request #48 from nsjodk/master
  * modern cmake - minimal version 3.4
  * consistent cmake_minimum_required
  * Merge pull request #47 from nsjodk/master
  * config.h: #pragma once before includes
  * Add q\quit to exit shell

uuu_1.1.41 / 2018-08-22
=======================

  * Update qspi erase timeout value to 40s
  * built-in qspi support burn difference image
  * Fastboot add flashing and oem command
  * Update README.md

uuu_1.1.35 / 2018-08-16
=======================

  * add sd_all into default script
  * fix linux build failure
  * optimize version info
  * remove redundant hash value
  * use last tag as build version when build from git

uuu_1.1.29 / 2018-08-15
=======================

  * fix linux build error
  * Fix crash when connect 2 board and load from zip file
  * Async unzip file
  * Notify application when zip file
  * Delay 100ms in case some thread have not exit and send out THREAD_EXIT notify message
  * Remove debug message
  * linux: correct build_ver
  * Remove duplicate build number info
  * Fix windows build problem cause by createversion.bat
  * roll back version number to 1.1.4
  * linux update gen script to recongize appver build number
  * windows recognize appver build number
  * Parse version info from version string
  * Fix open zip file failure
  * FB flash support timeout

uuu_1.1.16 / 2018-08-13
=======================

  * fix mmc emmc partition ack setting
  * built-in emmc_all, sd, spl scripts
  * Improve help message
  * improve cmake clst generate
  * improve error message
  * Fix wrong path handle at failure parser build in command
  * fix linux build
  * Added built-in script support

uuu_1.1.7 / 2018-08-10
======================

  * add -offset document
  * imx8mq skip HDMI firmware
  * SDPS add option -offset to skip some header

uuu_1.1.3 / 2018-08-09
======================

  * Fix protocol case sensitive problem in script

uuu_1.1.1 / 2018-08-07
======================

  * Update build number to 1.1.x
  * Fixed miss ":" at parser uuu script
  * Fix [-t 1000] parser problem at uuu script
  * Added Timeout for FB protocol.

uuu_1.0.86 / 2018-08-02
=======================

  * Fine tune help information
  * Fix -v PID\VID miss algined at IMXRT106X

uuu_1.0.84 / 2018-07-31
=======================

  * clean up some warning for windows build
  * Clean up warning
  * clean up some warning
  * Fixed a typo
  * Add -V option to print libusb error and warning information
  * work around libusb 1/10 open device failure at windows platform
  * Merge pull request #44 from eramox/feature/OOT_build
  * Merge pull request #43 from eramox/fix/fix_different_issues
  * Fix trailing whitespace in the project
  * fix checkpatch
  * Fix warning in uuu
  * Support build of the project from a tarball
  * Support Out Of Tree build

uuu_1.0.74 / 2018-07-24
=======================

  * Added MX8QM support
  * Move ROM info to separated file
  * Add i.MX8MQ support
  * Update README.md
  * Update README.md
  * Update README.md
  * Merge pull request #39 from angolini/README_update
  * README: Fix typo and add missing libzip-dev
  * README: Update the formatting of code block

uuu_1.0.59 / 2018-07-11
=======================

  * add delay command
  * fb: avoid a small package after big package
  * Merge pull request #34 from MrVan/opensuse-fix
  * Add appveyor.yml
  * uuu: fix build on openSUSE tumbleweed

uuu_1.0.53 / 2018-07-05
=======================

  * sdpu: use default address
  * Added missed SDPU done command support
  * Enable cursor when exit program
  * fix issue #33 add try sudo uuu
  * fix i.mx7ulp pid number
  * Merge pull request #32 from falstaff84/master
  * avoid warning
  * Support uboot sdpu protocol to continue with SPL
  * Change uuu output to the same folder with libusb

1.0.44 / 2018-06-21
===================

  * Fix build error
  * remove reduntant data in gitsubmodules
  * Dynamic link libusb
  * Add MXRT106X support
  * Added License file
  * Update README.md
  * Test push hook
  * Update README.md
  * using stadic-libstdc++ to reduce dependence

uuu_1.0.35 / 2018-05-25
=======================

  * fb flash always convert to sparse format
  * fix divided by zero problem
  * Fix build warning
  * Merge remote-tracking branch 'github/uuu'
  * Merge pull request #29 from agavemountain/uuu
  * linux mmap work
  * Precode Linux mmap version
  * Using mmap to read files
  * Fixed CMAKE relative path error
  * Add FB flash command description
  * Fix stack overflow when read sdcard image file
  * use back file if filename is ..
  * Don't return error when can't commands for protocol
  * RAW to sparse work.
  * Add usb path filter support
  * fix linux build
  * Add FAT partition file read
  * Every thread have independence command list
  * Capture ctrl_c to show cursor

uuu_1.0.28 / 2018-05-22
=======================

  * unified file path
  * Add timeout to 5s for flash command
  * Fix linux build problem
  * Added miss file
  * Support split android sparse file
  * precode fastboot flash command
  * Add submodule libsparse
  * fix linux build failure
  * Index start from 1
  * Fix line mass up if error happen
  * Optimize output
  * Correct fastboot transfer size notification error.
  * Fix current path set wrong when use uuu xxx.zip
  * Test web trigger
  * Update README.md
  * Update FBK vid pid info
  * Update README.md
  * Update README.md
  * Update README.md
