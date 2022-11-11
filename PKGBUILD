#!/bin/hint/bash
# Maintainer  : bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor : Yuan Zhou <xyyqzy@hotmail.com>

pkgname=optix74
pkgver=7.4.0
pkgrel=1
pkgdesc="An application framework for achieving optimal ray tracing performance on the GPU."
arch=('x86_64')
url="https://developer.nvidia.com/optix"
license=('custom:NVIDIA')
depends=('cuda')
provides=("${pkgname%74}=${pkgver%.0}")
conflicts=('optix')
options=(!strip)
_script="NVIDIA-OptiX-SDK-$pkgver-linux64-x86_64.sh"
source=("file://$_script"
        "file://cmake.patch")
sha512sums=('04f50c49d08c5e4e9be73ee322c4bff4f10a5e30445bc431e213c879a35cc5e36e0ceb8c864313f417628575a3c71593e65467ea13dd111b432fdf1db9383ae0'
            'c2b3f122bf4e5d1bd987c3ce9693b24d2acd55f71f7366e49ebc0ba2f800945e6ddde439428761c6c12ec77f34a9334fb6900af2c1b10c40dd2905bb58c9ded2')

if ! [ -f $_script ]; then
    msg2 "Please manually download $_script to $PWD from https://developer.nvidia.com/designworks/optix/download."
    exit 1
fi

package() {
    mkdir -p "$pkgdir/opt/optix"
    sh "$srcdir/$_script" --prefix="$pkgdir/opt/optix" --exclude-subdir --skip-license
    patch "$pkgdir/opt/optix/SDK/CMake/FindOptiX.cmake" "$srcdir/cmake.patch"
    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
    ln -s /opt/optix/doc/OptiX_EndUserLicense.pdf "$pkgdir/usr/share/licenses/${pkgname}/OptiX_EndUserLicense.pdf"
}

