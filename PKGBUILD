# Maintainer : Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

## "1" to enable IA32 SHELL build in Arch x86_64, "0" to disable
_SHELL_IA32_ARCH_X64="1"

###############
_TIANOCORE_SVN_URL="https://svn.code.sf.net/p/edk2/code/trunk/edk2"
_TIANO_DIR_="tianocore-edk2-svn"
###############

###############
_TIANOCORE_PKG="Shell"
_UDK_TARGET="${_TIANOCORE_PKG}Pkg/${_TIANOCORE_PKG}Pkg.dsc"
_TIANOCORE_TARGET="RELEASE"
_COMPILER="GCC48"
###############

###############
[[ "${CARCH}" == "x86_64" ]] && _TIANO_ARCH="X64"
[[ "${CARCH}" == "i686" ]] && _TIANO_ARCH="IA32"

[[ "${CARCH}" == "x86_64" ]] && _TIANO_S_ARCH="x64"
[[ "${CARCH}" == "i686" ]] && _TIANO_S_ARCH="ia32"
###############

_pkgname="uefi-shell"
pkgname="${_pkgname}-svn"

pkgver=15559
pkgrel=1
pkgdesc="UEFI Shell v2 - from Tianocore EDK2 - SVN Version"
url="http://sourceforge.net/apps/mediawiki/tianocore/index.php?title=ShellPkg"
arch=('x86_64' 'i686')
license=('BSD')

makedepends=('subversion' 'python2')

options=('!strip' '!makeflags')

conflicts=('uefi-shell')
provides=("uefi-shell")

install="${_pkgname}.install"

for _DIR_ in BaseTools MdePkg MdeModulePkg ShellPkg ; do
	source+=("${_TIANO_DIR_}_${_DIR_}::svn+${_TIANOCORE_SVN_URL}/${_DIR_}")
done

sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP')

pkgver() {
	
	cd "${srcdir}/${_TIANO_DIR_}_${_TIANOCORE_PKG}Pkg/"
	echo "$(svnversion)" | tr -d [A-z]
	
}

_setup_env_vars() {
	
	msg "Setup UDK PATH ENV variables"
	export _UDK_DIR="${srcdir}/${_TIANO_DIR_}_build"
	export EDK_TOOLS_PATH="${_UDK_DIR}/BaseTools"
	
}

