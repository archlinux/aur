# Maintainer: Yuan Zhou <xyyqzy@hotmail.com>

pkgname=optix70
pkgver=7.0.0
pkgrel=1
pkgdesc="A software development kit for achieving high performance ray tracing on the GPU."
arch=('x86_64')
url="https://developer.nvidia.com/optix"
license=('custom:NVIDIA')
depends=('cuda')
provides=("optix=${pkgver%.*}")
conflicts=('optix')
options=(!strip)
_script="NVIDIA-OptiX-SDK-$pkgver-linux64.sh"
source=("file://$_script"
        "file://cmake.patch")
sha512sums=('349baf367af7890afac87a879c8f7360cc9c93e984cf234216062af0a3cedce8fc6f3fd74240897d4b3854622ce1976a78433cbeadf6fa89c8e84d24e26eef89'
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

