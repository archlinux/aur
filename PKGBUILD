#!/bin/hint/bash
# Maintainer  : Riccardo Lops <riccardolops@proton.me>

pkgname=optix77
pkgver=7.7.0
pkgrel=1
pkgdesc="An application framework for achieving optimal ray tracing performance on the GPU."
arch=('x86_64')
url="https://developer.nvidia.com/optix"
license=('custom:NVIDIA')
depends=('cuda')
provides=("${pkgname%77}=${pkgver%.0}")
conflicts=('optix')
options=(!strip)
_script="NVIDIA-OptiX-SDK-$pkgver-linux64-x86_64.sh"
source=("file://$_script"
        "file://cmake.patch")
sha512sums=('d81be0ad65edd49bbb1d078a3e005dc38b24042f5d0880e328eb7ac5c584ee5fcf48da50150d5357282e94333c42cbb21e0a6e2860e02e9d48299cd0db201874'
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

