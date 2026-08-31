# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Yonathan Dossow
# Contributor: Ansgar Taflinski <ataflinski@uni-koblenz.de>

pkgname=xlibre-video-qxl
_pkgname=xf86-video-qxl
pkgver=25.0.0
pkgrel=11
pkgdesc='XLibre qxl video driver'
arch=('x86_64')
url='https://github.com/X11Libre/xf86-video-qxl'
license=('MIT')
depends=(
	'glibc'
	'libxfont2'
	'spice'
	'systemd-libs'
	'xlibre-xserver'
)
optdepends=('python: for Xspice')
makedepends=(
	'libcacard'
	'spice-protocol'
	'X-ABI-VIDEODRV_VERSION=28.0'
	'xlibre-xserver-devel'
)
provides=('xf86-video-qxl')
conflicts=(
	'X-ABI-VIDEODRV_VERSION<28'
	'X-ABI-VIDEODRV_VERSION>=29'
	'xf86-video-qxl'
	'xf86-video-qxl-git'
)
groups=('xlibre-drivers')
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ee0b0798a2fa2dd3e2494dee996cdc41ac2e43054f53b33a619960786d5b7e8c')

build() {
	cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}

	# Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
	# With them, module fail to load with undefined symbol.
	# See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
	export CFLAGS=${CFLAGS/-fno-plt}
	export CXXFLAGS=${CXXFLAGS/-fno-plt}
	export LDFLAGS=${LDFLAGS/-Wl,-z,now}

	NOCONFIGURE=1 ./autogen.sh
	./configure --enable-xspice --prefix=/usr
	make
}

package() {
	cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}

	make DESTDIR="${pkgdir}/" install

	install -v -Dm0755 scripts/Xspice "${pkgdir}"/usr/bin/Xspice
	install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
