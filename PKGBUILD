# Maintainer: eientei95 <einstein95 at windowslive dot com>

_pkgname=gbe-plus
pkgname=${_pkgname}-git
pkgver=r3206.107dc9a2
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
	        '502f4cfb184338815285e27af59c5170d7298570332d48ff06b94f87e7054001')

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