_prepare_tianocore_sources() {
	
	msg "Delete old UDK BUILD dir"
	rm -rf "${_UDK_DIR}/" || true
	
	msg "Create UDK BUILD dir"
	mkdir -p "${_UDK_DIR}/"
	
	for _DIR_ in BaseTools MdePkg MdeModulePkg ShellPkg ; do
		mv "${srcdir}/${_TIANO_DIR_}_${_DIR_}" "${_UDK_DIR}/${_DIR_}"
	done
	
	cd "${_UDK_DIR}/"
	
	msg "Cleanup UDK config files"
	rm -rf "${_UDK_DIR}/Build/" || true
	rm -rf "${_UDK_DIR}/Conf/" || true
	mkdir -p "${_UDK_DIR}/Conf/"
	mkdir -p "${_UDK_DIR}/Build/"
	
	msg "Use python2 for UDK BaseTools"
	sed 's|python |python2 |g' -i "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"/* || true
	sed 's|python |python2 |g' -i "${EDK_TOOLS_PATH}/Tests/GNUmakefile"
	
	msg "Fix GCC Warning as error"
	sed 's|-Werror |-Wno-error -Wno-unused-but-set-variable |g' -i "${EDK_TOOLS_PATH}/Source/C/Makefiles/header.makefile" || true
	sed 's|-Werror |-Wno-error -Wno-unused-but-set-variable |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	
	msg "Fix GCC >=4.7 error - gcc: error: unrecognized command line option '-melf_x86_64'"
	sed 's| -m64 --64 -melf_x86_64| -m64|g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	sed 's|--64 | |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	sed 's| -m64 -melf_x86_64| -m64|g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	
	msg "Remove GCC -g debug option and add -O0 -mabi=ms -maccumulate-outgoing-args"
	sed 's|DEFINE GCC_ALL_CC_FLAGS            = -g |DEFINE GCC_ALL_CC_FLAGS            = -O0 -mabi=ms -maccumulate-outgoing-args |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	sed 's|DEFINE GCC44_ALL_CC_FLAGS            = -g |DEFINE GCC44_ALL_CC_FLAGS            = -O0 -mabi=ms -maccumulate-outgoing-args |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	
	# msg "Fix GenFw: ERROR 3000: Invalid, Unsupported section alignment"
	sed 's|--gc-sections|--gc-sections --build-id=none|g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template"
	# sed 's|Error (NULL, 0, 3000, "Invalid", "Unsupported section alignment.");|continue;|g' -i "${EDK_TOOLS_PATH}/Source/C/GenFw/Elf64Convert.c"
	# sed 's|Error (NULL, 0, 3000, "Invalid", "Unsupported section alignment.");|continue;|g' -i "${EDK_TOOLS_PATH}/Source/C/GenFw/Elf32Convert.c"
	# sed 's|_GCC48_IA32_OBJCOPY_FLAGS        =|_GCC48_IA32_OBJCOPY_FLAGS        = --section-alignment=0x20 |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	# sed 's|_GCC48_X64_OBJCOPY_FLAGS        =|_GCC48_X64_OBJCOPY_FLAGS        = --section-alignment=0x20 |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	
	msg "Fix UDK Target Platform"
	sed "s|ACTIVE_PLATFORM       = Nt32Pkg/Nt32Pkg.dsc|ACTIVE_PLATFORM       = ${_UDK_TARGET}|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	sed "s|TARGET                = DEBUG|TARGET                = ${_TIANOCORE_TARGET}|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	sed "s|TOOL_CHAIN_TAG        = MYTOOLS|TOOL_CHAIN_TAG        = ${_COMPILER}|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	sed "s|IA32|X64|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	
	chmod 0755 "${_UDK_DIR}/BaseTools/BuildEnv"
	
}

prepare() {
	
	_setup_env_vars
	
	msg "Prepare Tianocore Sources"
	_prepare_tianocore_sources
	echo
	
}

build() {
	
	_setup_env_vars
	
	cd "${_UDK_DIR}/"
	
	msg "Unset all compiler FLAGS"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	msg "Setup UDK Environment"
	source "${_UDK_DIR}/BaseTools/BuildEnv" BaseTools
	echo
	
	msg "Compile UDK BaseTools"
	make -C "${EDK_TOOLS_PATH}"
	echo
	
	msg "Unset all compiler FLAGS"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	msg "Compile UEFI Shell v2 ${_TIANO_ARCH} binary"
	"${EDK_TOOLS_PATH}/BinWrappers/PosixLike/build" -p "${_UDK_TARGET}" -a "${_TIANO_ARCH}" -b "${_TIANOCORE_TARGET}" -t "${_COMPILER}"
	echo
	
	if [[ "${CARCH}" == "x86_64" ]] && [[ "${_SHELL_IA32_ARCH_X64}" == "1" ]]; then
		msg "Unset all compiler FLAGS"
		unset CFLAGS
		unset CPPFLAGS
		unset CXXFLAGS
		unset LDFLAGS
		unset MAKEFLAGS
		
		msg "Compile UEFI Shell v2 IA32 binary"
		"${EDK_TOOLS_PATH}/BinWrappers/PosixLike/build" -p "${_UDK_TARGET}" -a "IA32" -b "${_TIANOCORE_TARGET}" -t "${_COMPILER}"
		echo
	fi
	
}

package() {
	
	_setup_env_vars
	
	msg "Install the UEFI Shell v2 ${_TIANO_ARCH} binary"
	install -d "${pkgdir}/usr/share/uefi-shell"
	install -D -m0644 "${_UDK_DIR}/Build/${_TIANOCORE_PKG}/${_TIANOCORE_TARGET}_${_COMPILER}/${_TIANO_ARCH}/Shell.efi" "${pkgdir}/usr/share/uefi-shell/shell${_TIANO_S_ARCH}_v2.efi"
	
	if [[ "${CARCH}" == "x86_64" ]] && [[ "${_SHELL_IA32_ARCH_X64}" == "1" ]]; then
		msg "Install the UEFI Shell v2 IA32 binary"
		install -d "${pkgdir}/usr/share/uefi-shell"
		install -D -m0644 "${_UDK_DIR}/Build/${_TIANOCORE_PKG}/${_TIANOCORE_TARGET}_${_COMPILER}/IA32/Shell.efi" "${pkgdir}/usr/share/uefi-shell/shellia32_v2.efi"
	fi
	
}
