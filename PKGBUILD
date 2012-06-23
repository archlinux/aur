# Maintainer: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_USE_TIANOCORE_UDK_LIBS="1"
_USE_TIANO_GIT="0"

# _GNU_EFI_LIB_DIR="/usr/lib"

_actualname="refind"
_pkgname="${_actualname}-efi-x86_64"
pkgname="${_pkgname}-git"

pkgver=20120623
pkgrel=1
pkgdesc="Rod Smith's fork of rEFIt UEFI Boot Manager - GIT Development Version"
url="http://www.rodsbooks.com/refind/index.html"
arch=('any')
license=('GPL3' 'custom')

makedepends=('git')

if [[ "${_USE_TIANOCORE_UDK_LIBS}" == "1" ]]; then
	makedepends+=('python2')
	
	if [[ "${_USE_TIANO_GIT}" != "1" ]]; then
		makedepends+=('subversion')
	fi
else
	makedepends+=('gnu-efi>=3.0q')
fi

depends=('dosfstools' 'efibootmgr')
optdepends=('mactel-boot: For bless command in Apple Mac systems')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

replaces=('refind-x86_64-git')

backup=('boot/efi/EFI/arch/refind/refind.conf'
        'boot/efi/EFI/arch/refind/refind_linux.conf')

options=('!strip' 'docs')
install="${_pkgname}.install"

source=('refind_include_more_shell_paths.patch'
        'refind_linux.conf')

sha256sums=('d1bc373c10cf2e17d436d14e080d1daa4d25d51c4d53e477b68417a2b3f4722c'
            '9aac6e65018965ba182ec2d246d37fc5f9269ae96504956d8a51355c3ba1b62f')

_gitroot="git://git.code.sf.net/p/refind/code"
_gitname="${_actualname}"
_gitbranch="master"

_update_tianocore_udk_git() {
	
	if [[ -d "${srcdir}/${_TIANO_DIR_}/${_DIR_}" ]]; then
		cd "${srcdir}/${_TIANO_DIR_}/${_DIR_}"
		git reset --hard
		git pull --depth=1 origin "${_gitbranch}:${_gitbranch}"
		git checkout "${_gitbranch}"
		echo
	else
		cd "${srcdir}/${_TIANO_DIR_}/"
		git clone --depth=1 "git://tianocore.git.sourceforge.net/gitroot/tianocore/edk2-${_DIR_}" "${srcdir}/${_TIANO_DIR_}/${_DIR_}"
		cd "${srcdir}/${_TIANO_DIR_}/${_DIR_}"
		git checkout "${_gitbranch}"
		echo
	fi
	
	unset _DIR_
	
}

_update_tianocore_udk_svn() {
	
	if [[ -d "${srcdir}/${_TIANO_DIR_}/${_DIR_}" ]]; then
		cd "${srcdir}/${_TIANO_DIR_}/${_DIR_}"
		svn update
		echo
	else
		cd "${srcdir}/${_TIANO_DIR_}/"
		svn checkout "https://edk2.svn.sourceforge.net/svnroot/edk2/trunk/edk2/${_DIR_}" "${srcdir}/${_TIANO_DIR_}/${_DIR_}"
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
	
	if [[ "${_USE_TIANOCORE_UDK_LIBS}" == "1" ]]; then
		if [[ "${_USE_TIANO_GIT}" == "1" ]]; then
			_D_="git"
		else
			_D_="svn"
		fi
		
		_TIANO_DIR_="tianocore-udk-${_D_}"
		
		mkdir -p "${srcdir}/${_TIANO_DIR_}"
		cd "${srcdir}/${_TIANO_DIR_}"
		
		# for _DIR_ in BaseTools MdePkg MdeModulePkg IntelFrameworkPkg IntelFrameworkModulePkg EdkCompatibilityPkg ; do
		for _DIR_ in BaseTools MdePkg MdeModulePkg IntelFrameworkPkg ; do
			"_update_tianocore_udk_${_D_}"
		done
		
		unset _DIR_
		echo
		
		rm -f "${srcdir}/${_TIANO_DIR_}/edksetup.sh" || true
		curl --ipv4 -fLC - --retry 3 --retry-delay 3 -o "${srcdir}/${_TIANO_DIR_}/edksetup.sh" "https://edk2.svn.sourceforge.net/svnroot/edk2/trunk/edk2/edksetup.sh"
		chmod +x "${srcdir}/${_TIANO_DIR_}/edksetup.sh"
		echo
		
	fi
	
	echo
	
}

