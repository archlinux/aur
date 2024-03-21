# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=dafs-git
pkgver=r108.e9cc15c
pkgrel=1
pkgdesc="dual decomposition for aligning and folding RNA sequences simultaneously"
arch=(x86_64)
url="https://github.com/satoken/dafs"
license=('GPL')
depends=(viennarna)
makedepends=(cmake)
optdepends=('glpk: solver for linear programming')
source=("git+https://github.com/satoken/${pkgname%-git}"
	"git+https://github.com/jarro2783/cxxopts"
	"git+https://github.com/gabime/spdlog"
	"dafs.patch")
sha256sums=('SKIP'
	'SKIP'
	'SKIP'
	'6147313855a24ff6b624a16318460e1b8eaae5087afc93460ca75717193185dd')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init
	git config submodule.libs/cxxopts.url "$srcdir/cxxopts"
	git config submodule.libs/spdlog.url "$srcdir/spdlog"
	git -c protocol.file.allow=always submodule update

	patch -p0 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build
	cd build
	cmake ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
}
