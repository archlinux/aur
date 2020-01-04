# Maintainer: Yuki Takagi <takagiy.4dev@gmail.com>
pkgname=poac-devel-git
pkgver=0.2.1.r789.83d35eb
pkgrel=2
pkgdesc="Package manager for C++ like Cargo for Rust (develop branch)"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://poac.pm"
license=('GPL3')
depends=('libgit2' 'tar' 'graphviz')
makedepends=('git' 'cmake' 'boost' 'toml11-git')
optdepends=('cmake: To build CMake projects'
'make: To build projects with Makefile')
provides=('poac-git' 'poac')
conflicts=('poac-git' 'poac')
source=(${pkgname}::git+https://github.com/poacpm/poac.git)
md5sums=('SKIP')

prepare() {
        cd "$srcdir/$pkgname"
	git checkout develop
}

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$pkgname"
	mkdir build
	cd build

	cmake -E env CXXFLAGS=-O3 cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	cd build

	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