_build_using_tianocore_udk() {
	
	rm -rf "${srcdir}/${_TIANO_DIR_}_build/" || true
	cp -r "${srcdir}/${_TIANO_DIR_}" "${srcdir}/${_TIANO_DIR_}_build"
	
	cd "${srcdir}/${_TIANO_DIR_}_build"
	echo
	
	## Setup UDK Environment variables
	export _UDK_DIR_="${srcdir}/${_TIANO_DIR_}_build"
	export EDK_TOOLS_PATH="${_UDK_DIR_}/BaseTools"
	export _UDK_TARGET_="MdePkg/MdePkg.dsc"
	
	## Cleanup UDK config files
	rm -rf "${_UDK_DIR_}/Build" || true
	rm -rf "${_UDK_DIR_}/Conf" || true
	
	mkdir -p "${_UDK_DIR_}/Conf"
	mkdir -p "${_UDK_DIR_}/Build"
	
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
	sed "s|ACTIVE_PLATFORM       = Nt32Pkg/Nt32Pkg.dsc|ACTIVE_PLATFORM       = ${_UDK_TARGET_}|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	sed "s|TARGET                = DEBUG|TARGET                = RELEASE|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	sed "s|TARGET_ARCH           = IA32|TARGET_ARCH           = X64|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	sed "s|TOOL_CHAIN_TAG        = MYTOOLS|TOOL_CHAIN_TAG        = GCC46|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	
	## Setup UDK Environment
	source "${_UDK_DIR_}/edksetup.sh" BaseTools
	echo
	
	## Compile UDK BaseTools
	make -C "${EDK_TOOLS_PATH}"
	echo
	
	## Compile UDK Libraries
	"${EDK_TOOLS_PATH}/BinWrappers/PosixLike/build" -p "${_UDK_DIR_}/${_UDK_TARGET_}" -a X64 -b RELEASE -t GCC46
	echo
	
	cd "${srcdir}/${_gitname}_build"
	echo
	
	## Fix UDK Path in rEFInd Makefiles
	sed "s|EDK2BASE = /usr/local/UDK2010/MyWorkSpace|EDK2BASE = ${_UDK_DIR_}|g" -i "${srcdir}/${_gitname}_build/Make.tiano" || true
	sed "s|EDK2BASE = /usr/local/UDK2010/MyWorkSpace|EDK2BASE = ${_UDK_DIR_}|g" -i "${srcdir}/${_gitname}_build/filesystems/Make.tiano" || true
	echo
	
	## Fix UDK Target Platform in rEFInd Makefiles
	sed 's|EFILIB          = $(EDK2BASE)/Build/MdeModule/|EFILIB          = $(EDK2BASE)/Build/Mde/|g' -i "${srcdir}/${_gitname}_build/refind/Make.tiano" || true
	sed 's|EFILIB          = $(EDK2BASE)/Build/MdeModule/|EFILIB          = $(EDK2BASE)/Build/Mde/|g' -i "${srcdir}/${_gitname}_build/filesystems/Make.tiano" || true
	echo
	
	make clean || true
	echo
	
	make tiano
	echo
	
	make fs
	echo
	
	## Unset UDK specific ENV variables
	unset EDK_TOOLS_PATH
	unset _UDK_DIR_
	echo
	
}

