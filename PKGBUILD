# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=libtree
pkgver=1.1.2
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
sha256sums=('ef01800cf3242b6c4f5b051f1c2a13a41bb73caf9239c3de03d8ee4a9ecc546f')

prepare() {
	mkdir -p "$pkgname-$pkgver/build"
}

build() {
	cd "$pkgname-$pkgver/build" || exit 1

	cmake \
		-DUSE_SYSTEM_DEPS=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_UNITY_BUILD=ON \
		..
	make
}

check() {
	cd "$pkgname-$pkgver/build" || exit 1

	make test
}

package() {
	cd "$pkgname-$pkgver/build" || exit 1

	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
