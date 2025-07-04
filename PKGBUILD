# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>

_android_arch=riscv64

pkgname=android-${_android_arch}-libarchive
pkgver=3.8.1
pkgrel=1
arch=('any')
pkgdesc="Multi-format archive and compression library (Android ${_android_arch})"
url='https://libarchive.org/'
license=('BSD')
depends=("android-${_android_arch}-bzip2"
         "android-${_android_arch}-libxml2"
         "android-${_android_arch}-lz4"
         "android-${_android_arch}-openssl"
         "android-${_android_arch}-xz"
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-zstd")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/libarchive/libarchive/releases/download/v${pkgver}/libarchive-${pkgver}.tar.xz")
md5sums=('80fd1a7acc4da7c7d4a5f9f96df6e3ff')

build() {
    cd "${srcdir}/libarchive-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -I${PWD}/contrib/android/include"

    android-${_android_arch}-configure \
        --disable-bsdcat \
        --disable-bsdcpio \
        --disable-bsdtar \
        --disable-bsdunzip \
        --without-nettle
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libarchive-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
