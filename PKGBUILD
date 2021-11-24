#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Mitch Bigelow <ipha00 at gmail dot com>

pkgname=ncnn
pkgver=20211122
pkgrel=1
pkgdesc='High-performance neural network inference framework optimized for the mobile platform'
url='https://github.com/Tencent/ncnn'
arch=('any')
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
b2sums=('5bffad938c0a5048256c3a05659601ab7e8c24cd61d1c634dc2620e56adc887b0747d8e8959a34049297ebf14bc881f9f49af4b506ca9d97556337071408c3b1')

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
