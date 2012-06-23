# Maintainer: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_USE_TIANOCORE_UDK_LIBS="1"

# _GNU_EFI_LIB_DIR="/usr/lib"

_actualname="refind"
_pkgname="${_actualname}-efi-x86_64"
pkgname="${_pkgname}-git"

pkgver=20120622
pkgrel=1
pkgdesc="Rod Smith's fork of rEFIt UEFI Boot Manager - GIT Development Version"
url="http://www.rodsbooks.com/refind/index.html"
arch=('any')
license=('GPL3' 'custom')

makedepends=('git')

if [[ "${_USE_TIANOCORE_UDK_LIBS}" == "1" ]]; then
	makedepends+=('python2')
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
	
	if [[ -d "${srcdir}/tianocore-udk-git/${_DIR_}" ]]; then
		cd "${srcdir}/tianocore-udk-git/${_DIR_}"
		git reset --hard
		git fetch
		git checkout "${_gitbranch}"
		git merge "remotes/origin/${_gitbranch}"
		echo
	else
		git clone "git://tianocore.git.sourceforge.net/gitroot/tianocore/edk2-${_DIR_}" "${srcdir}/tianocore-udk-git/${_DIR_}"
		cd "${srcdir}/tianocore-udk-git/${_DIR_}"
		git checkout "${_gitbranch}"
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
		mkdir -p "${srcdir}/tianocore-udk-git"
		cd "${srcdir}/tianocore-udk-git"
		
		_DIR_="BaseTools"
		_update_tianocore_udk_git
		
		_DIR_="MdePkg"
		_update_tianocore_udk_git
		
		_DIR_="MdeModulePkg"
		_update_tianocore_udk_git
		
		_DIR_="IntelFrameworkPkg"
		_update_tianocore_udk_git
		
		echo
		
	fi
	
	echo
	
}

_build_using_tianocore_udk() {
	
	rm -rf "${srcdir}/tianocore-udk-git_build/" || true
	cp -r "${srcdir}/tianocore-udk-git" "${srcdir}/tianocore-udk-git_build"
	
	cd "${srcdir}/tianocore-udk-git_build"
	echo
	
	export _UDK_DIR_="${srcdir}/tianocore-udk-git_build"
	export EDK_TOOLS_PATH="${_UDK_DIR_}/BaseTools"
	
	rm -rf "${_UDK_DIR_}/Build" || true
	rm -rf "${_UDK_DIR_}/Conf" || true
	
	## Use python2
	sed 's|python |python2 |g' -i "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"/* || true
	sed 's|python |python2 |g' -i "${EDK_TOOLS_PATH}/Tests/GNUmakefile"
	
	## Fix GCC Warning as error
	sed 's|-Werror |-Wno-error -Wno-unused-but-set-variable |g' -i "${EDK_TOOLS_PATH}/Source/C/Makefiles/header.makefile" || true
	sed 's|-Werror |-Wno-error -Wno-unused-but-set-variable |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	
	## Fix GCC 4.7 error - gcc: error: unrecognized command line option ‘-melf_x86_64’
	# sed 's| -m elf_x86_64| -melf_x86_64|g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	sed 's| -m64 --64 -melf_x86_64| -m64|g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	sed 's|--64 | |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	sed 's| -m64 -melf_x86_64| -m64|g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	# sed 's| -melf_x86_64| -Wl,-melf_x86_64|g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	
	## Remove GCC -g debug option and add -0s -mabi=ms
	sed 's|DEFINE GCC_ALL_CC_FLAGS            = -g |DEFINE GCC_ALL_CC_FLAGS            = -Os -mabi=ms |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	sed 's|DEFINE GCC44_ALL_CC_FLAGS            = -g |DEFINE GCC44_ALL_CC_FLAGS            = -Os -mabi=ms |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	
	source "${_UDK_DIR_}/edksetup.sh" BaseTools
	echo
	
	make -C "${EDK_TOOLS_PATH}"
	echo
	
	"${EDK_TOOLS_PATH}/BinWrappers/PosixLike/build" -p "${_UDK_DIR}/MdeModulePkg/MdeModulePkg.dsc" -a X64 -b RELEASE -t GCC46
	echo
	
	cd "${srcdir}/${_gitname}_build"
	echo
	
	sed "s|EDK2BASE = /usr/local/UDK2010/MyWorkSpace|EDK2BASE = ${_UDK_DIR_}|g" -i "${srcdir}/${_gitname}_build/Make.tiano" || true
	sed "s|EDK2BASE = /usr/local/UDK2010/MyWorkSpace|EDK2BASE = ${_UDK_DIR_}|g" -i "${srcdir}/${_gitname}_build/filesystems/Make.tiano" || true
	echo
	
	make tiano
	echo
	
	make fs
	echo
	
}

_build_using_gnu-efi() {
	
	sed 's|/usr/local/include/efi|/usr/include/efi|g' -i "${srcdir}/${_gitname}_build/Make.common" || true
	sed 's|/usr/local/lib|/usr/lib|g' -i "${srcdir}/${_gitname}_build/Make.common" || true
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
	
	make clean || true
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
	
	## install the rEFInd x86_64 UEFI app
	install -d "${pkgdir}/boot/efi/EFI/arch/refind/"
	install -D -m0644 "${srcdir}/${_gitname}_build/refind/refind_x64.efi" "${pkgdir}/boot/efi/EFI/arch/refind/refindx64.efi"
	
	## install the rEFInd config file
	install -D -m0644 "${srcdir}/${_gitname}_build/refind.conf-sample" "${pkgdir}/boot/efi/EFI/arch/refind/refind.conf"
	install -D -m0644 "${srcdir}/refind_linux.conf" "${pkgdir}/boot/efi/EFI/arch/refind/refind_linux.conf"
	
	## install the rEFInd icons
	install -d "${pkgdir}/boot/efi/EFI/arch/refind/icons/"
	install -D -m0644 "${srcdir}/${_gitname}_build/icons"/* "${pkgdir}/boot/efi/EFI/arch/refind/icons/"
	
	## install the rEFInd docs
	install -d "${pkgdir}/usr/share/refind/docs/html/"
	install -d "${pkgdir}/usr/share/refind/docs/Styles/"
	install -D -m0644 "${srcdir}/${_gitname}_build/docs/refind"/* "${pkgdir}/usr/share/refind/docs/html/"
	install -D -m0644 "${srcdir}/${_gitname}_build/docs/Styles"/* "${pkgdir}/usr/share/refind/docs/Styles/"
	install -D -m0644 "${srcdir}/${_gitname}_build/README.txt" "${pkgdir}/usr/share/refind/docs/README.txt"
	install -D -m0644 "${srcdir}/${_gitname}_build/NEWS.txt" "${pkgdir}/usr/share/refind/docs/NEWS.txt"
	rm -f "${pkgdir}/usr/share/refind/docs/html/.DS_Store" || true
	
	## install the rEFIt license file, since rEFInd is a fork of rEFIt
	install -d "${pkgdir}/usr/share/licenses/refind/"
	install -D -m0644 "${srcdir}/${_gitname}_build/LICENSE.txt" "${pkgdir}/usr/share/licenses/refind/LICENSE"
	
}
