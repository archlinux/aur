# Maintainer: nl6720 <nl6720@gmail.com>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_USE_GNU_EFI='1'
_PXE='0'

#######
[[ "${CARCH}" == 'x86_64' ]] && _TIANO_ARCH='X64'
[[ "${CARCH}" == 'x86_64' ]] && _TIANO_S_ARCH='x64'
#######

_pkgname='refind'
pkgname="${_pkgname}-efi-git"
pkgver=0.12.0.r692.g4a84fce
pkgrel=1
pkgdesc='rEFInd Boot Manager - git version'
url='https://www.rodsbooks.com/refind/'
arch=('x86_64')
license=('GPL3' 'custom')

makedepends=('git')
depends=('bash' 'dosfstools' 'efibootmgr' 'which')
optdepends=('sudo: privilege elevation'
            'gptfdisk: For finding ESP'
            'imagemagick: For refind-mkfont script'
            'python: For refind-mkdefault script'
            'openssl: To generate Secure Boot keys'
            'sbsigntools: For EFI binary signing'
            'preloader-signed: pre-signed Secure Boot shim loader'
            'shim-signed: pre-signed Secure Boot shim loader')

options=('!strip' '!buildflags' '!makeflags')

conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")

install="${pkgname%-git}.install"

source=('refind::git+https://git.code.sf.net/p/refind/code#branch=master'
        'refind_linux.conf')

sha512sums=('SKIP'
            'd54b1a0b135594de9a8583a50f54de6daf3c8e38f1bc453794fa3959e826989a44a286e14cf8d8cb2eb04a1e97c984e62292a03e92c98aed044373381bca52d8')

if [[ "${_USE_GNU_EFI}" == '1' ]]; then

	pkgdesc="${pkgdesc} - Built with GNU-EFI libs"
	makedepends+=('gnu-efi-libs')

else

	pkgdesc="${pkgdesc} - Built with TianoCore EDK2 libs"
	makedepends+=('python2' 'nasm')

	_UDK_VERSION='UDK2018'
	_TIANO_DIR_="edk2-${_UDK_VERSION}"

	_TIANOCORE_PKG='Mde'
	_TIANOCORE_TARGET='RELEASE'
	_UDK_TARGET="${_TIANOCORE_PKG}Pkg/${_TIANOCORE_PKG}Pkg.dsc"
	_COMPILER='GCC5'

	source+=("${_TIANO_DIR_}::git+https://github.com/tianocore/edk2.git#branch=${_UDK_VERSION}")
	sha512sums+=('SKIP')

fi

