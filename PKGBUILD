# Maintainer: eientei95 <einstein95 at windowslive dot com>

_pkgname=gbe-plus
pkgname=${_pkgname}-git
pkgver=r2502.d8b063b
pkgrel=1
pkgdesc="DMG/GBC/GBA emulator and experimental NDS emulator."
arch=('x86_64')
url="https://github.com/shonumi/gbe-plus"
license=('GPL2')
depends=('qt4' 'sdl2_net')
makedepends=('cmake' 'git')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("git+https://github.com/shonumi/gbe-plus.git"
		"cmake-install-location.patch")
sha256sums=('SKIP'
			'98f2f2d2650b5a9c26dc4e7e19875ef802627fbe3b31455c9097fc09c07df237')

prepare() {
	cd "$srcdir/${_pkgname}"
	patch -p1 -i "$srcdir/cmake-install-location.patch"
}

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p "$srcdir/${_pkgname}/build"
	cd "$srcdir/${_pkgname}/build"
	cmake .. -DCMAKE_INSTALL_PREFIX="/usr"
	make
}

package() {
	cd "$srcdir/${_pkgname}/build"
	make DESTDIR="$pkgdir" install
}
