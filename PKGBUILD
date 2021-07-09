#!/bin/hint/bash
# Maintainer  : bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor : Yuan Zhou <xyyqzy@hotmail.com>

pkgname=optix72
pkgver=7.2.0
pkgrel=1
pkgdesc="A software development kit for achieving high performance ray tracing on the GPU."
arch=('x86_64')
url="https://developer.nvidia.com/optix"
license=('custom:NVIDIA')
depends=('cuda')
provides=("${pkgname%72}=${pkgver%.0}")
options=(!strip)
_script="NVIDIA-OptiX-SDK-$pkgver-linux64-x86_64.sh"
source=("file://$_script"
        "file://cmake.patch")
sha512sums=('c37f36e2c0d5dbf151a03513e9dc82c21c46f1a88b123153647f44f4305367d1021e522236dda97ab9c641db006242507ae323d668cf2186cf04a83a54b5707f'
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

