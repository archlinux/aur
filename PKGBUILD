# Maintainer: Andrew Nelless <andrew at nelless dot net>
pkgname='avro-cpp'
pkgver=1.7.7
pkgrel=2
arch=('i686' 'x86_64')

pkgdesc="C++ implementation of the Apache Avro data serialization system"
url="https://avro.apache.org/"
license=('Apache')

groups=('avro')
depends=('boost-libs')
makedepends=('boost' 'cmake' 'python2')
source=("http://www.us.apache.org/dist/avro/avro-$pkgver/cpp/$pkgname-$pkgver.tar.gz"
	$pkgname-python2.patch
        $pkgname-boost160.patch)
sha256sums=('f9bdfad58f513014940fcda372840e36f4f3787a20a00bc0666d254973a1ec1d'
            'fa454091ea8b8886b71d16f2c0a51a7851cb2da8bb01f1bb028a0a9595d80da8'
            '0a144caf1ff99e51a0c3ab1c704ca50fea93fb831a68e2583b83356e83ff8837')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 -i "$srcdir/$pkgname-python2.patch"
    patch -p2 -i "$srcdir/$pkgname-boost160.patch"
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
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make test
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}
