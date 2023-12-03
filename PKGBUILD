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

source=("git+$url.git"
        "hdospray.patch"
       )
sha512sums=('SKIP'
            '2454ba6f961013b7c80ac6d444a005a6792c1d02f1a76810c53cdf5efaf0367f3d364567776a5660f0024c64e9436895793aaabd9e61221b92917f38aff6a28a')

# prepare() {
#     cd "${srcdir}"
# 
#     patch --directory=hdospray --forward --strip=1 --input="${srcdir}/hdospray.patch"
# }

build() {
#     export CC=clang && export CXX=clang++

    _CMAKE_FLAGS+=(
        -DCMAKE_INSTALL_PREFIX=/
        -DHDOSPRAY_ENABLE_DENOISER=ON
#         -Dospray_DIR=/home/adro/Applications/AUR/usd-hdospray/src/ospray-3.0.0.x86_64.linux/lib/cmake/ospray-3.0.0
    )

    cmake -S hdospray -B build -G Ninja "${_CMAKE_FLAGS[@]}"

    ninja -C build ${MAKEFLAGS:--j12}
    DESTDIR="$srcdir" ninja -C build install
}

package() {
    mkdir -p ${pkgdir}/usr/lib/usd/plugin
    cp -r "$srcdir"/plugin/usd/* ${pkgdir}/usr/lib/usd/plugin
}
