# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: seth <getchoo at tuta dot io>
# Contributor: xantares

_android_arch=x86

pkgname=android-${_android_arch}-zstd
_pkgname=zstd
pkgver=1.5.7
pkgrel=1
arch=('any')
pkgdesc="Zstandard - Fast real-time compression algorithm (Android ${_android_arch})"
url="http://www.zstd.net/"
license=('BSD'
         'GPL2')
groups=('android-zstd')
depends=("android-${_android_arch}-zlib"
         "android-${_android_arch}-xz"
         "android-${_android_arch}-lz4")
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/facebook/zstd/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('619a019adbbc4536e7fb93cdbb01af3e')

build() {
    cd "${srcdir}/zstd-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S build/cmake \
        -B builddir \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DZSTD_ZLIB_SUPPORT=ON \
        -DZSTD_LZMA_SUPPORT=ON \
        -DZSTD_LZ4_SUPPORT=ON \
        -DZSTD_BUILD_CONTRIB=OFF \
        -DZSTD_BUILD_TESTS=OFF \
        -DZSTD_PROGRAMS_LINK_SHARED=OFF \
        -DZSTD_BUILD_PROGRAMS=OFF
    make -C builddir $MAKEFLAGS
}

package() {
    cd "${srcdir}/zstd-${pkgver}"
    source android-env ${_android_arch}

    make -C builddir DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
}
