# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>

pkgname=usd-hdospray
pkgver=0.11.0
pkgrel=2
pkgdesc='OSPRay interactive rendering plugin for USD Hydra'
arch=(x86_64)
url='https://github.com/ospray/hdospray'
license=('Apache')
depends=(usd
         python
         gcc
         ospray
         openimagedenoise
         embree)
makedepends=(cmake)
options=(!lto)

source=("git+$url#tag=v0.11.0-usdv22.08"
        "hdospray.patch"
       )
sha512sums=('SKIP'
            '2454ba6f961013b7c80ac6d444a005a6792c1d02f1a76810c53cdf5efaf0367f3d364567776a5660f0024c64e9436895793aaabd9e61221b92917f38aff6a28a')

prepare() {
    cd "${srcdir}"

    patch --directory=hdospray --forward --strip=1 --input="${srcdir}/hdospray.patch"
}

build() {
    _CMAKE_FLAGS+=(
        -DCMAKE_INSTALL_PREFIX=/
        -DHDOSPRAY_ENABLE_DENOISER=ON
    )

    cmake -S hdospray -B build -G Ninja "${_CMAKE_FLAGS[@]}"

    ninja -C build ${MAKEFLAGS:--j12}
    DESTDIR="$srcdir" ninja -C build install
}

package() {
    mkdir -p ${pkgdir}/usr/lib/usd/plugin
    cp -r "$srcdir"/plugin/usd/* ${pkgdir}/usr/lib/usd/plugin
}