_build_using_gnu-efi() {
	
	sed 's|/usr/local/include/efi|/usr/include/efi|g' -i "${srcdir}/${_gitname}_build/Make.common" || true
	sed 's|/usr/local/lib|/usr/lib|g' -i "${srcdir}/${_gitname}_build/Make.common" || true
	echo
	
	sed 's|make -C $(EFILIB_DIR) clean -f Make.tiano|#make -C $(EFILIB_DIR) clean -f Make.tiano|g' -i "${srcdir}/${_gitname}_build/Makefile"
	echo
	
	make clean || true
	echo
	
	make
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
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build"
	echo
	
	patch -Np1 -i "${srcdir}/refind_include_more_shell_paths.patch"
	echo
	
	rm -f "${srcdir}/${_gitname}_build/USED_TIANO.txt" || true
	rm -f "${srcdir}/${_gitname}_build/USED_GNU-EFI.txt" || true
	
	if [[ "${_USE_TIANOCORE_UDK_LIBS}" == "1" ]]; then
		touch "${srcdir}/${_gitname}_build/USED_TIANO.txt"
		
		_build_using_tianocore_udk
	else
		"${srcdir}/${_gitname}_build/USED_GNU-EFI.txt"
		
		_build_using_gnu-efi
	fi
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build"
	
	## Install rEFInd x86_64 UEFI application
	install -d "${pkgdir}/boot/efi/EFI/arch/refind/"
	install -D -m0644 "${srcdir}/${_gitname}_build/refind/refind_x64.efi" "${pkgdir}/boot/efi/EFI/arch/refind/refindx64.efi"
	
	## Install x86_64 UEFI drivers built from rEFInd if available
	if [[ -e "${srcdir}/${_gitname}_build/USED_TIANO.txt" ]]; then
		install -d "${pkgdir}/boot/efi/EFI/arch/refind/drivers_x64/"
		install -D -m0644 "${srcdir}/${_gitname}_build/drivers"/*_x64.efi "${pkgdir}/boot/efi/EFI/arch/refind/drivers_x64/"
	fi
	
	## Install rEFInd config file
	install -D -m0644 "${srcdir}/${_gitname}_build/refind.conf-sample" "${pkgdir}/boot/efi/EFI/arch/refind/refind.conf"
	install -D -m0644 "${srcdir}/refind_linux.conf" "${pkgdir}/boot/efi/EFI/arch/refind/refind_linux.conf"
	
	## Install rEFInd icons
	install -d "${pkgdir}/boot/efi/EFI/arch/refind/icons/"
	install -D -m0644 "${srcdir}/${_gitname}_build/icons"/* "${pkgdir}/boot/efi/EFI/arch/refind/icons/"
	
	## Install rEFInd docs
	install -d "${pkgdir}/usr/share/refind/docs/html/"
	install -d "${pkgdir}/usr/share/refind/docs/Styles/"
	install -D -m0644 "${srcdir}/${_gitname}_build/docs/refind"/* "${pkgdir}/usr/share/refind/docs/html/"
	install -D -m0644 "${srcdir}/${_gitname}_build/docs/Styles"/* "${pkgdir}/usr/share/refind/docs/Styles/"
	install -D -m0644 "${srcdir}/${_gitname}_build/README.txt" "${pkgdir}/usr/share/refind/docs/README.txt"
	install -D -m0644 "${srcdir}/${_gitname}_build/NEWS.txt" "${pkgdir}/usr/share/refind/docs/NEWS.txt"
	rm -f "${pkgdir}/usr/share/refind/docs/html/.DS_Store" || true
	
	## Install rEFIt license file, since rEFInd is a fork of rEFIt
	install -d "${pkgdir}/usr/share/licenses/refind/"
	install -D -m0644 "${srcdir}/${_gitname}_build/LICENSE.txt" "${pkgdir}/usr/share/licenses/refind/LICENSE"
	
}
