# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=xlibre-video-dummy
_pkgname=xf86-video-dummy
pkgver=25.0.0
pkgrel=9
pkgdesc="XLibre dummy video driver"
arch=('x86_64')
url='https://github.com/X11Libre/xf86-video-dummy'
license=('MIT AND X11')
depends=(
	'glibc'
	'xlibre-xserver'
)
makedepends=(
	'X-ABI-VIDEODRV_VERSION=28.0'
	'xlibre-xserver-devel'
)
provides=('xf86-video-dummy')
conflicts=(
	'X-ABI-VIDEODRV_VERSION<28'
	'X-ABI-VIDEODRV_VERSION>=29'
	'xf86-video-dummy'
)
groups=('xlibre-drivers')
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
sha512sums=('90aa2e6745fe8f5191f21ccd01172f6aafd46c3cc01027c687cf9757dd9d961fb4b00880f4eeddc145d06b6da7b43b3ea8b2c40087a21f17db722038eaf0676f')

build() {
	cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}

	# Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
	# With them, module fail to load with undefined symbol.
	# See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
	export CFLAGS=${CFLAGS/-fno-plt}
	export CXXFLAGS=${CXXFLAGS/-fno-plt}
	export LDFLAGS=${LDFLAGS/-Wl,-z,now}

	NOCONFIGURE=1 ./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd ${_pkgname}-xlibre-${_pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
	install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
