# Maintainer: Andrew Nelless <andrew at nelless dot net>
pkgname='avro-cpp'
pkgver=1.7.7
pkgrel=1
arch=('i686' 'x86_64')

pkgdesc="C++ implementation of the Apache Avro data serialization system"
url="https://avro.apache.org/"
license=('Apache')

groups=('avro')
depends=('boost-libs')
makedepends=('boost' 'cmake' 'python2')
source=("http://www.us.apache.org/dist/avro/avro-$pkgver/cpp/$pkgname-$pkgver.tar.gz"
	$pkgname-python2.patch)
md5sums=('aa9c79f95eb6495e1bbf108cf1668c4a'
         'aebf65c98fedbe1b875c396181336f23')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 -i "$srcdir/$pkgname-python2.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir build
    cd build

    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_CXX_FLAGS_RELEASE="$CXXFLAGS $CPPFLAGS -DNDEBUG" \
        -DCMAKE_C_FLAGS_RELEASE="$CFLAGS $CPPFLAGS -DNDEBUG" \
        -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
        -DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS" ..
    VERBOSE=1 make
}

check() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make test
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}
