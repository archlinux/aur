# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=libtree
pkgver=1.1.4
pkgrel=1
pkgdesc="ldd as a tree with an option to bundle dependencies into a single folder "
arch=('x86_64')
url="https://github.com/haampie/libtree"
license=('MIT')
depends=('cppglob' 'gcc-libs')
makedepends=('cmake' 'cxxopts' 'termcolor' 'elfio')
optdepends=('binutils: For the --strip option'
	'chrpath: For the --chrpath option'
)
checkdepends=('gtest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e643ec075601c2a0748ecfc28e3d4d6113e17260517b2cb7b64fd5b644e0bee7')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p "build"

	# Needed for LTO
	find . \
		-name 'CMakeLists.txt' \
		-exec sed -i 's/VERSION 3.0/VERSION 3.13.0/' {} \;
}

build() {
	cd "$pkgname-$pkgver/build"

	cmake \
		-DUSE_SYSTEM_DEPS=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_UNITY_BUILD=ON \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		..
	make
}

check() {
	cd "$pkgname-$pkgver/build"

	make test
}

package() {
	cd "$pkgname-$pkgver/build"

	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
