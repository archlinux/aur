#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Mitch Bigelow <ipha00 at gmail dot com>

pkgname=ncnn
pkgver=20211208
pkgrel=1
pkgdesc='High-performance neural network inference framework optimized for the mobile platform'
url='https://github.com/Tencent/ncnn'
arch=('x86_64')
license=('BSD')
depends=()
makedepends=(
    'cmake'
    'glslang-git'
    'ninja'
    'vulkan-headers'
    'vulkan-icd-loader'
    'gcc'
)
conflicts=('ncnn-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Tencent/ncnn/archive/$pkgver.tar.gz")
b2sums=('7ed8806681c9c4d58b05d1120fec95c5fdc2bd036ded045775938e64cda9313f37d0c63f2d0bc64d3aa2629f6c222819bb032e6d9f503dfdafb5816e07851954')

prepare() {
    cd "$srcdir/ncnn-$pkgver" || exit

    # fix double path
    sed -i 's|glslang/glslang|glslang|' src/gpu.cpp
}

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -GNinja \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DNCNN_BUILD_EXAMPLES=OFF \
        -DNCNN_BUILD_TOOLS=OFF \
        -DNCNN_VULKAN=ON \
        -DNCNN_SYSTEM_GLSLANG=ON \
        -DGLSLANG_TARGET_DIR=/usr/lib/cmake/ \
        -Wno-dev
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 "$srcdir/ncnn-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
