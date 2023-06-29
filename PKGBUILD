#!/bin/bash

# Maintainer: PumpkinCheshire <me @ pumpkincheshire dot com>

pkgname=rife-ncnn-vulkan
pkgver=20221029
pkgrel=1
pkgdesc="RIFE, Real-Time Intermediate Flow Estimation for Video Frame Interpolation implemented with ncnn library."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/nihui/rife-ncnn-vulkan"
license=('MIT')
depends=('vulkan-icd-loader' 'libwebp' 'ncnn')
makedepends=('git' 'cmake' 'glslang' 'vulkan-headers' 'ncnn')
provides=("rife-ncnn-vulkan")
conflicts=("rife-ncnn-vulkan-git" "rife-ncnn-vulkan-bin")
source=("https://github.com/nihui/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('8c279d63b101c5ff8aa0a4205276326031d4bf5418e5fcf3752bb626a108f4fea640403a30da96a7fd62dcd186552f5a228e3c731a968764d00a308eff3cf0c8')

prepare() {
    sed -i 's|path_t model = PATHSTR("rife-HD")|path_t model = PATHSTR("/usr/share/rife-ncnn-vulkan/rife-HD")|' "${pkgname}-${pkgver}"/src/main.cpp

    sed -i 's|return get_executable_directory() + path;|return "/usr/share/rife-ncnn-vulkan/" + path;|' "${pkgname}-${pkgver}"/src/filesystem_utils.h
}

build() {
    cmake -B build -S "$pkgname-$pkgver"/src \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGLSLANG_TARGET_DIR=/usr/lib/cmake \
        -DUSE_SYSTEM_NCNN=on \
        -DUSE_SYSTEM_WEBP=on
    cmake --build build
}

package() {
    install -Dm755 -t "$pkgdir/usr/bin" "build/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE"

    cd "$srcdir/$pkgname-$pkgver/models/" || exit
    for f in rife*/*; do
        install -Dm 644 "$f" "$pkgdir/usr/share/$pkgname/$f"
    done
}
