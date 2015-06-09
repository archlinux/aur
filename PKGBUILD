# Maintainer: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_USE_GNU_EFI="1"

#######
[[ "${CARCH}" == "x86_64" ]] && _TIANO_ARCH="X64"
[[ "${CARCH}" == "i686" ]] && _TIANO_ARCH="IA32"

[[ "${CARCH}" == "x86_64" ]] && _TIANO_S_ARCH="x64"
[[ "${CARCH}" == "i686" ]] && _TIANO_S_ARCH="ia32"
#######

__pkgname="refind"
_pkgname="${__pkgname}-efi"
pkgname="${_pkgname}-git"

pkgver=0.8.7.3.374.d738a7a
pkgrel=1
pkgdesc="Rod Smith's fork of rEFIt UEFI Boot Manager - GIT Version"
url="http://www.rodsbooks.com/refind/index.html"
arch=('x86_64' 'i686')
license=('GPL3' 'custom')

makedepends=('git')
depends=('bash' 'dosfstools' 'efibootmgr')
optdepends=('mactel-boot: For bless command in Apple Mac systems'
            'imagemagick: For refind-mkfont script')

options=('!strip' 'docs' '!makeflags')

conflicts=('refind-efi')
provides=("refind=${pkgver}" "refind-efi=${pkgver}")

install="${_pkgname}.install"

source=("refind::git+http://git.code.sf.net/p/refind/code#branch=master"
        'refind_linux.conf')

if [[ "${_USE_GNU_EFI}" == "1" ]]; then
	
	pkgdesc="${pkgdesc} - Built with GNU-EFI libs"
	makedepends=('gnu-efi-libs')
	
else
	
	pkgdesc="${pkgdesc} - Built with Tianocore UDK libs"
	makedepends+=('subversion' 'python2')
	
	_TIANOCORE_SVN_URL="https://svn.code.sf.net/p/edk2/code/branches/UDK2014"
	_TIANO_DIR_="tianocore-udk-2014-svn"
	_TIANO_SVN_REV_="15322"
	
	_TIANOCORE_PKG="Mde"
	_TIANOCORE_TARGET="RELEASE"
	_UDK_TARGET="${_TIANOCORE_PKG}Pkg/${_TIANOCORE_PKG}Pkg.dsc"
	_COMPILER="GCC48"
	
	source+=("${_TIANO_DIR_}_BaseTools::svn+https://svn.code.sf.net/p/edk2-buildtools/code/trunk/BaseTools")
	
	## BaseTools MdePkg MdeModulePkg IntelFrameworkPkg IntelFrameworkModulePkg
	for _DIR_ in MdePkg MdeModulePkg IntelFrameworkPkg IntelFrameworkModulePkg ; do
		source+=("${_TIANO_DIR_}_${_DIR_}::svn+${_TIANOCORE_SVN_URL}/${_DIR_}#revision=${_TIANO_SVN_REV_}")
	done
	
fi

sha1sums=('SKIP'
          'b6bc8653eb15a650b557db177378e65f6cbd52a3')

pkgver() {
	
	cd "${srcdir}/${__pkgname}/"
	
	_ACTUAL_REFIND_VER="$(grep 'rEFInd Version' "${srcdir}/${__pkgname}/refind/main.c" | awk '{print $4}' | sed -e 's|");||g')"
	
	if [[ "${_USE_GNU_EFI}" == "1" ]]; then
		echo "${_ACTUAL_REFIND_VER}.$(git rev-list --count HEAD).$(git describe --always)" | sed -e 's|-|.|g'
	else
		cd "${srcdir}/${_TIANO_DIR_}_MdePkg/"
		_TIANOCORE_SVN_REV="$(svnversion | tr -d [A-z])"
		
		echo "${_ACTUAL_REFIND_VER}.$(git rev-list --count HEAD).$(git describe --always).r${_TIANOCORE_SVN_REV}" | sed -e 's|-|.|g'
		
		unset _TIANOCORE_SVN_REV
	fi
	
	unset _ACTUAL_REFIND_VER
	
}

_setup_tianocore_env_vars() {
	
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
	
	msg "Fix GenFw: ERROR 3000: Invalid, bad symbol definition"
	## http://www.mail-archive.com/edk2-devel@lists.sourceforge.net/msg03625.html
	sed -e 's|_OBJCOPY_FLAGS      =|_OBJCOPY_FLAGS      = -R .eh_frame|g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	
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
	
	msg "Fix UDK Target ARCH for rEFInd"
	sed "s|X64|${_TIANO_ARCH}|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	sed "s|IA32|${_TIANO_ARCH}|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	
	chmod 0755 "${_UDK_DIR}/BaseTools/BuildEnv"
	
}

