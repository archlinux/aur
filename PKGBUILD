# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=curlcpp
pkgver=1.4
pkgrel=1
epoch=
pkgdesc="An object oriented C++ wrapper for CURL"
arch=('x86_64')
url="https://github.com/JosephP91/curlcpp"
license=('MIT')
groups=()
depends=()
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c2faa9bc27a5ecf609bffb7e6c38cba3d61b6def4e853cfc6259640bcd985083')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p "build"

	sed -i "s/CMAKE_INSTALL_PREFIX/CMAKE_BINARY_DIR/" CMakeLists.txt
	sed -i "s#/lib/curlcpp##" CMakeLists.txt

	echo "include(GNUInstallDirs)" >> CMakeLists.txt

	echo 'install(FILES' >> CMakeLists.txt
	echo '${CMAKE_BINARY_DIR}/curlcppConfig.cmake' >> CMakeLists.txt
	echo 'DESTINATION ${CMAKE_INSTALL_LIBDIR}/curlcpp' >> CMakeLists.txt
	echo ')' >> CMakeLists.txt

	echo "set_target_properties(curlcpp" >> src/CMakeLists.txt
	echo "PROPERTIES" >> src/CMakeLists.txt
	echo "VERSION $pkgver" >> src/CMakeLists.txt
	echo "SOVERSION ${pkgver%%.*}" >> src/CMakeLists.txt
	echo ")" >> src/CMakeLists.txt
}

build() {
	cd "$pkgname-$pkgver/build"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_UNITY_BUILD=ON \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		-DCURLCPP_USE_PKGCONFIG=ON \
		-DBUILD_SHARED_LIBS=ON \
		..
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd "build"
	make DESTDIR="$pkgdir/" install
}
