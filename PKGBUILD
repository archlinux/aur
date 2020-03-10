# Maintainer: Yuki Takagi <takagiy.4dev@gmail.com>
pkgname=lager-git
pkgver=r314.852ca11
pkgrel=1
pkgdesc="C++ library for value-oriented design using the unidirectional data-flow architecture"
arch=('any')
url="https://github.com/arximboldi/lager"
license=('MIT')
depends=('boost' 'cereal' 'immer-git' 'libhttpserver-git')
makedepends=('git' 'cmake')
provides=('lager')
conflicts=('lager')
source=(${pkgname}::git+https://github.com/arximboldi/lager.git)
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

	cmake .. -Dlager_BUILD_DEBUGGER=OFF -Dlager_BUILD_TESTS=OFF -Dlager_BUILD_EXAMPLES=OFF -Dlager_BUILD_DOCS=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	cd build

	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
