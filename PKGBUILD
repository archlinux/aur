# Maintainer: Yuki Takagi <takagiy.4dev@gmail.com>
pkgname=poac-git
pkgver=0.2.1.r96.085f0ca
pkgrel=1
pkgdesc="Package manager for C++ like Cargo for Rust (git version)"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://poac.pm"
license=('GPL3')
depends=('git' 'tar' 'graphviz' 'yaml-cpp')
makedepends=('cmake' 'boost')
optdepends=('cmake: To build CMake projects'
'make: To build projects with Makefile')
provides=('poac-devel-git' 'poac')
conflicts=('poac-devel-git' 'poac')
source=(${pkgname}::git+https://github.com/poacpm/poac.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$pkgname"
	mkdir build
	cd build

	cmake -E env CXXFLAGS=-O3 cmake .. -DBoost_USE_STATIC_LIBS=ON \
	-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	cd build

	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
