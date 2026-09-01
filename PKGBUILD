_pkgname=influxdb-cxx
pkgname="$_pkgname"
pkgver=0.8.1
pkgrel=2
pkgdesc="C++ client library for InfluxDB 1.x/2.x"
url="https://github.com/offa/$_pkgname"
arch=(x86_64)

conflicts=($_pkgname-git $_pkgname-git-debug)

depends=(curl boost-libs cpr)
makedepends=(cmake boost)

options=(staticlibs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/offa/influxdb-cxx/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('bd21c67988fe3ffddcfe11c26c2d23954702a542f138751e78d027d98f980c5c8e969776a1697d6104a704c0dddf63130b9c1f9c9df6e8e6bcb27bf9f8303218')

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