_prepare_refind_sources() {
	
	rm -rf "${srcdir}/${__pkgname}_build/" || true
	cp -r "${srcdir}/${__pkgname}" "${srcdir}/${__pkgname}_build"
	
	cd "${srcdir}/${__pkgname}_build/"
	
	msg "Clean rEFInd git repo"
	git clean -x -d -f
	echo
	
	if [[ "${_USE_GNU_EFI}" == "1" ]]; then
		msg "Enable GNU_EFI_USE_MS_ABI"
		sed "s|-DEFI_FUNCTION_WRAPPER|-DEFI_FUNCTION_WRAPPER -maccumulate-outgoing-args|g" -i "${srcdir}/${__pkgname}_build/Make.common" || true
		sed "s|-DEFIX64|-DEFIX64 -maccumulate-outgoing-args|g" -i "${srcdir}/${__pkgname}_build/Make.common" || true
		sed "s|-m64|-maccumulate-outgoing-args -m64|g" -i "${srcdir}/${__pkgname}_build/filesystems/Make.gnuefi" || true
	else
		msg "Fix UDK Path in rEFInd Makefiles"
		sed "s|EDK2BASE = /usr/local/UDK2014/MyWorkSpace|EDK2BASE = ${_UDK_DIR}|g" -i "${srcdir}/${__pkgname}_build/Make.tiano" || true
		sed "s|EDK2BASE = /usr/local/UDK2014/MyWorkSpace|EDK2BASE = ${_UDK_DIR}|g" -i "${srcdir}/${__pkgname}_build/refind/Make.tiano" || true
		sed "s|EDK2BASE = /usr/local/UDK2014/MyWorkSpace|EDK2BASE = ${_UDK_DIR}|g" -i "${srcdir}/${__pkgname}_build/filesystems/Make.tiano" || true
		sed "s|EDK2BASE = /usr/local/UDK2014/MyWorkSpace|EDK2BASE = ${_UDK_DIR}|g" -i "${srcdir}/${__pkgname}_build/gptsync/Make.tiano" || true
		sed "s|EDK2BASE = /usr/local/UDK2010/MyWorkSpace|EDK2BASE = ${_UDK_DIR}|g" -i "${srcdir}/${__pkgname}_build/Make.tiano" || true
		sed "s|EDK2BASE = /usr/local/UDK2010/MyWorkSpace|EDK2BASE = ${_UDK_DIR}|g" -i "${srcdir}/${__pkgname}_build/refind/Make.tiano" || true
		sed "s|EDK2BASE = /usr/local/UDK2010/MyWorkSpace|EDK2BASE = ${_UDK_DIR}|g" -i "${srcdir}/${__pkgname}_build/filesystems/Make.tiano" || true
		sed "s|EDK2BASE = /usr/local/UDK2010/MyWorkSpace|EDK2BASE = ${_UDK_DIR}|g" -i "${srcdir}/${__pkgname}_build/gptsync/Make.tiano" || true
		
		msg "Fix GenFw: ERROR 3000: Invalid, refind_x64.dll bad symbol definition"
		sed -e 's|--strip-unneeded|--strip-unneeded -R .eh_frame|g' -i "${srcdir}/${__pkgname}_build/Make.tiano" || true
		sed -e 's|--strip-unneeded|--strip-unneeded -R .eh_frame|g' -i "${srcdir}/${__pkgname}_build/refind/Make.tiano" || true
		sed -e 's|--strip-unneeded|--strip-unneeded -R .eh_frame|g' -i "${srcdir}/${__pkgname}_build/filesystems/Make.tiano"
		sed -e 's|--strip-unneeded|--strip-unneeded -R .eh_frame|g' -i "${srcdir}/${__pkgname}_build/gptsync/Make.tiano" || true
	
		# msg "Fix GenFw: ERROR 3000: Invalid section alignment"
		sed 's|--gc-sections|--gc-sections --build-id=none|g' -i "${srcdir}/${__pkgname}_build/Make.tiano" || true
		sed 's|--gc-sections|--gc-sections --build-id=none|g' -i "${srcdir}/${__pkgname}_build/refind/Make.tiano" || true
		sed 's|--gc-sections|--gc-sections --build-id=none|g' -i "${srcdir}/${__pkgname}_build/filesystems/Make.tiano" || true
		sed 's|--gc-sections|--gc-sections --build-id=none|g' -i "${srcdir}/${__pkgname}_build/gptsync/Make.tiano" || true
		# sed -e 's|--gc-sections|--gc-sections -z max-page-size=0x20|g' -i "${srcdir}/${__pkgname}_build/Make.tiano" || true
		# sed -e 's|--gc-sections|--gc-sections -z max-page-size=0x20|g' -i "${srcdir}/${__pkgname}_build/refind/Make.tiano" || true
		# sed -e 's|--gc-sections|--gc-sections -z max-page-size=0x20|g' -i "${srcdir}/${__pkgname}_build/filesystems/Make.tiano"
		# sed -e 's|--gc-sections|--gc-sections -z max-page-size=0x20|g' -i "${srcdir}/${__pkgname}_build/gptsync/Make.tiano" || true
		# sed -e 's|--strip-unneeded|--section-alignment=0x20 --strip-unneeded|g' -i "${srcdir}/${__pkgname}_build/Make.tiano" || true
		# sed -e 's|--strip-unneeded|--section-alignment=0x20 --strip-unneeded|g' -i "${srcdir}/${__pkgname}_build/refind/Make.tiano" || true
		# sed -e 's|--strip-unneeded|--section-alignment=0x20 --strip-unneeded|g' -i "${srcdir}/${__pkgname}_build/filesystems/Make.tiano"
		# sed -e 's|--strip-unneeded|--section-alignment=0x20 --strip-unneeded|g' -i "${srcdir}/${__pkgname}_build/gptsync/Make.tiano" || true
	fi
	
}

