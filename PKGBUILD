# Maintainer: Eragon <eragon at eragon dot re>
# Contributor: Moritz Poldrack <moritz at poldrack dot dev>
# Contributor: tinywrkb <tinywrkb@gmail.com>
# Contributor: dnkl

pkgname=yambar-wayland
_pkgname=yambar
pkgver=1.9.0
pkgrel=2
pkgdesc="Simplistic and highly configurable status panel for Wayland (No X11 support)"
arch=('any')
url=https://codeberg.org/dnkl/yambar
license=('MIT')
makedepends=(
	'meson'
	'ninja'
	'scdoc'
	'tllist>=1.0.1')
depends=(
	'wayland'
	'pixman'
	'libyaml'
	'libudev.so'
	'libpulse'
	'pipewire'
	'fcft>=3.0.0' 'fcft<4.0.0')
# FIXME : I can't test if theses are really optional - Eragon
optdepends=(
	'alsa-lib: for the ALSA module'
	'json-c: for the XKB module'
	'libmpdclient: for the MPD module')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/dnkl/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('46f3002338f451c154678167bf3d5f593307954b6f381c50ddef2726b1a8c811')

build() {
	cd $srcdir/$_pkgname
	meson --buildtype=release --prefix=/usr --wrap-mode=nofallback \
		-Db_lto=true \
		-Dbackend-x11=disabled \
		-Dbackend-wayland=enabled \
		-D core-plugins-as-shared-libraries=true ./build
	ninja -C build
}

check() {
	cd $srcdir/$_pkgname
	ninja -C build test
}

package() {
	cd $srcdir/$_pkgname
	DESTDIR="${pkgdir}/" ninja -C build install
}
