# Maintainer: Erik Bročko (OM2LT) <erik@brocko.eu>

pkgname=digiham-git
pkgver=0.6.0.r1.g08b923a
pkgrel=2
pkgdesc="Tools for decoding digital ham communication."
arch=('x86_64')
url="https://github.com/jketterl/digiham"
license=('GPL3')
depends=('mbelib' 'icu' 'codecserver' 'libsamplerate' 'csdr' 'protobuf')
makedepends=('git' 'cmake')
conflicts=('digiham')
provides=('digiham')
source=("$pkgname"::'git+https://github.com/jketterl/digiham')
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
