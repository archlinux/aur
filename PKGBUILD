# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-gettext
pkgver=0.25
pkgrel=1
arch=('any')
pkgdesc="GNU internationalization library (Android ${_android_arch})"
groups=("android-${_android_arch}-gettext")
depends=("android-${_android_arch}-termcap"
         "android-${_android_arch}-libunistring"
         "android-${_android_arch}-libxml2")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
license=("GPL")
url="http://www.gnu.org/software/gettext/"
source=("http://ftp.gnu.org/pub/gnu/gettext/gettext-${pkgver}.tar.gz"
        "intl.pc")
md5sums=('7001edf7c4c160d921f8cc5ea83968f4'
         'b0a123ec7ad1a345d0d712dae986a543')

build() {
    cd "${srcdir}/gettext-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --infodir="${ANDROID_PREFIX_SHARE}/info/gettext" \
        --disable-java \
        --disable-native-java \
        --disable-csharp \
        --enable-threads=posix \
        --enable-nls \
        --with-xz \
        --without-emacs
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/gettext-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    # provide pkgconfig file for iconv library

    install -dm755 "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig"
    install -m644 "${srcdir}/intl.pc" "$pkgdir/${ANDROID_PREFIX_LIB}/pkgconfig"
    sed -i "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig/intl.pc" \
        -e "s|@PREFIX[@]|${ANDROID_PREFIX}|g" \
        -e "s|@VERSION[@]|${pkgver}|g"
}
