# Maintainer : Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Andre Osku Schmidt (oskude) <(andre.osku.schmidt) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

################
_TIANOCORE_SVN_URL="https://svn.code.sf.net/p/edk2/code/trunk/edk2"
_TIANO_DIR_="tianocore-edk2-svn"
################

################
_UDK_OVMF_X64_PKG="OvmfX64"
_UDK_OVMF_X64_DSC="OvmfPkg/OvmfPkgX64.dsc"

_UDK_OVMF_IA32_PKG="OvmfIa32"
_UDK_OVMF_IA32_DSC="OvmfPkg/OvmfPkgIa32.dsc"

_UDK_TARGET="RELEASE"
_COMPILER="GCC49"
################

################
_OPENSSL_VERSION="0.9.8zf"
################

_pkgname="ovmf"
pkgname="${_pkgname}-svn"

pkgver=17084
pkgrel=1
pkgdesc="UEFI Firmware (OVMF) with Secure Boot Support - for Virtual Machines (QEMU) - from Tianocore EDK2 - SVN Version"
url="https://tianocore.github.io/ovmf/"
arch=('x86_64' 'i686')
license=('BSD')

makedepends=('subversion' 'python2' 'iasl' 'nasm')

options=('!strip' 'docs' '!makeflags')

conflicts=('ovmf' 'ovmf-tianocore-edk2' 'ovmf-tianocore-edk2-svn')
provides=("ovmf=${pkgver}" "ovmf-tianocore-edk2=${pkgver}" "ovmf-tianocore-edk2-svn=${pkgver}")

install="${_pkgname}.install"

source=("https://www.openssl.org/source/openssl-${_OPENSSL_VERSION}.tar.gz")

for _DIR_ in BaseTools MdePkg MdeModulePkg IntelFrameworkPkg IntelFrameworkModulePkg ; do
	source+=("${_TIANO_DIR_}_${_DIR_}::svn+${_TIANOCORE_SVN_URL}/${_DIR_}")
done

for _DIR_ in PcAtChipsetPkg UefiCpuPkg OptionRomPkg CryptoPkg SecurityPkg ShellPkg FatBinPkg OvmfPkg ; do
	source+=("${_TIANO_DIR_}_${_DIR_}::svn+${_TIANOCORE_SVN_URL}/${_DIR_}")
done