prepare() {
	
	if [[ "${_USE_GNU_EFI}" != "1" ]]; then
		_setup_tianocore_env_vars
		
		msg "Prepare Tianocore Sources"
		_prepare_tianocore_sources
	fi
	
	msg "Prepare rEFInd Sources"
	_prepare_refind_sources
	
}

_build_tianocore_sources() {
	
	_setup_tianocore_env_vars
	
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
	
	msg "Compile UDK Libraries"
	"${EDK_TOOLS_PATH}/BinWrappers/PosixLike/build" -p "${_UDK_TARGET}" -a "${_TIANO_ARCH}" -b "${_TIANOCORE_TARGET}" -t "${_COMPILER}"
	echo
	
}

build() {
	
	if [[ "${_USE_GNU_EFI}" != "1" ]]; then
		_build_tianocore_sources
	fi
	
	cd "${srcdir}/${__pkgname}_build/"
	
	msg "Unset all compiler FLAGS"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	msg "Compile rEFInd UEFI application"
	if [[ "${_USE_GNU_EFI}" == "1" ]]; then
		make gnuefi
		echo
	else
		make tiano
		echo
	fi
	
	cd "${srcdir}/${__pkgname}_build/filesystems/"
	
	msg "Unset all compiler FLAGS"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	msg "Compile UEFI FS drivers"
	if [[ "${_USE_GNU_EFI}" == "1" ]]; then
		make btrfs_gnuefi
		echo
		
		make ext4_gnuefi
		echo
		
		make ext2_gnuefi
		echo
		
		make hfs_gnuefi
		echo
		
		make iso9660_gnuefi
		echo
		
		make reiserfs_gnuefi
		echo
		
		# make xfs_gnuefi
		# echo
	else
		make btrfs
		echo
		
		make ext4
		echo
		
		make ext2
		echo
		
		make hfs
		echo
		
		make iso9660
		echo
		
		make reiserfs
		echo
		
		# make xfs
		# echo
	fi
	
}

