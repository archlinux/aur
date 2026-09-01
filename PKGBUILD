_pkgname=influxdb-cxx
pkgname="$_pkgname-git"
pkgver=v0.8.1.r29.g80931b7
pkgrel=1
pkgdesc="C++ client library for InfluxDB 1.x/2.x"
url=https://github.com/offa/$_pkgname
arch=(x86_64)

provides=($_pkgname $_pkgname-debug)
conflicts=($_pkgname $_pkgname-debug)

depends=(curl boost-libs cpr)
makedepends=(cmake boost)

options=(staticlibs)

source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_pkgname"
	rm -rf build-shared build-static
	mkdir -p build-shared build-static
	cd "build-static"
	cmake "$srcdir/$_pkgname" \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-error=null-dereference -Wno-error=maybe-uninitialized" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DBUILD_SHARED_LIBS=OFF \
	-DINFLUXCXX_TESTING=OFF \
	-DINFLUXCXX_SYSTEMTEST=OFF \
	-DINFLUXCXX_COVERAGE=OFF

	cd "../build-shared"
	cmake "$srcdir/$_pkgname" \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-error=null-dereference -Wno-error=maybe-uninitialized" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DBUILD_SHARED_LIBS=ON \
	-DINFLUXCXX_TESTING=OFF \
	-DINFLUXCXX_SYSTEMTEST=OFF \
	-DINFLUXCXX_COVERAGE=OFF
}

build() {
	cd "$srcdir/$_pkgname"
	make -C "build-static"
	make -C "build-shared"
}

package() {
	cd "$srcdir/$_pkgname"
	make -C "build-static" install DESTDIR="$pkgdir"
	make -C "build-shared" install DESTDIR="$pkgdir"
}
