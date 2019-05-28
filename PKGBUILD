# Maintainer: spider-mario <spidermario@free.fr>
pkgname=brunsli-git
pkgver=r13.bf755c7
pkgrel=1
pkgdesc="Lossless JPEG repacker"
arch=('x86_64')
url="https://github.com/google/brunsli"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'clang')
provides=('brunsli')
conflicts=('brunsli')
source=('git+https://github.com/google/brunsli.git')
sha512sums=('SKIP')

pkgver() {
	cd brunsli
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd brunsli
	git submodule update --init
}

build() {
	mkdir -p build
	cd build
	cmake \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		"$srcdir"/brunsli
	make
}

package() {
	cd build
	install -Dm644 "$srcdir"/brunsli/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
	install -Dm755 cbrunsli "$pkgdir"/usr/bin/cbrunsli
	install -Dm755 dbrunsli "$pkgdir"/usr/bin/dbrunsli
}
