# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=libtree
pkgver=1.2.1
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
sha256sums=('3273588747e75bbbc1416139471e49d149148de4bc1cd6c063b45fbfee45edf7')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p build

	# Needed for LTO
	find . \
		-name 'CMakeLists.txt' \
		-exec sed -i 's/VERSION 3.0/VERSION 3.13.0/' {} \;
}

build() {
	cd "$srcdir/$pkgname-$pkgver/build"

	cmake \
		-DUSE_SYSTEM_DEPS=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_UNITY_BUILD=ON \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		..

	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver/build"

	make test
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"

	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
