# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>

pkgname=usd-hdospray
pkgver=1.0.0
pkgrel=1
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

source=("git+$url.git")
sha512sums=('SKIP')

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
