# Maintainer: Laurent Tréguier <laurent@treguier.org>

_USE_GNU_EFI="1"

#######
[[ "${CARCH}" == "x86_64" ]] && _TIANO_S_ARCH="x64"
[[ "${CARCH}" == "i686" ]] && _TIANO_S_ARCH="ia32"
#######

pkgname="refind-efi-bin"
pkgver="0.10.3"
pkgrel="1"
pkgdesc="Rod Smith's fork of rEFIt UEFI Boot Manager - Precompiled binary"
url="http://www.rodsbooks.com/refind/index.html"
arch=('x86_64' 'i686')
license=('GPL3' 'custom')

depends=('bash' 'dosfstools' 'efibootmgr')
optdepends=('mactel-boot: For bless command in Apple Mac systems'
            'imagemagick: For refind-mkfont script')
makedepends=()
conflicts=('refind-efi')
options=()

install="${pkgname}.install"

source=('refind_linux.conf')
md5sums=('12ce3e22a216e7b25c253478a34713b4'
         'e36874d14dc37ee02500f63b731904fc')

if [[ "${_USE_GNU_EFI}" == "1" ]]; then
	
	pkgdesc="${pkgdesc} - Built with GNU-EFI libs"
	source+=("https://sourceforge.net/projects/refind/files/${pkgver}/refind-bin-gnuefi-${pkgver}.zip/download")
	
else
	
	pkgdesc="${pkgdesc} - Built with Tianocore UDK libs"
	source+=("https://sourceforge.net/projects/refind/files/${pkgver}/refind-bin-${pkgver}.zip/download")
	
fi


package() {
	
	msg "Install the rEFInd UEFI application"
	install -d "${pkgdir}/usr/share/refind/"
	install -D -m0644 "${srcdir}/refind-bin-${pkgver}/refind/refind_${_TIANO_S_ARCH}.efi" "${pkgdir}/usr/share/refind/refind_${_TIANO_S_ARCH}.efi"
	
	msg "Install UEFI drivers built from rEFInd"
	install -d "${pkgdir}/usr/share/refind/drivers_${_TIANO_S_ARCH}/"
	install -D -m0644 "${srcdir}/refind-bin-${pkgver}/refind/drivers_${_TIANO_S_ARCH}"/*.efi "${pkgdir}/usr/share/refind/drivers_${_TIANO_S_ARCH}/"
	
	msg "Install UEFI applications built from rEFInd"
	install -d "${pkgdir}/usr/share/refind/tools_${_TIANO_S_ARCH}"
	install -D -m0644 "${srcdir}/refind-bin-${pkgver}/refind/tools_${_TIANO_S_ARCH}"/*.efi "${pkgdir}/usr/share/refind/tools_${_TIANO_S_ARCH}/"
	
	msg "Install rEFInd helper scripts"
	install -d "${pkgdir}/usr/bin/"
	install -D -m0755 "${srcdir}/refind-bin-${pkgver}/refind-install" "${pkgdir}/usr/bin/refind-install"
	install -D -m0755 "${srcdir}/refind-bin-${pkgver}/refind-mkdefault" "${pkgdir}/usr/bin/refind-mkdefault"
	install -D -m0755 "${srcdir}/refind-bin-${pkgver}/mkrlconf" "${pkgdir}/usr/bin/refind-mkrlconf"
	install -D -m0755 "${srcdir}/refind-bin-${pkgver}/mvrefind" "${pkgdir}/usr/bin/refind-mvrefind"
	install -D -m0755 "${srcdir}/refind-bin-${pkgver}/fonts/mkfont.sh" "${pkgdir}/usr/bin/refind-mkfont"
	
	msg "Install the rEFInd sample config files"
	install -D -m0644 "${srcdir}/refind-bin-${pkgver}/refind/refind.conf-sample" "${pkgdir}/usr/share/refind/refind.conf-sample"
	install -D -m0644 "${srcdir}/refind_linux.conf" "${pkgdir}/usr/share/refind/refind_linux.conf-sample"
	
	msg "Install the rEFInd docs"
	install -d "${pkgdir}/usr/share/refind/docs/html/"
	install -d "${pkgdir}/usr/share/refind/docs/Styles/"
	install -D -m0644 "${srcdir}/refind-bin-${pkgver}/docs/refind"/* "${pkgdir}/usr/share/refind/docs/html/"
	install -D -m0644 "${srcdir}/refind-bin-${pkgver}/docs/Styles"/* "${pkgdir}/usr/share/refind/docs/Styles/"
	install -D -m0644 "${srcdir}/refind-bin-${pkgver}/README.txt" "${pkgdir}/usr/share/refind/docs/README.txt"
	install -D -m0644 "${srcdir}/refind-bin-${pkgver}/NEWS.txt" "${pkgdir}/usr/share/refind/docs/NEWS.txt"
	rm -f "${pkgdir}/usr/share/refind/docs/html/.DS_Store" || true
	
	msg "Install the rEFInd fonts"
	install -d "${pkgdir}/usr/share/refind/fonts/"
	install -D -m0644 "${srcdir}/refind-bin-${pkgver}/fonts"/* "${pkgdir}/usr/share/refind/fonts/"
	rm -f "${pkgdir}/usr/share/refind/fonts/mkfont.sh"
	
	msg "Install the rEFInd icons"
	install -d "${pkgdir}/usr/share/refind/icons/"
	install -D -m0644 "${srcdir}/refind-bin-${pkgver}/refind/icons"/*.png "${pkgdir}/usr/share/refind/icons/"
	
	msg "Install the rEFInd images"
	install -d "${pkgdir}/usr/share/refind/banners/"
	install -D -m0644 "${srcdir}/refind-bin-${pkgver}/banners"/*.{png,svg} "${pkgdir}/usr/share/refind/banners/"
	
	msg "Install the rEFInd keys"
	install -d "${pkgdir}/usr/share/refind/keys/"
	install -D -m0644 "${srcdir}/refind-bin-${pkgver}/keys"/* "${pkgdir}/usr/share/refind/keys/"
	
	msg "Install the rEFIt license file, since rEFInd is a fork of rEFIt"
	install -d "${pkgdir}/usr/share/licenses/refind/"
	install -D -m0644 "${srcdir}/refind-bin-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/refind/LICENSE"
	
	msg "Use '#!/usr/bin/env bash' in all scripts"
	sed 's|#!/bin/bash|#!/usr/bin/env bash|g' -i "${pkgdir}/usr/bin"/refind-* || true
	
	msg "Point refind dir paths to /usr/share/refind/ in refind-install script"
	sed -r 's|[[:space:]]+ThisDir=.*|ThisDir="/usr/share/refind/"|g' -i "${pkgdir}/usr/bin/refind-install"
	sed -r 's|[[:space:]]+RefindDir=.*|RefindDir="/usr/share/refind/"|g' -i "${pkgdir}/usr/bin/refind-install"
	
}
