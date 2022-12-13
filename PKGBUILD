# Maintainer: Joel Noyce Barnham <joelnbarnham@gmail.com>
# Contributor: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
# Contributor: Lev Lybin <aur@devtrue.net>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

## "1" to enable IA32 SHELL build in Arch x86_64, "0" to disable
_SHELL_IA32_ARCH_X64="0"

###############
_TIANO_DIR_="edk2"
###############

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

_pkgname="uefi-shell"
pkgname="${_pkgname}-git"

pkgver=30713.edk2.stable202211.40.g1fd8d08970
pkgrel=1
pkgdesc="UEFI Shell v2 - from Tianocore EDK2 - GIT Version"
url="https://github.com/tianocore/edk2"
arch=('x86_64' 'i686')
license=('BSD')

makedepends=('git' 'python' 'nasm')

options=('!strip' '!makeflags')

conflicts=('uefi-shell' 'uefi-shell-svn')
provides=('uefi-shell')

install="${_pkgname}.install"

source=(
	"${_TIANO_DIR_}::git+https://github.com/tianocore/edk2.git#branch=master"
	"brotli::git+https://github.com/google/brotli"
	"softfloat::git+https://github.com/ucb-bar/berkeley-softfloat-3.git"
	"cmocka::git+https://git.cryptomilk.org/projects/cmocka.git"
	"oniguruma::git+https://github.com/kkos/oniguruma"
	"openssl::git+https://github.com/openssl/openssl"
)

sha1sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd "${srcdir}/${_TIANO_DIR_}/"
	echo "$(git rev-list --count HEAD).$(git describe --long --always --tags)" | sed -e 's|-|\.|g'
}

_setup_env_vars() {
	msg "Setup UDK PATH ENV variables"
	export _UDK_DIR="${srcdir}/${_TIANO_DIR_}"
	export EDK_TOOLS_PATH="${_UDK_DIR}/BaseTools"
}

_prepare_tianocore_sources() {
	cd "${_UDK_DIR}/"

	declare -A _submod_path
	_submod_path["CryptoPkg/Library/OpensslLib/openssl"]="openssl"
	_submod_path["SoftFloat"]="softfloat"
	_submod_path["UnitTestFrameworkPkg/Library/CmockaLib/cmocka"]="cmocka"
	_submod_path["MdeModulePkg/Universal/RegularExpressionDxe/oniguruma"]="oniguruma"
	_submod_path["MdeModulePkg/Library/BrotliCustomDecompressLib/brotli"]="brotli"
	_submod_path["BaseTools/Source/C/BrotliCompress/brotli"]="brotli"

	msg "Updating submodules"
	git submodule init
	for _module in "${!_submod_path[@]}"; do
		git config submodule."$_module".url "$srcdir/${_submod_path[$_module]}"
	done

	# Apply same fix as adopted by other projects when this change dropped. Example:
	#   https://github.com/microsoft/go-infra/pull/71/files
	# Also covered by this in Arch:
	#   https://bugs.archlinux.org/task/76255
	git -c protocol.file.allow=always submodule update

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
