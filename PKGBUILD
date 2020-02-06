# Maintainer: Andrew Nelless <andrew at nelless dot net>
pkgname='avro-cpp'
pkgver=1.9.2_rc1
pkgrel=1
arch=('i686' 'x86_64')

pkgdesc="C++ implementation of the Apache Avro data serialization system"
url="https://avro.apache.org/"
license=('Apache')
groups=('avro')
depends=('boost-libs')
makedepends=('boost' 'cmake' 'python2')
_cppdir="avro-release-${pkgver//_/-}/lang/c++"

source=(
	"https://github.com/apache/avro/archive/release-${pkgver//_/-}.tar.gz"
#	"https://www-us.apache.org/dist/avro/avro-$pkgver/cpp/$pkgname-$pkgver.tar.gz"
	$pkgname-python2.patch)
sha256sums=('20c43ec8a0a4329caa875c35538b9b0faf60b6b0e6822c330b59a0ec83d11c73'
            '5d54151dd25e717a19109c97e68ce2a07d3b28b9fd3fb3ae1dc5df06b8600fd4')

prepare() {
    cd "$srcdir/$_cppdir"
    patch -p1 -i "$srcdir/$pkgname-python2.patch"
}

build() {
    cd "$srcdir/$_cppdir"
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
    cd "$srcdir/$_cppdir/build"
    make test
}

package() {
    cd "$srcdir/$_cppdir/build"
    make DESTDIR="$pkgdir/" install
}
