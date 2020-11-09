# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=tinyobjloader
pkgver=2.0.0rc7
pkgrel=2
epoch=
pkgdesc="Tiny but powerful single file wavefront obj loader "
arch=('x86_64')
url="https://github.com/tinyobjloader/tinyobjloader"
license=('MIT')
groups=()
depends=('gcc-libs')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f0246420235933d23715dd7d61e08d8b92ca896b5476dbef556d8b6270a275a3')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "build"

	local CMAKE_VERSION="$(LC_ALL=C cmake --version | awk '{print $3; exit}')"

	# Needed for the link time optimization
	sed "s/\(cmake_minimum_required(\).*)/\1VERSION $CMAKE_VERSION)/" \
		-i CMakeLists.txt

	# Remove reference to the source file
	echo 'target_compile_definitions(${LIBRARY_NAME} PRIVATE NDEBUG)' >> CMakeLists.txt
}

build() {
	cd "$srcdir/$pkgname-$pkgver/build"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_UNITY_BUILD=ON \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		-DBUILD_SHARED_LIBS=ON \
		..
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install

	# The license is in the wrong folder.
	mv "$pkgdir/usr/share/"{doc,licenses}
}
