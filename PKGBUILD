# Maintainer: Chuyan Zhang <me [at] zcy [dot] moe>

pkgbase=nvidia-flip-cuda-git
pkgname=("$pkgbase")
pkgdesc="A Tool for Visualizing and Communicating Errors in Rendered Images - CUDA version"
pkgver="r219.22aa24f"
pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
pkgrel=1
url="https://github.com/NVlabs/flip"
arch=('x86_64')
license=("BSD-3-Clause")

source=("$pkgbase::git+$url")
sha256sums=('SKIP')
makedepends=(git)
depends=(cuda)

prepare() {
    cd "$pkgbase"

    # GCC 13 compatibility
    sed -i '55a\#include <cstdint>' cpp/tool/pooling.h
    sed -i '54a\#include <cstdint>' cpp/tool/filename.h
}

build() {
    cd "$pkgbase"

    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DFLIP_ENABLE_CUDA=ON
    cmake --build .
}


package() {
    cd "$pkgbase"
    install -Dm755 "build/flip" "$pkgdir/usr/bin/flip-cuda-cli"
}
