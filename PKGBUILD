# Maintainer: Lennart Braun <lenerd@posteo.de>
pkgname=onnx
pkgver=1.13.0
pkgrel=1
pkgdesc="C++ library for the open standard for machine learning interoperability"
arch=('x86_64')
url="https://onnx.ai"
license=('MIT')
depends=('glibc' 'protobuf')
makedepends=('cmake' 'git' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
b2sums=("b256693f883a98dbf38286a925576ede3fbf8db40058b9eef717a64174a25c2ba3e52176a0a761fd1bb4d0cbfeb05895d98a16f0ff81d28af71cb8c4f8f79dfc")

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
