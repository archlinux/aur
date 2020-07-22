# Maintainer: Yuan Zhou <xyyqzy@hotmail.com>

pkgname=optix
pkgver=7.1.0
pkgrel=2
pkgdesc="A software development kit for achieving high performance ray tracing on the GPU."
arch=('x86_64')
url="https://developer.nvidia.com/optix"
license=('custom:NVIDIA')
depends=('cuda')
options=(!strip)
_script="NVIDIA-OptiX-SDK-$pkgver-linux64-x86_64.sh"
source=("file://$_script"
        "file://cmake.patch")
sha512sums=('808a45e2007d8081de21fe15cad4577ba9fe10fc3612486b1230e03b7f17de91902dc773d1f3fef2b89398f230448d9522a03e19d4e6fa12aa4ffd78f1a4f9dc'
            'c2b3f122bf4e5d1bd987c3ce9693b24d2acd55f71f7366e49ebc0ba2f800945e6ddde439428761c6c12ec77f34a9334fb6900af2c1b10c40dd2905bb58c9ded2')

if ! [ -f $_script ]; then
    msg2 "Please manually download $_script to $PWD from https://developer.nvidia.com/designworks/optix/download."
    exit 1
fi

package() {
    mkdir -p "$pkgdir/opt/optix"
    sh "$srcdir/$_script" --prefix="$pkgdir/opt/optix" --exclude-subdir --skip-license
    patch "$pkgdir/opt/optix/SDK/CMake/FindOptiX.cmake" "$srcdir/cmake.patch"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /opt/optix/doc/OptiX_EndUserLicense.pdf "$pkgdir/usr/share/licenses/$pkgname/OptiX_EndUserLicense.pdf"
}

