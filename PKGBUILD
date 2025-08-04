# Maintainer: Vilez <aur at medip dot dev>

_pkgbase=hp-muteled
pkgname=${_pkgbase}
pkgver=0.1.1
pkgrel=0
pkgdesc="Fix mute LED on hp laptops with the quirk that exists in the kernel"
url="https://github.com/Vilez0/hp-muteled"
license=('GPL')
arch=('x86_64')
depends=('glibc' 'dkms')
makedepends=('git')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
sha256sums=('SKIP')

source=("$_pkgbase"::"git+$url.git#tag=${pkgver}")
install="hp-muteled.install"

package() {
    board_id="0x$(awk '{ print tolower($0) }' /sys/class/dmi/id/board_name)"
    product_name=$(cat /sys/class/dmi/id/product_name)
	
	install -Dm644 "${_pkgbase}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
	install -Dm644 "${_pkgbase}/Makefile" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/Makefile"

	sed -e "s/@PKGNAME@/${_pkgbase}/g" \
	    -e "s/@PKGVER@/${pkgver}/g" \
	    -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	cp -dr --no-preserve='ownership' "./${_pkgbase}/src" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"

	sed -e "s/@MB_ID@/${board_id}/g" \
	    -e "s/@PRODUCT_NAME@/${product_name}/g" \
	    -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src/patch_realtek.c"

}