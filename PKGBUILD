# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: buddabrod <buddabrod@gmail.com>

pkgname=xlibre-video-nouveau
_pkgname=xf86-video-nouveau
pkgver=25.0.1
pkgrel=9
pkgdesc="XLibre Open Source 3D acceleration driver for nVidia cards"
arch=('x86_64')
url='https://github.com/X11Libre/xf86-video-nouveau'
license=('MIT')
depends=(
	'glibc'
	'libdrm'
	'mesa'
	'systemd-libs'
	'xlibre-xserver'
)
makedepends=(
	'systemd'
	'X-ABI-VIDEODRV_VERSION=28.0'
	'xlibre-xserver-devel'
)
provides=('xf86-video-nouveau')
conflicts=(
	'X-ABI-VIDEODRV_VERSION<28'
	'X-ABI-VIDEODRV_VERSION>=29'
	'xf86-video-nouveau'
)
groups=('xlibre-drivers')
source=("${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz")
sha512sums=('4935b2107fa50861341b46b5ff049cbef243c0961436dd3910d5f4f1cb198c2d81d477708f88f9b14f0bf0c4b6585bb5f8625e40126860123bc8f06b3ebfae86')

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
	make DESTDIR="$pkgdir" install
}