pkgver() {

	cd "${srcdir}/${_pkgname}/"

	printf '%s.r%s.g%s' "$(grep -Po 'REFIND_VERSION L"\K[\d.]+' "${srcdir}/${_pkgname}/include/version.h")" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

_setup_tianocore_env_vars() {

	# Setup UDK PATH ENV variables
	export _UDK_DIR="${srcdir}/${_TIANO_DIR_}_build"
	export EDK_TOOLS_PATH="${_UDK_DIR}/BaseTools"

}

_prepare_tianocore_sources() {

	# Delete old UDK BUILD dir
	rm -rf "${_UDK_DIR}/" || true

	# Create UDK BUILD dir
	cp -r "${srcdir}/${_TIANO_DIR_}" "${_UDK_DIR}"

	cd "${_UDK_DIR}/"

	# Cleanup UDK config files
	rm -rf "${_UDK_DIR}/Build/" || true
	rm -rf "${_UDK_DIR}/Conf/" || true
	mkdir "${_UDK_DIR}/Conf/"
	mkdir "${_UDK_DIR}/Build/"

	# Disable build ID generation
	sed 's|,--gc-sections|,--gc-sections,--build-id=none|g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template"

	# Use python2 for UDK BaseTools
	sed 's|python |python2 |g' -i "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"/* || true
	sed 's|python |python2 |g' -i "${EDK_TOOLS_PATH}/Tests/GNUmakefile"

	# Fix GCC Warning as error
	sed 's|-Werror |-Wno-error -Wno-unused-but-set-variable |g' -i "${EDK_TOOLS_PATH}/Source/C/Makefiles/header.makefile" || true
	sed 's|-Werror |-Wno-error -Wno-unused-but-set-variable |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true

	# Fix GenFw: ERROR 3000: Invalid, bad symbol definition http://www.mail-archive.com/edk2-devel@lists.sourceforge.net/msg03625.html
	sed -e 's|_OBJCOPY_FLAGS      =|_OBJCOPY_FLAGS      = -R .eh_frame|g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true

	# Remove GCC -g debug option and add -O0 -mabi=ms -maccumulate-outgoing-args
	sed 's|DEFINE GCC_ALL_CC_FLAGS            = -g |DEFINE GCC_ALL_CC_FLAGS            = -O0 -mabi=ms -maccumulate-outgoing-args |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true
	sed 's|DEFINE GCC44_ALL_CC_FLAGS            = -g |DEFINE GCC44_ALL_CC_FLAGS            = -O0 -mabi=ms -maccumulate-outgoing-args |g' -i "${EDK_TOOLS_PATH}/Conf/tools_def.template" || true

	# Fix UDK Target Platform
	sed "s|ACTIVE_PLATFORM       = Nt32Pkg/Nt32Pkg.dsc|ACTIVE_PLATFORM       = ${_UDK_TARGET}|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	sed "s|TARGET                = DEBUG|TARGET                = ${_TIANOCORE_TARGET}|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	sed "s|TARGET_ARCH           = IA32|TARGET_ARCH           = ${_TIANO_ARCH}|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true
	sed "s|TOOL_CHAIN_TAG        = MYTOOLS|TOOL_CHAIN_TAG        = ${_COMPILER}|g" -i "${EDK_TOOLS_PATH}/Conf/target.template" || true

	chmod 0755 "${_UDK_DIR}/BaseTools/BuildEnv"

}

_prepare_refind_sources() {

	rm -rf "${srcdir}/${_pkgname}_build/" || true
	cp -r "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}_build"

	cd "${srcdir}/${_pkgname}_build/"

	# Clean rEFInd git repo
	git clean -x -d -f

	if [[ "${_USE_GNU_EFI}" == '1' ]]; then
		# Enable GNU_EFI_USE_MS_ABI
		sed "s|-DEFI_FUNCTION_WRAPPER|-DEFI_FUNCTION_WRAPPER -maccumulate-outgoing-args|g" -i "${srcdir}/${_pkgname}_build/Make.common" || true
		sed "s|-DEFIX64|-DEFIX64 -maccumulate-outgoing-args|g" -i "${srcdir}/${_pkgname}_build/Make.common" || true
		sed "s|-m64|-maccumulate-outgoing-args -m64|g" -i "${srcdir}/${_pkgname}_build/filesystems/Make.gnuefi" || true
	else
		# Fix UDK Path in rEFInd Makefiles
		sed "s|^export EDK2BASE=.*$|export EDK2BASE=${_UDK_DIR}|g" -i "${srcdir}/${_pkgname}_build/Makefile" || true

		# Disable build ID generation
		sed 's|--gc-sections|--gc-sections --build-id=none|g' -i "${srcdir}/${_pkgname}_build/Make.common" || true
	fi

}

prepare() {

	if [[ "${_USE_GNU_EFI}" != '1' ]]; then
		_setup_tianocore_env_vars

		# Prepare Tianocore Sources
		_prepare_tianocore_sources
	fi

	# Prepare rEFInd Sources
	_prepare_refind_sources

}

_build_tianocore_sources() {

	_setup_tianocore_env_vars

	cd "${_UDK_DIR}/"

	# Setup UDK Environment
	source "${_UDK_DIR}/BaseTools/BuildEnv" BaseTools

	# Compile UDK BaseTools
	make -C "${EDK_TOOLS_PATH}"

	# Compile UDK Libraries
	"${EDK_TOOLS_PATH}/BinWrappers/PosixLike/build" -p "${_UDK_TARGET}" -a "${_TIANO_ARCH}" -b "${_TIANOCORE_TARGET}" -t "${_COMPILER}"

}

build() {

	if [[ "${_USE_GNU_EFI}" != '1' ]]; then
		_build_tianocore_sources
	fi

	cd "${srcdir}/${_pkgname}_build/"

	# Compile rEFInd UEFI application
	if [[ "${_USE_GNU_EFI}" == '1' ]]; then
		make gnuefi
	else
		make edk2
	fi

	# Compile UEFI FS drivers
	if [[ "${_USE_GNU_EFI}" == '1' ]]; then
		make fs_gnuefi
	else
		make fs_edk2
	fi

	if [[ "${_PXE}" == '1' ]]; then
		cd "${srcdir}/${_pkgname}_build/net"

		# Compile Network support
		make source
		make netboot
	fi

}

package() {

	# Install the rEFInd UEFI application
	install -d "${pkgdir}/usr/share/refind/"
	install -D -m0644 "${srcdir}/${_pkgname}_build/refind/refind_${_TIANO_S_ARCH}.efi" "${pkgdir}/usr/share/refind/refind_${_TIANO_S_ARCH}.efi"

	# Install UEFI drivers built from rEFInd
	install -d "${pkgdir}/usr/share/refind/drivers_${_TIANO_S_ARCH}/"
	install -D -m0644 "${srcdir}/${_pkgname}_build/drivers_${_TIANO_S_ARCH}"/*.efi "${pkgdir}/usr/share/refind/drivers_${_TIANO_S_ARCH}/"

	# Install UEFI applications built from rEFInd
	install -d "${pkgdir}/usr/share/refind/tools_${_TIANO_S_ARCH}"
	install -D -m0644 "${srcdir}/${_pkgname}_build/gptsync/gptsync_${_TIANO_S_ARCH}.efi" "${pkgdir}/usr/share/refind/tools_${_TIANO_S_ARCH}/gptsync_${_TIANO_S_ARCH}.efi"

	if [[ "${_PXE}" == '1' ]]; then
		install -D -m0644 "${srcdir}/${_pkgname}_build/net/bin/ipxe.efi" "${pkgdir}/usr/share/refind/tools_${_TIANO_S_ARCH}/ipxe_${_TIANO_S_ARCH}.efi"
		install -D -m0644 "${srcdir}/${_pkgname}_build/net/bin/ipxe_discovery.efi" "${pkgdir}/usr/share/refind/tools_${_TIANO_S_ARCH}/ipxe_discovery_${_TIANO_S_ARCH}.efi"
	fi

	# Install rEFInd helper scripts
	install -d "${pkgdir}/usr/bin/"
	install -D -m0755 "${srcdir}/${_pkgname}_build/refind-install" "${pkgdir}/usr/bin/refind-install"
	install -D -m0755 "${srcdir}/${_pkgname}_build/refind-mkdefault" "${pkgdir}/usr/bin/refind-mkdefault"
	install -D -m0755 "${srcdir}/${_pkgname}_build/mkrlconf" "${pkgdir}/usr/bin/mkrlconf"
	install -D -m0755 "${srcdir}/${_pkgname}_build/mvrefind" "${pkgdir}/usr/bin/mvrefind"
	install -D -m0755 "${srcdir}/${_pkgname}_build/fonts/mkfont.sh" "${pkgdir}/usr/bin/refind-mkfont"

	# Install the rEFInd sample config files
	install -D -m0644 "${srcdir}/${_pkgname}_build/refind.conf-sample" "${pkgdir}/usr/share/refind/refind.conf-sample"
	install -D -m0644 "${srcdir}/refind_linux.conf" "${pkgdir}/usr/share/refind/refind_linux.conf-sample"

	# Install the rEFInd docs
	install -d "${pkgdir}/usr/share/refind/docs/html/"
	install -d "${pkgdir}/usr/share/refind/docs/Styles/"
	install -d "${pkgdir}/usr/share/man/man8/"
	install -D -m0644 "${srcdir}/${_pkgname}_build/docs/refind"/* "${pkgdir}/usr/share/refind/docs/html/"
	install -D -m0644 "${srcdir}/${_pkgname}_build/docs/Styles"/* "${pkgdir}/usr/share/refind/docs/Styles/"
	install -D -m0644 "${srcdir}/${_pkgname}_build/README.txt" "${pkgdir}/usr/share/refind/docs/README.txt"
	install -D -m0644 "${srcdir}/${_pkgname}_build/NEWS.txt" "${pkgdir}/usr/share/refind/docs/NEWS.txt"
	install -D -m0644 "${srcdir}/${_pkgname}_build/docs/man"/*.8 "${pkgdir}/usr/share/man/man8/"

	# Install the rEFInd fonts
	install -d "${pkgdir}/usr/share/refind/fonts/"
	install -D -m0644 "${srcdir}/${_pkgname}_build/fonts"/* "${pkgdir}/usr/share/refind/fonts/"
	rm -f "${pkgdir}/usr/share/refind/fonts/mkfont.sh"

	# Install the rEFInd icons
	install -d "${pkgdir}/usr/share/refind/icons/svg/"
	install -d "${pkgdir}/usr/share/refind/icons/licenses/"
	install -D -m0644 "${srcdir}/${_pkgname}_build/icons/svg"/* "${pkgdir}/usr/share/refind/icons/svg/"
	install -D -m0644 "${srcdir}/${_pkgname}_build/icons"/*.png "${pkgdir}/usr/share/refind/icons/"
	install -D -m0644 "${srcdir}/${_pkgname}_build/icons/licenses"/* "${pkgdir}/usr/share/refind/icons/licenses/"

	# Install the rEFInd images
	install -d "${pkgdir}/usr/share/refind/images/"
	install -D -m0644 "${srcdir}/${_pkgname}_build/images"/*.{png,bmp} "${pkgdir}/usr/share/refind/images/"

	# Install the rEFInd keys
	install -d "${pkgdir}/usr/share/refind/keys/"
	install -D -m0644 "${srcdir}/${_pkgname}_build/keys"/* "${pkgdir}/usr/share/refind/keys/"

	# Install the rEFIt license file, since rEFInd is a fork of rEFIt
	install -D -m0644 "${srcdir}/${_pkgname}_build/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Point refind dir paths to /usr/share/refind/ in refind-install script
	sed 's|RefindDir=\"\$ThisDir/refind\"|RefindDir="/usr/share/refind/"|g' -i "${pkgdir}/usr/bin/refind-install"

}