package() {
	
	msg "Install the rEFInd UEFI application"
	install -d "${pkgdir}/usr/share/refind/"
	install -D -m0644 "${srcdir}/${__pkgname}_build/refind/refind_${_TIANO_S_ARCH}.efi" "${pkgdir}/usr/share/refind/refind_${_TIANO_S_ARCH}.efi"
	
	msg "Install UEFI drivers built from rEFInd"
	install -d "${pkgdir}/usr/share/refind/drivers_${_TIANO_S_ARCH}/"
	install -D -m0644 "${srcdir}/${__pkgname}_build/drivers_${_TIANO_S_ARCH}"/*.efi "${pkgdir}/usr/share/refind/drivers_${_TIANO_S_ARCH}/"
	
	msg "Install UEFI applications built from rEFInd"
	install -d "${pkgdir}/usr/share/refind/tools_${_TIANO_S_ARCH}"
	install -D -m0644 "${srcdir}/${__pkgname}_build/gptsync/gptsync_${_TIANO_S_ARCH}.efi" "${pkgdir}/usr/share/refind/tools_${_TIANO_S_ARCH}/gptsync_${_TIANO_S_ARCH}.efi"
	
	msg "Install rEFInd helper scripts"
	install -d "${pkgdir}/usr/bin/"
	install -D -m0755 "${srcdir}/${__pkgname}_build/install.sh" "${pkgdir}/usr/bin/refind-install"
	install -D -m0755 "${srcdir}/${__pkgname}_build/mkrlconf.sh" "${pkgdir}/usr/bin/refind-mkrlconf"
	install -D -m0755 "${srcdir}/${__pkgname}_build/mvrefind.sh" "${pkgdir}/usr/bin/refind-mvrefind"
	install -D -m0755 "${srcdir}/${__pkgname}_build/fonts/mkfont.sh" "${pkgdir}/usr/bin/refind-mkfont"
	
	msg "Install the rEFInd sample config files"
	install -D -m0644 "${srcdir}/${__pkgname}_build/refind.conf-sample" "${pkgdir}/usr/share/refind/refind.conf-sample"
	install -D -m0644 "${srcdir}/refind_linux.conf" "${pkgdir}/usr/share/refind/refind_linux.conf-sample"
	
	msg "Install the rEFInd docs"
	install -d "${pkgdir}/usr/share/refind/docs/html/"
	install -d "${pkgdir}/usr/share/refind/docs/Styles/"
	install -D -m0644 "${srcdir}/${__pkgname}_build/docs/refind"/* "${pkgdir}/usr/share/refind/docs/html/"
	install -D -m0644 "${srcdir}/${__pkgname}_build/docs/Styles"/* "${pkgdir}/usr/share/refind/docs/Styles/"
	install -D -m0644 "${srcdir}/${__pkgname}_build/README.txt" "${pkgdir}/usr/share/refind/docs/README.txt"
	install -D -m0644 "${srcdir}/${__pkgname}_build/NEWS.txt" "${pkgdir}/usr/share/refind/docs/NEWS.txt"
	rm -f "${pkgdir}/usr/share/refind/docs/html/.DS_Store" || true
	
	msg "Install the rEFInd fonts"
	install -d "${pkgdir}/usr/share/refind/fonts/"
	install -D -m0644 "${srcdir}/${__pkgname}_build/fonts"/* "${pkgdir}/usr/share/refind/fonts/"
	rm -f "${pkgdir}/usr/share/refind/fonts/mkfont.sh"
	
	msg "Install the rEFInd icons"
	install -d "${pkgdir}/usr/share/refind/icons/"
	install -D -m0644 "${srcdir}/${__pkgname}_build/icons"/* "${pkgdir}/usr/share/refind/icons/"
	
	msg "Install the rEFInd images"
	install -d "${pkgdir}/usr/share/refind/images/"
	install -D -m0644 "${srcdir}/${__pkgname}_build/images"/*.{png,bmp} "${pkgdir}/usr/share/refind/images/"
	
	msg "Install the rEFInd keys"
	install -d "${pkgdir}/usr/share/refind/keys/"
	install -D -m0644 "${srcdir}/${__pkgname}_build/keys"/* "${pkgdir}/usr/share/refind/keys/"
	
	msg "Install the rEFIt license file, since rEFInd is a fork of rEFIt"
	install -d "${pkgdir}/usr/share/licenses/refind/"
	install -D -m0644 "${srcdir}/${__pkgname}_build/LICENSE.txt" "${pkgdir}/usr/share/licenses/refind/LICENSE"
	
	msg "Use '#!/usr/bin/env bash' in all scripts"
	sed 's|#!/bin/bash|#!/usr/bin/env bash|g' -i "${pkgdir}/usr/bin"/refind-* || true
	
	msg "Point refind dir paths to /usr/share/refind/ in refind-install script"
	sed 's|^ThisDir=.*|ThisDir="/usr/share/refind/"|g' -i "${pkgdir}/usr/bin/refind-install"
	sed 's|^RefindDir=.*|RefindDir="/usr/share/refind/"|g' -i "${pkgdir}/usr/bin/refind-install"
	sed 's|^ThisScript=.*|ThisScript="/usr/bin/refind-install"|g' -i "${pkgdir}/usr/bin/refind-install"
	
}
