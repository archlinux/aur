# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-opus
pkgver=1.5.2
pkgrel=1
arch=('any')
pkgdesc="Codec designed for interactive speech and audio transmission over the Internet (Android ${_android_arch})"
url="http://www.opus-codec.org"
license=("BSD")
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("http://downloads.us.xiph.org/releases/opus/opus-${pkgver}.tar.gz")
md5sums=('c40b3a1fbdbb9a7aa178600b88200c76')

prepare() {
    cd "${srcdir}/opus-${pkgver}"
    source android-env ${_android_arch}

    check_ndk_version_ge_than 18.0
}

build() {
    cd "${srcdir}/opus-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-custom-modes \
        --disable-doc
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/opus-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
