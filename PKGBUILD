# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Yuan Zhou <xyyqzy@hotmail.com>

pkgname=optix
pkgver=8.0.0
pkgrel=1
pkgdesc="An application framework for achieving optimal ray tracing performance on the GPU."
arch=(x86_64)
url="https://developer.nvidia.com/optix"
license=('custom:NVIDIA')
depends=(cuda)
options=(!strip)
_script="NVIDIA-OptiX-SDK-${pkgver}-linux64-x86_64.sh"
source=("local://${_script}"
        "cmake.patch")
sha512sums=('5f053000fa5bcf47c5d2b9518cc0f5d6219dbf01b27bcf446a291b6070f3417b4ec93afd93cff88e77a9c2c2ce5561aff9b7400912c9eb027d3db39898cfad52'
            'c2b3f122bf4e5d1bd987c3ce9693b24d2acd55f71f7366e49ebc0ba2f800945e6ddde439428761c6c12ec77f34a9334fb6900af2c1b10c40dd2905bb58c9ded2')

if ! [ -f ${_script} ]; then
    echo "Please manually download ${_script} to $PWD from https://developer.nvidia.com/designworks/optix/download."
    exit 1
fi

package() {
    mkdir -p "$pkgdir/opt/optix"
    sh "$srcdir/${_script}" --prefix="$pkgdir/opt/optix" --exclude-subdir --skip-license
    patch "$pkgdir/opt/optix/SDK/CMake/FindOptiX.cmake" "$srcdir/cmake.patch"
    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
    ln -s /opt/optix/doc/OptiX_EndUserLicense.pdf "$pkgdir/usr/share/licenses/${pkgname}/OptiX_EndUserLicense.pdf"
}

