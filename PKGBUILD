# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Andrew Nelless <andrew at nelless dot net>

pkgname='avro-cpp'
pkgver=1.11.0
pkgrel=1
arch=('x86_64')

pkgdesc="C++ implementation of the Apache Avro data serialization system"
url="https://avro.apache.org/"
license=('Apache')
groups=('avro')
depends=('boost-libs')
makedepends=('boost' 'cmake' 'snappy')

source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/apache/avro/tar.gz/release-$pkgver)
sha256sums=('c205140e7936d552286ba7131122a34e522d66f601ee912f272109d801f89773')

build() {
    cd "$srcdir/avro-release-$pkgver/lang/c++"
    mkdir build
    cd build

    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_CXX_FLAGS_RELEASE="$CXXFLAGS $CPPFLAGS -DNDEBUG" \
        -DCMAKE_C_FLAGS_RELEASE="$CFLAGS $CPPFLAGS -DNDEBUG" \
        -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
        -DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS" ..
    make
}

check() {
    cd "$srcdir/avro-release-$pkgver/lang/c++/build"
    make test
}

package() {
    cd "$srcdir/avro-release-$pkgver/lang/c++/build"
    make DESTDIR="$pkgdir/" install
}
