# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=csdr-luarvique-git
pkgver=0.18.16.r1.g562e23d
pkgrel=1
pkgdesc="A simple DSP library and command-line tool for Software Defined Radio."
arch=('i686' 'x86_64')
url="https://github.com/luarvique/csdr"
license=('GPL3')
depends=('gcc-libs' 'libsamplerate' 'fftw')
makedepends=('git' 'cmake')
conflicts=('csdr-luarvique' 'csdr')
provides=('csdr-luarvique' 'csdr')
source=("$pkgname"::"git+https://github.com/luarvique/csdr.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # use git tag or fall back to number of revisions
    ( set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
	cmake -B build -S "$srcdir/$pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev

	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