sha1sums=('3f2f4ca864b13a237ae063cd34d01bbdbc8f108f'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')

noextract=("openssl-${_OPENSSL_VERSION}.tar.gz")

pkgver() {
	
	cd "${srcdir}/${_TIANO_DIR_}_OvmfPkg/"
	echo "$(svnversion)" | tr -d [A-z]
	
}

_bail_out() {
	
	if [[ "${CARCH}" != "x86_64" ]]; then
		echo "${pkgname} package can be built only in a x86_64 system. Exiting."
		exit 1
	fi
	
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
	
	for _DIR_ in BaseTools MdePkg MdeModulePkg IntelFrameworkPkg IntelFrameworkModulePkg ; do
		mv "${srcdir}/${_TIANO_DIR_}_${_DIR_}" "${_UDK_DIR}/${_DIR_}"
	done
	
	for _DIR_ in PcAtChipsetPkg UefiCpuPkg OptionRomPkg CryptoPkg SecurityPkg ShellPkg FatBinPkg OvmfPkg ; do
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
	
	msg "Fix UDK Target Platform"
	sed "s|ACTIVE_PLATFORM       = Nt32Pkg/Nt32Pkg.dsc|ACTIVE_PLATFORM       = ${_UDK_OVMF_X64_DSC}|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	sed "s|TARGET                = DEBUG|TARGET                = ${_UDK_TARGET}|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	sed "s|TOOL_CHAIN_TAG        = MYTOOLS|TOOL_CHAIN_TAG        = ${_COMPILER}|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	sed "s|IA32|X64|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	
	chmod 0755 "${_UDK_DIR}/BaseTools/BuildEnv"
	
}

_prepare_openssl_udk_dir() {
	
	cd "${_UDK_DIR}/"
	
	msg "Download OpenSSL ${_OPENSSL_VERSION} Sources"
	bsdtar -C "${_UDK_DIR}/CryptoPkg/Library/OpensslLib/" -xf "${srcdir}/openssl-${_OPENSSL_VERSION}.tar.gz"
	echo
	
	msg "Apply EDK2 Patch for OpenSSL ${_OPENSSL_VERSION}"
	cd "${_UDK_DIR}/CryptoPkg/Library/OpensslLib/openssl-${_OPENSSL_VERSION}/"
	patch -p0 -i "${_UDK_DIR}/CryptoPkg/Library/OpensslLib/EDKII_openssl-${_OPENSSL_VERSION}.patch"
	echo
	
	msg "Setup OpenSSL ${_OPENSSL_VERSION} headers in EDK2 dir"
	cd "${_UDK_DIR}/CryptoPkg/Library/OpensslLib/"
	chmod 0755 "${_UDK_DIR}/CryptoPkg/Library/OpensslLib/Install.sh"
	"${_UDK_DIR}/CryptoPkg/Library/OpensslLib/Install.sh"
	
}

prepare() {
	
	_bail_out
	
	_setup_env_vars
	
	msg "Prepare Tianocore Sources"
	_prepare_tianocore_sources
	echo
	
	msg "Prepare OpenSSL ${_OPENSSL_VERSION} Sources"
	_prepare_openssl_udk_dir
	echo
	
}

build() {
	
	_bail_out
	
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
	
	if [[ "${CARCH}" == "x86_64" ]]; then
		msg "Unset all compiler FLAGS"
		unset CFLAGS
		unset CPPFLAGS
		unset CXXFLAGS
		unset LDFLAGS
		unset MAKEFLAGS
		
		msg "Compile OVMF X64 binary"
		"${_UDK_DIR}/OvmfPkg/build.sh" -a "X64" -b "${_UDK_TARGET}" -t "${_COMPILER}" -D "SECURE_BOOT_ENABLE=TRUE" -D "FD_SIZE_2MB" --enable-flash
		echo
	fi
	
	msg "Unset all compiler FLAGS"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	msg "Compile OVMF IA32 binary"
	"${_UDK_DIR}/OvmfPkg/build.sh" -a "IA32" -b "${_UDK_TARGET}" -t "${_COMPILER}" -D "SECURE_BOOT_ENABLE=TRUE" -D "FD_SIZE_2MB" --enable-flash
	echo
	
}

package() {
	
	_setup_env_vars
	
	if [[ "${CARCH}" == "x86_64" ]]; then
		msg "Install the OVMF X64 image"
		install -d "${pkgdir}/usr/share/ovmf/x64/"
		install -D -m0644 "${_UDK_DIR}/Build/${_UDK_OVMF_X64_PKG}/${_UDK_TARGET}_${_COMPILER}/FV/OVMF.fd" "${pkgdir}/usr/share/ovmf/x64/ovmf_x64.bin"
		install -D -m0644 "${_UDK_DIR}/Build/${_UDK_OVMF_X64_PKG}/${_UDK_TARGET}_${_COMPILER}/FV/OVMF_CODE.fd" "${pkgdir}/usr/share/ovmf/x64/ovmf_code_x64.bin"
		install -D -m0644 "${_UDK_DIR}/Build/${_UDK_OVMF_X64_PKG}/${_UDK_TARGET}_${_COMPILER}/FV/OVMF_VARS.fd" "${pkgdir}/usr/share/ovmf/x64/ovmf_vars_x64.bin"
	fi
	
	msg "Install the OVMF IA32 image"
	install -d "${pkgdir}/usr/share/ovmf/ia32/"
	install -D -m0644 "${_UDK_DIR}/Build/${_UDK_OVMF_IA32_PKG}/${_UDK_TARGET}_${_COMPILER}/FV/OVMF.fd" "${pkgdir}/usr/share/ovmf/ia32/ovmf_ia32.bin"
	install -D -m0644 "${_UDK_DIR}/Build/${_UDK_OVMF_IA32_PKG}/${_UDK_TARGET}_${_COMPILER}/FV/OVMF_CODE.fd" "${pkgdir}/usr/share/ovmf/ia32/ovmf_code_ia32.bin"
	install -D -m0644 "${_UDK_DIR}/Build/${_UDK_OVMF_IA32_PKG}/${_UDK_TARGET}_${_COMPILER}/FV/OVMF_VARS.fd" "${pkgdir}/usr/share/ovmf/ia32/ovmf_vars_ia32.bin"
	
}
