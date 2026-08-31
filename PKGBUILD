# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xlibre-input-vmmouse
_pkgname=xf86-input-vmmouse
pkgver=25.0.0
pkgrel=10
pkgdesc="XLibre VMWare Mouse input driver"
arch=('x86_64')
license=('custom')
url='https://github.com/X11Libre/xf86-input-vmmouse'
depends=(
	'systemd-libs'
	'xlibre-xserver'
)
makedepends=(
	'X-ABI-XINPUT_VERSION=26.0'
	'xlibre-xserver-devel'
)
provides=('xf86-input-vmmouse')
conflicts=(
	'X-ABI-XINPUT_VERSION<26'
	'X-ABI-XINPUT_VERSION>=27'
	'xf86-input-vmmouse'
)
groups=('xlibre-drivers')
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
sha512sums=('15a2ab5cb6232e2fe47a9750ae152a89609687571a78307828a32908a820433f50e0469ba84274f980bf6f5fb9d9caffbd3b656146d87e981480492b0aa3d761')

build() {
	cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
	NOCONFIGURE=1 ./autogen.sh
	./configure --prefix=/usr \
	--with-udev-rules-dir=/usr/lib/udev/rules.d
	make
}

package() {
	cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
	install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
	rm -rfv "${pkgdir}"/usr/{lib,share}/hal
}
