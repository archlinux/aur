# Maintainer: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

#######
_TIANOCORE_SVN_URL="https://edk2.svn.sourceforge.net/svnroot/edk2/branches/UDK2010.SR1"
_TIANOCORE_PKG="Mde"
_TIANOCORE_TARGET="RELEASE"
_UDK_TARGET="${_TIANOCORE_PKG}Pkg/${_TIANOCORE_PKG}Pkg.dsc"
_COMPILER="GCC46"
#######

_pkgname="refind-efi-tianocore"
pkgname="${_pkgname}-git"

pkgver=20121112
pkgrel=1
pkgdesc="Rod Smith's fork of rEFIt UEFI Boot Manager - built with Tianocore UDK libs - GIT Version"
url="http://www.rodsbooks.com/refind/index.html"
arch=('any')
license=('GPL3' 'custom')

makedepends=('git' 'subversion' 'python2')
depends=('dosfstools' 'efibootmgr')
optdepends=('mactel-boot: For bless command in Apple Mac systems')

options=('!strip' 'docs' '!makeflags')

conflicts=('refind-efi' "${_pkgname}")
provides=('refind-efi' "${_pkgname}")

source=('UDK-MdePkg-Revert-PathNodeCount.patch'
        'refind_include_more_shell_paths.patch'
        'refind_linux.conf')

sha1sums=('4d1992699f9b48dd2b7e6bd6c0b25fc065f75894'
          '7ed2870ee76f42a7bed51410b3cae4da3bc2de2a'
          '3d53eb615c3363d45feb95b9bfbf1d5491bf1c24')

_gitroot="git://git.code.sf.net/p/refind/code"
_gitname="refind"
_gitbranch="master"

_update_tianocore_udk_svn() {
	
	if [[ -d "${srcdir}/${_TIANO_DIR_}/${_DIR_}" ]]; then
		cd "${srcdir}/${_TIANO_DIR_}/${_DIR_}"
		svn update || true
		echo
	else
		cd "${srcdir}/${_TIANO_DIR_}/"
		svn checkout "${_TIANOCORE_SVN_URL}/${_DIR_}" "${srcdir}/${_TIANO_DIR_}/${_DIR_}"
		echo
	fi
	
	unset _DIR_
	
}

_update_git() {
	
	cd "${srcdir}/"
	
	msg "Connecting to GIT server...."
	
	if [[ -d "${srcdir}/${_gitname}/" ]]; then
		cd "${srcdir}/${_gitname}/"
		git reset --hard
		git fetch
		git checkout "${_gitbranch}"
		git merge "remotes/origin/${_gitbranch}"
		msg "The local GIT repo has been updated."
	else
		git clone "${_gitroot}" "${_gitname}"
		cd "${srcdir}/${_gitname}/"
		git checkout "${_gitbranch}"
		msg "GIT checkout done or server timeout"
	fi
	
	echo
	
	_TIANO_DIR_="tianocore-udk-svn"
	
	mkdir -p "${srcdir}/${_TIANO_DIR_}/"
	cd "${srcdir}/${_TIANO_DIR_}/"
	
	for _DIR_ in BaseTools MdePkg MdeModulePkg IntelFrameworkPkg IntelFrameworkModulePkg EdkCompatibilityPkg ; do
		_update_tianocore_udk_svn
	done
	
	unset _DIR_
	
}

