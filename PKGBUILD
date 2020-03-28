# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on uefi-shell-git: Joel Noyce Barnham <joelnbarnham@gmail.com>

## "1" to enable IA32 SHELL build in Arch x86_64, "0" to disable
_SHELL_IA32_ARCH_X64="0"

###############
_TIANOCORE_PKG="Shell"
_UDK_TARGET="${_TIANOCORE_PKG}Pkg/${_TIANOCORE_PKG}Pkg.dsc"
_TIANOCORE_TARGET="RELEASE"
_COMPILER="GCC5"
_GUID="EA4BB293-2D7F-4456-A681-1F22F42CD0BC"
###############

###############
[[ "${CARCH}" == "x86_64" ]] && _TIANO_ARCH="X64"
[[ "${CARCH}" == "i686" ]] && _TIANO_ARCH="IA32"

[[ "${CARCH}" == "x86_64" ]] && _TIANO_S_ARCH="x64"
[[ "${CARCH}" == "i686" ]] && _TIANO_S_ARCH="ia32"
###############

pkgname="uefi-shell"
pkgver=202002
pkgrel=1
pkgdesc="UEFI Shell v2 - from Tianocore EDK2 - GIT Version"
url="https://github.com/tianocore/edk2"
arch=('x86_64' 'i686')
license=('BSD')
makedepends=('python' 'nasm')
options=('!strip' '!makeflags')
conflicts=('uefi-shell-git' 'uefi-shell-svn')
install="${pkgname}.install"
source=("https://github.com/tianocore/edk2/archive/edk2-stable${pkgver}.tar.gz")
sha256sums=('284eb25bdd78e40a969f3fd35e96c7c2a2a5903106ddf08282c194cb561400f4')

_setup_env_vars() {
	msg "Setup UDK PATH ENV variables"
	export _UDK_DIR="${srcdir}/edk2-edk2-stable${pkgver}"
	export EDK_TOOLS_PATH="${_UDK_DIR}/BaseTools"
}

_prepare_tianocore_sources() {
	cd "${_UDK_DIR}/"

	msg "Cleanup UDK config files"
	rm -rf "${_UDK_DIR}/Build/" || true
	rm -rf "${_UDK_DIR}/Conf/" || true
	mkdir -p "${_UDK_DIR}/Conf/"
	mkdir -p "${_UDK_DIR}/Build/"

	msg "Delete bogus dependency files"
	find . -name '*.d' -delete

	msg "Disable build ID generation"
	sed 's|,--gc-sections|,--gc-sections,--build-id=none|g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template"

	msg "Fix GCC Warning as error"
	sed 's|-Werror |-Wno-error -Wno-unused-but-set-variable |g' -i "${EDK_TOOLS_PATH}/Source/C/Makefiles/header.makefile" || true
	sed 's|-Werror |-Wno-error -Wno-unused-but-set-variable |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true

	msg "Remove GCC -g debug option and add -O0 -mabi=ms -maccumulate-outgoing-args"
	sed 's|DEFINE GCC_ALL_CC_FLAGS            = -g |DEFINE GCC_ALL_CC_FLAGS            = -O0 -mabi=ms -maccumulate-outgoing-args |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	sed 's|DEFINE GCC44_ALL_CC_FLAGS            = -g |DEFINE GCC44_ALL_CC_FLAGS            = -O0 -mabi=ms -maccumulate-outgoing-args |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true

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
	install -D -m0644 "${_UDK_DIR}/Build/${_TIANOCORE_PKG}/${_TIANOCORE_TARGET}_${_COMPILER}/${_TIANO_ARCH}/Shell_${_GUID}.efi" "${pkgdir}/usr/share/uefi-shell/shell${_TIANO_S_ARCH}_v2.efi"

	if [[ "${CARCH}" == "x86_64" ]] && [[ "${_SHELL_IA32_ARCH_X64}" == "1" ]]; then
		msg "Install the UEFI Shell v2 IA32 binary"
		install -d "${pkgdir}/usr/share/uefi-shell"
		install -D -m0644 "${_UDK_DIR}/Build/${_TIANOCORE_PKG}/${_TIANOCORE_TARGET}_${_COMPILER}/IA32/Shell_${_GUID}.efi" "${pkgdir}/usr/share/uefi-shell/shellia32_v2.efi"
	fi
}
