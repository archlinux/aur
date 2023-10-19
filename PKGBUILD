# Maintainer: cnf3rd <sub.in.tokyo@gmail.com>
pkgname=onnx-git
pkgver=1.14.1.0.g1014f41f1
pkgrel=1
pkgdesc='C++ library for the open standard for machine learning interoperability'
arch=('x86_64')
url="https://onnx.ai"
license=('MIT')
depends=('glibc' 'protobuf')
makedepends=('cmake' 'git' 'python')
provides=('onnx')
conflicts=('onnx' 'onnx-py' 'python-onnx')
source=("${pkgname}-${pkgver}::git+https://github.com/onnx/onnx.git")
b2sums=("SKIP")

prepare() {
    cd "$pkgname-$pkgver"
    export CPPFLAGS CFLAGS CXXFLAGS LDFLAGS MAKEFLAGS
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

pkgver() {
  cd "$pkgname-$pkgver"
  echo "$(git describe --long --tags $(git rev-list --tags --max-count=1) | tr - . | tr -d v)"
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
