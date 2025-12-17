pkgname=influxdb-cxx
pkgver=0.8.0
pkgrel=1
pkgdesc="C++ client library for InfluxDB 1.x/2.x"
url=https://github.com/offa/influxdb-cxx
arch=(x86_64)

depends=(curl boost-libs cpr)
makedepends=(cmake boost)

options=(staticlibs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/offa/influxdb-cxx/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('59749a9215de7e4e7af80478f1ee87d932ac255b2e9eb0343296511adf1af2213174f878d9be3b4da1475e35ba869ab5222ea81bf009cfabd96997ea253716b5')

prepare() {
	rm -rf build-shared build-static
	mkdir -p build-shared build-static
	cd "$srcdir/build-static"
	cmake "$srcdir/$pkgname-$pkgver" \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-error=null-dereference -Wno-error=maybe-uninitialized" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DBUILD_SHARED_LIBS=OFF \
	-DINFLUXCXX_TESTING=OFF \
	-DINFLUXCXX_SYSTEMTEST=OFF \
	-DINFLUXCXX_COVERAGE=OFF

	cd "$srcdir/build-shared"
	cmake "$srcdir/$pkgname-$pkgver" \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-error=null-dereference -Wno-error=maybe-uninitialized" \
	-DCMAKE_INSTALL_PREFIX=/usr \
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
