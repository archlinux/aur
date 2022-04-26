#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Mitch Bigelow <ipha00 at gmail dot com>

pkgname=ncnn
pkgver=20220420
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
b2sums=('fcecf395e54ff683bb8301365d805b99439b3797493e419fa8c99a325ebd1dfd80e65b08cffd9283fe453010a0cdde221aeeffa37e154335d2f6d7f6c6b9b138')

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
