# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: seth <getchoo at tuta dot io>
# Contributor: xantares

_android_arch=x86-64

pkgname=android-${_android_arch}-zstd
_pkgname=zstd
pkgver=1.5.5
pkgrel=1
arch=('any')
pkgdesc="Zstandard - Fast real-time compression algorithm (android)"
url="http://www.zstd.net/"
license=('BSD' 'GPL2')
depends=("android-${_android_arch}-zlib"
         "android-${_android_arch}-xz"
         "android-${_android_arch}-lz4")
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/facebook/zstd/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('98e9c3d949d1b924e28e01eccb7deed865eefebf25c2f21c702e5cd5b63b85e1')

build() {
    cd "${srcdir}/zstd-${pkgver}"
    source android-env ${_android_arch}

    mkdir -p build && pushd build
    android-${_android_arch}-cmake \
        -S ../build/cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DZSTD_ZLIB_SUPPORT=ON \
        -DZSTD_LZMA_SUPPORT=ON \
        -DZSTD_LZ4_SUPPORT=ON \
        -DZSTD_BUILD_CONTRIB=OFF \
        -DZSTD_BUILD_TESTS=OFF \
        -DZSTD_PROGRAMS_LINK_SHARED=OFF \
        -DZSTD_BUILD_PROGRAMS=OFF
    make $MAKEFLAGS
    popd
}

package() {
    cd "${srcdir}/zstd-${pkgver}"
    source android-env ${_android_arch}

    pushd build
    make DESTDIR="${pkgdir}" install
    popd

    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