_tianocore_udk_common() {
	
	## Unset all FLAGS
	unset CFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	
	## Setup UDK Environment variables
	export _UDK_DIR="${srcdir}/${_TIANO_DIR_}_build"
	export EDK_TOOLS_PATH="${_UDK_DIR}/BaseTools"
	
	rm -rf "${_UDK_DIR}/" || true
	cp -r "${srcdir}/${_TIANO_DIR_}" "${_UDK_DIR}"
	
	cd "${_UDK_DIR}/"
	
	## Fix PcdMaximumPathNodeCount compile error
	patch -Np1 -R -i "${srcdir}/UDK-MdePkg-Revert-PathNodeCount.patch"
	echo
	
	## Cleanup UDK config files
	rm -rf "${_UDK_DIR}/Build/" || true
	rm -rf "${_UDK_DIR}/Conf/" || true
	mkdir -p "${_UDK_DIR}/Conf/"
	mkdir -p "${_UDK_DIR}/Build/"
	
	## UDK BaseTools requires python2
	sed 's|python |python2 |g' -i "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"/* || true
	sed 's|python |python2 |g' -i "${EDK_TOOLS_PATH}/Tests/GNUmakefile"
	
	## Fix GCC Warning as error
	sed 's|-Werror |-Wno-error -Wno-unused-but-set-variable |g' -i "${EDK_TOOLS_PATH}/Source/C/Makefiles/header.makefile" || true
	sed 's|-Werror |-Wno-error -Wno-unused-but-set-variable |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	
	## Fix GCC 4.7 error - gcc: error: unrecognized command line option '-melf_x86_64'
	sed 's| -m64 --64 -melf_x86_64| -m64|g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	sed 's|--64 | |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	sed 's| -m64 -melf_x86_64| -m64|g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	
	## Remove GCC -g debug option and add -0s -mabi=ms
	sed 's|DEFINE GCC_ALL_CC_FLAGS            = -g |DEFINE GCC_ALL_CC_FLAGS            = -Os -mabi=ms |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	sed 's|DEFINE GCC44_ALL_CC_FLAGS            = -g |DEFINE GCC44_ALL_CC_FLAGS            = -Os -mabi=ms |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	
	## Fix UDK Target Platform
	sed "s|ACTIVE_PLATFORM       = Nt32Pkg/Nt32Pkg.dsc|ACTIVE_PLATFORM       = ${_UDK_TARGET}|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	sed "s|TARGET                = DEBUG|TARGET                = ${_TIANOCORE_TARGET}|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	sed "s|TOOL_CHAIN_TAG        = MYTOOLS|TOOL_CHAIN_TAG        = ${_COMPILER}|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	
	## Setup UDK Environment
	chmod +x "${_UDK_DIR}/BaseTools/BuildEnv"
	source "${_UDK_DIR}/BaseTools/BuildEnv" BaseTools
	echo
	
	## Compile UDK BaseTools
	make -C "${EDK_TOOLS_PATH}"
	echo
	
	## Compile UDK x86_64-UEFI Libraries
	"${EDK_TOOLS_PATH}/BinWrappers/PosixLike/build" -p "${_UDK_TARGET}" -a "X64" -b "${_TIANOCORE_TARGET}" -t "${_COMPILER}"
	echo
	
	## Compile UDK i386-UEFI Libraries
	"${EDK_TOOLS_PATH}/BinWrappers/PosixLike/build" -p "${_UDK_TARGET}" -a "IA32" -b "${_TIANOCORE_TARGET}" -t "${_COMPILER}"
	echo
	
	## Fix UDK Target ARCH for rEFInd
	sed "s|IA32|X64 IA32|g" -i "${_UDK_DIR}/Conf/target.txt" || true
	
}

_refind_changes() {
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build/"
	
	patch -Np1 -i "${srcdir}/refind_include_more_shell_paths.patch"
	echo
	
}

_build_refind-efi-common() {
	
	## Unset all FLAGS
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	
	rm -rf "${srcdir}/${_gitname}_build_${_UEFI_ARCH}/" || true
	cp -r "${srcdir}/${_gitname}_build" "${srcdir}/${_gitname}_build_${_UEFI_ARCH}/"
	
	cd "${srcdir}/${_gitname}_build_${_UEFI_ARCH}/"
	
	## Fix UDK Path in rEFInd Makefiles
	sed "s|EDK2BASE = /usr/local/UDK2010/MyWorkSpace|EDK2BASE = ${_UDK_DIR}|g" -i "${srcdir}/${_gitname}_build_${_UEFI_ARCH}/Make.tiano" || true
	sed "s|EDK2BASE = /usr/local/UDK2010/MyWorkSpace|EDK2BASE = ${_UDK_DIR}|g" -i "${srcdir}/${_gitname}_build_${_UEFI_ARCH}/filesystems/Make.tiano" || true
	
	## Clean any existing binary files in git repo
	ARCH="${_UEFI_ARCH}" make clean || true
	echo
	
	## Compile refind.efi
	ARCH="${_UEFI_ARCH}" make tiano
	echo
	
	## Compile UEFI FS drivers
	ARCH="${_UEFI_ARCH}" make fs
	echo
	
}

build() {
	
	if [[ "${CARCH}" != "x86_64" ]]; then
		echo "${pkgname} package can be built only in a x86_64 system. Exiting."
		exit 1
	else
		_update_git
		echo
	fi
	
	_tianocore_udk_common
	echo
	
	_refind_changes
	echo
	
	_UEFI_ARCH="x86_64"
	_build_refind-efi-common
	echo
	
	_UEFI_ARCH="ia32"
	_build_refind-efi-common
	echo
	
}

package() {
	
	## install the rEFInd UEFI applications
	install -d "${pkgdir}/usr/lib/refind/"
	install -D -m0644 "${srcdir}/${_gitname}_build_x86_64/refind/refind_x64.efi" "${pkgdir}/usr/lib/refind/refindx64.efi"
	install -D -m0644 "${srcdir}/${_gitname}_build_ia32/refind/refind_ia32.efi" "${pkgdir}/usr/lib/refind/refindia32.efi"
	
	## Install UEFI drivers built from rEFInd
	install -d "${pkgdir}/usr/lib/refind/drivers_x64/"
	install -d "${pkgdir}/usr/lib/refind/drivers_ia32/"
	install -D -m0644 "${srcdir}/${_gitname}_build_x86_64/drivers"/*_x64.efi "${pkgdir}/usr/lib/refind/drivers_x64/"
	install -D -m0644 "${srcdir}/${_gitname}_build_ia32/drivers"/*_ia32.efi "${pkgdir}/usr/lib/refind/drivers_ia32/"
	
	## install the rEFInd config file
	install -d "${pkgdir}/usr/lib/refind/config/"
	install -D -m0644 "${srcdir}/${_gitname}_build/refind.conf-sample" "${pkgdir}/usr/lib/refind/config/refind.conf"
	install -D -m0644 "${srcdir}/refind_linux.conf" "${pkgdir}/usr/lib/refind/config/refind_linux.conf"
	
	## install the rEFInd icons
	install -d "${pkgdir}/usr/share/refind/icons/"
	install -D -m0644 "${srcdir}/${_gitname}_build/icons"/* "${pkgdir}/usr/share/refind/icons/"
	
	## install the rEFInd docs
	install -d "${pkgdir}/usr/share/refind/docs/html/"
	install -d "${pkgdir}/usr/share/refind/docs/Styles/"
	install -D -m0644 "${srcdir}/${_gitname}_build/docs/refind"/* "${pkgdir}/usr/share/refind/docs/html/"
	install -D -m0644 "${srcdir}/${_gitname}_build/docs/Styles"/* "${pkgdir}/usr/share/refind/docs/Styles/"
	install -D -m0644 "${srcdir}/${_gitname}_build/README.txt" "${pkgdir}/usr/share/refind/docs/README"
	install -D -m0644 "${srcdir}/${_gitname}_build/NEWS.txt" "${pkgdir}/usr/share/refind/docs/NEWS"
	rm -f "${pkgdir}/usr/share/refind/docs/html/.DS_Store" || true
	
	## install the rEFIt license file, since rEFInd is a fork of rEFIt
	install -d "${pkgdir}/usr/share/licenses/refind/"
	install -D -m0644 "${srcdir}/${_gitname}_build/LICENSE.txt" "${pkgdir}/usr/share/licenses/refind/LICENSE"
	
}
