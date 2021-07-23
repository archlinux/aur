#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Contributor: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Mitch Bigelow <ipha00 at gmail dot com>

pkgname=ncnn
pkgver=20210720
pkgrel=1
pkgdesc='High-performance neural network inference framework optimized for the mobile platform'
url='https://github.com/Tencent/ncnn'
arch=('i686' 'x86_64')
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
b2sums=('f3ce1cf53f6b821e66794f2c14fa92454a842b83f8be54a5300da4fc399cd3444df8c630ab999fe4d085c0466c207954851a4fbe266c9088b48f579f6fe2cf6a')

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
