# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=draco
pkgver=1.3.6
pkgrel=1
pkgdesc="A library for compressing and decompressing 3D geometric meshes and point clouds."
arch=('x86_64')
url="https://github.com/google/draco"
license=('Apache')
makedepends=('cmake')
depends=('gcc-libs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('80eaa54ef5fc687c9aeebb9bd24d936d3e6d2c6048f358be8b83fa088ef4b2cb')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p "build"

	# Needed for link time optimization
	local CMAKE_VERSION=$(LC_ALL=C cmake --version | awk 'n++<1 {print $3}')
	sed -i "s/\(cmake_minimum_required(VERSION\).*/\1 $CMAKE_VERSION)/" CMakeLists.txt
}

build() {
	cd "$srcdir/$pkgname-$pkgver/build"

	cmake .. \
		-DCMAKE_UNITY_BUILD=ON \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=on \

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	DESTDIR="$pkgdir" make install
}
