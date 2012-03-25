# Maintainer: Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

# _GNU_EFI_LIB_DIR="/usr/lib"

_actualname="refind"
_pkgname="${_actualname}-x86_64"
pkgname="${_pkgname}"

pkgver="0.2.2"
pkgrel="2"
pkgdesc="Rod Smith's fork of rEFIt (U)EFI Boot Manager"
url="http://www.rodsbooks.com/refind/index.html"
arch=('any')
license=('GPL3' 'custom')

makedepends=('gnu-efi')
depends=('dosfstools' 'efibootmgr')
optdepends=('mactel-boot: For bless command in Apple Mac systems')

backup=('boot/efi/efi/arch_refind/refind.conf'
        'boot/efi/efi/arch_refind/refind_linux.conf')

options=('!strip' 'docs')
install="${_pkgname}.install"

source=("http://downloads.sourceforge.net/refind/refind-src-${pkgver}.zip"
        'refind_linux.conf')

sha256sums=('45071370d083f3eb46add92c45463d42e444d07d85e320bb675bae04d1ccb0e6'
            '9aac6e65018965ba182ec2d246d37fc5f9269ae96504956d8a51355c3ba1b62f')

build() {
	
	if [[ "${CARCH}" != "x86_64" ]]; then
		echo "${pkgname} package can be built only in a x86_64 system. Exiting."
		exit 1
	fi
	
	cd "${srcdir}/refind-${pkgver}/"
	
	## rename linux.conf to refind_linux.conf
	sed 's|linux.conf|refind_linux.conf|g' -i "${srcdir}/refind-${pkgver}/refind/config.c"
	
	make
	
}

package() {
	
	cd "${srcdir}/refind-${pkgver}/"
	
	## install the rEFInd x86_64 UEFI app
	install -d "${pkgdir}/boot/efi/efi/arch_refind/"
	install -D -m0644 "${srcdir}/refind-${pkgver}/refind/refind.efi" "${pkgdir}/boot/efi/efi/arch_refind/refindx64.efi"
	
	## install the rEFInd config file
	install -D -m0644 "${srcdir}/refind-${pkgver}/refind.conf-sample" "${pkgdir}/boot/efi/efi/arch_refind/refind.conf"
	install -D -m0644 "${srcdir}/linux.conf" "${pkgdir}/boot/efi/efi/arch_refind/linux.conf"
	
	## install the rEFInd icons
	install -d "${pkgdir}/boot/efi/efi/arch_refind/icons/"
	install -D -m0644 "${srcdir}/refind-${pkgver}/icons"/* "${pkgdir}/boot/efi/efi/arch_refind/icons/"
	
	## install the rEFInd docs
	install -d "${pkgdir}/usr/share/refind/docs/html/"
	install -d "${pkgdir}/usr/share/refind/docs/Styles/"
	install -D -m0644 "${srcdir}/refind-${pkgver}/docs/refind"/* "${pkgdir}/usr/share/refind/docs/html/"
	install -D -m0644 "${srcdir}/refind-${pkgver}/docs/Styles"/* "${pkgdir}/usr/share/refind/docs/Styles/"
	install -D -m0644 "${srcdir}/refind-${pkgver}/README.txt" "${pkgdir}/usr/share/refind/docs/README.txt"
	install -D -m0644 "${srcdir}/refind-${pkgver}/NEWS.txt" "${pkgdir}/usr/share/refind/docs/NEWS.txt"
	rm -f "${pkgdir}/usr/share/refind/docs/html/.DS_Store" || true
	
	## rename linux.conf to refind_linux.conf
	sed 's|linux.conf|refind_linux.conf|g' -i "${pkgdir}/usr/share/refind/docs/html"/*.html
	sed 's|linux.conf|refind_linux.conf|g' -i "${pkgdir}/usr/share/refind/docs"/*.txt
	
	## install the rEFIt license file, since rEFInd is a fork of rEFIt
	install -d "${pkgdir}/usr/share/licenses/refind-x86_64/"
	install -D -m0644 "${srcdir}/refind-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/refind-x86_64/LICENSE"
	
}
