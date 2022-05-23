pkgname=influxdb-cxx
pkgver=0.6.7
pkgrel=2
pkgdesc="C++ client library for InfluxDB 1.x/2.x"
url=https://github.com/offa/influxdb-cxx
arch=(x86_64)

depends=(curl boost-libs)
makedepends=(cmake boost)

options=(staticlibs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/offa/influxdb-cxx/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('4e871c6d06c94b24b45aeedb7c74c75aed17332fbde76fc1e6c2ad06aeb41e268a95f4cab1c12c4402765c11811feb84bf48d60b138717c485327848782e402c')

prepare() {
	rm -rf build-shared build-static
	mkdir -p build-shared build-static
	cd "$srcdir/build-static"
	cmake "$srcdir/$pkgname-$pkgver" \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-error=null-dereference -Wno-error=maybe-uninitialized" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_INCLUDEDIR="include/influxdb-cxx" \
	-DBUILD_SHARED_LIBS=OFF \
	-DINFLUXCXX_TESTING=OFF \
	-DINFLUXCXX_SYSTEMTEST=OFF \
	-DINFLUXCXX_COVERAGE=OFF

	cd "$srcdir/build-shared"
	cmake "$srcdir/$pkgname-$pkgver" \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-error=null-dereference -Wno-error=maybe-uninitialized" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_INCLUDEDIR="include/influxdb-cxx" \
	-DBUILD_SHARED_LIBS=ON \
	-DINFLUXCXX_TESTING=OFF \
	-DINFLUXCXX_SYSTEMTEST=OFF \
	-DINFLUXCXX_COVERAGE=OFF
}

build() {
	make -C "build-static"
	make -C "build-shared"
}

package() {
	make -C "build-static" install DESTDIR="$pkgdir"
	make -C "build-shared" install DESTDIR="$pkgdir"
}
