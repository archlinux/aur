# Maintainer: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=digiham-git
pkgver=0.3.0.r4.g6687105
pkgrel=1
pkgdesc="Tools for decoding digital ham communication."
arch=('x86_64')
url="https://github.com/jketterl/digiham"
license=('GPL3')
depends=('mbelib')
makedepends=('git' 'cmake')
provides=('digiham')
source=("$pkgname"::'git://github.com/jketterl/digiham.git')
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
