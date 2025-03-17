pkgname=influxdb-cxx
pkgver=0.7.4
pkgrel=1
pkgdesc="C++ client library for InfluxDB 1.x/2.x"
url=https://github.com/offa/influxdb-cxx
arch=(x86_64)

depends=(curl boost-libs cpr)
makedepends=(cmake boost)

options=(staticlibs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/offa/influxdb-cxx/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('c2ff1b989e08d571d1ca29b78136c24d2759b787996bff05101527cf405835a15330812a26301714c960450f1ffaf984e4a6d76f608fba888b6a44142e79905d')

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
        -DINFLUXCXX_INSTALL_HEADER_TO_SUBDIR=OFF \
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
        -DINFLUXCXX_INSTALL_HEADER_TO_SUBDIR=OFF \
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
