# Maintainer: jazztickets
_pkgname=olived
pkgname=$_pkgname-git
pkgver=v0.2.1.r0.ga3c7d12
pkgrel=1
arch=('x86_64')
pkgdesc="Free non-linear video editor"
url="https://github.com/jazztickets/olived.git"
license=('GPL-3.0-or-later')
depends=('ffmpeg' 'openimageio' 'opentimelineio' 'portaudio' 'qt5-x11extras')
makedepends=('cmake' 'git' 'ninja' 'qt5-svg' 'qt5-tools')

provides=('olive')
conflicts=('olive')
source=(
	'git+https://github.com/jazztickets/olived.git'
	'git+https://github.com/jazztickets/olived-core.git'
	'git+https://github.com/olive-editor/KDDockWidgets.git'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git submodule init
	git config submodule.ext/core.url "$srcdir"/olived-core
	git config submodule.ext/KDDockWidgets.url "$srcdir"/KDDockWidgets
	git -c protocol.file.allow=always submodule update
}

build() {
	cd $_pkgname
	cmake \
		-GNinja \
		-Bbuild \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DOTIO_DEPS_INCLUDE_DIR=/usr/include/opentimelineio
	ninja -C build/
}

package() {
	cd $_pkgname
	DESTDIR="$pkgdir" ninja -C build/ install
}
