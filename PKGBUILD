# Maintainer: Andrew Nelless <andrew at nelless dot net>
pkgname='avro-cpp'
pkgver=1.8.1
pkgrel=1
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
sha256sums=('6559755ac525e908e42a2aa43444576cba91e522fe989088ee7f70c169bcc403'
            '5d54151dd25e717a19109c97e68ce2a07d3b28b9fd3fb3ae1dc5df06b8600fd4'
            '3c35ec2d6982b98accad0663d9ce732718c4c775631a7a07b473613deb9e30c9')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 -i "$srcdir/$pkgname-python2.patch"
    patch -p1 -i "$srcdir/$pkgname-boost160.patch"
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
