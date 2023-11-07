# Maintainer: Lennart Braun <lenerd@posteo.de>
pkgname=onnx
pkgver=1.15.0
pkgrel=1
pkgdesc="C++ library for the open standard for machine learning interoperability"
arch=('x86_64')
url="https://onnx.ai"
license=('MIT')
depends=('glibc' 'protobuf')
makedepends=('cmake' 'git' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
b2sums=("4d35b82c128a69124b9bfcb3e56b3d584b7451ae739a91039e201dd485efa3e90e34e6cf135993317622f8f524160a38556231b2b0561e93d8cd0487abf35c1b")

prepare() {
    cd "$pkgname-$pkgver"
    # make sure CMake gets the flags
    export CPPFLAGS
    export CFLAGS
    export CXXFLAGS
    export LDFLAGS
    export MAKEFLAGS
    cmake \
        -DCMAKE_CXX_STANDARD=17 \
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
