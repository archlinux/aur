# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-libopenmpt
pkgver=0.7.8
pkgrel=1
arch=('any')
pkgdesc="A library to render tracker music to a PCM audio stream (Android ${_android_arch})"
url="https://lib.openmpt.org/libopenmpt/"
license=('BSD-3-Clause')
depends=("android-${_android_arch}-flac"
         "android-${_android_arch}-libogg"  # required by pkgconf
         "android-${_android_arch}-libsndfile"
         "android-${_android_arch}-libvorbis"
         "android-${_android_arch}-mpg123"
         "android-${_android_arch}-zlib")
makedepends=('autoconf-archive')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-$pkgver+release.autotools.tar.gz")
md5sums=('a620528300b864ded72eeb449e68dedc')

prepare() {
    cd "${srcdir}/libopenmpt-$pkgver+release.autotools"
    source android-env ${_android_arch}

    autoreconf -fiv
}

build() {
    cd "${srcdir}/libopenmpt-$pkgver+release.autotools"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-openmpt123 \
        --disable-examples \
        --disable-tests \
        --disable-doxygen-doc
    # prevent excessive overlinking due to libtool
    sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libopenmpt-$pkgver+release.autotools"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
