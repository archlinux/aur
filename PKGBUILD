# Maintainer: Ulrich Huber <ulrich@huberulrich.de>
pkgname=zug-git
pkgrel=1
pkgver=r79.5dfc408
pkgdesc="Transducers for C++"
arch=('any')
url="https://github.com/arximboldi/zug"
license=('Boost')
depends=()
makedepends=('git' 'cmake')
provides=('zug')
conflicts=('zug')
source=(${pkgname}::git+https://github.com/arximboldi/zug.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "$srcdir/$pkgname"
	mkdir build
	cd build

	cmake .. -Dzug_BUILD_TESTS=OFF-Dzug_BUILD_EXAMPLES=OFF -Dzug_BUILD_DOCS=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	cd build

	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
