# Maintainer: Lennart Braun <lenerd@posteo.de>
pkgname=onnx
pkgver=1.11.0
pkgrel=1
pkgdesc="C++ library for the open standard for machine learning interoperability"
arch=('x86_64')
url="https://onnx.ai"
license=('MIT')
depends=('glibc' 'protobuf')
makedepends=('cmake' 'git' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
b2sums=("dfc8ab81d4776f806fa26c751c1eb1e19ea4cf9f0aa498880dc18eca160fdd9c43eda0077124ea7a674082e5ed93de7497411c48c3f9a12146905072e6477af6")

prepare() {
    cd "$pkgname-$pkgver"
    # make sure CMake gets the flags
    export CPPFLAGS
    export CFLAGS
    export CXXFLAGS
    export LDFLAGS
    export MAKEFLAGS
    cmake \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DONNX_BUILD_TESTS=On \
        -DONNX_USE_PROTOBUF_SHARED_LIBS=On \
        -DCMAKE_POSITION_INDEPENDENT_CODE=On \
        -Wno-dev \
        -B build
}

build() {
    cd "$pkgname-$pkgver/build"
    make
}

check() {
    cd "$pkgname-$pkgver/build"
    LD_LIBRARY_PATH=. ./onnx_gtests
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd build
    make DESTDIR="$pkgdir/" install
    find "$pkgdir" -type d -name test -prune -exec rm -r {} \;
    find "$pkgdir" -type d -empty -delete
}
