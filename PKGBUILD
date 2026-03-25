# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=csdr-eti-git
pkgver=0.0.11.r2.ga526513
pkgrel=1
pkgdesc="DAB ETI decoder as a csdr module"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/jketterl/csdr-eti"
license=('GPL-3.0-only')
depends=('csdr' 'fftw')
makedepends=('git' 'cmake' 'csdr-luarvique')
conflicts=('csdr-eti')
provides=('csdr-eti')
source=("$pkgname"::"git+https://github.com/luarvique/csdr-eti.git")
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
	    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
		-DCMAKE_INSTALL_PREFIX=/usr

	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
