# Maintainer: Salamandar <felix@piedallu.me>

pkgname=mingw-w64-libsoundio
_pkgname=libsoundio
pkgver=2.0.0
pkgrel=2
pkgdesc="A C99 library providing cross-platform audio input and output (mingw-w64)"
arch=(any)
url="http://www.github.com/andrewrk/libsoundio"
license=("MIT")
source=("https://github.com/andrewrk/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('67a8fc1c9bef2b3704381bfb3fb3ce99e3952bc4fea2817729a7180fddf4a71e')
depends=(
    'mingw-w64-crt'
)
makedepends=(
    'mingw-w64-cmake' 
    'mingw-w64-gcc' 
)
options=(!strip staticlibs !buildflags)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    for _arch in ${_architectures}; do
        mkdir -p build-${_arch} && pushd build-${_arch}
        ${_arch}-cmake \
            -D CMAKE_BUILD_TYPE=Release \
            -D CMAKE_INSTALL_LIBDIR=lib \
            -D BUILD_EXAMPLE_PROGRAMS=OFF \
            -D BUILD_TESTS=OFF \
            -D BUILD_STATIC_LIBS=ON \
            -D ENABLE_JACK=OFF \
            "$srcdir/$_pkgname-$pkgver"
        make
        popd
    done
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    for _arch in ${_architectures}; do
        pushd build-${_arch}
        make DESTDIR="${pkgdir}" install
        popd
    done
}
