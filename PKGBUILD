# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86

pkgname=android-${_android_arch}-gettext
pkgver=0.22.5
pkgrel=1
arch=('any')
pkgdesc="GNU internationalization library (Android ${_android_arch})"
depends=("android-${_android_arch}-termcap"
         "android-${_android_arch}-libunistring"
         "android-${_android_arch}-libxml2")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
license=("GPL")
url="http://www.gnu.org/software/gettext/"
source=("http://ftp.gnu.org/pub/gnu/gettext/gettext-${pkgver}.tar.gz"
        "intl.pc")
sha256sums=('ec1705b1e969b83a9f073144ec806151db88127f5e40fe5a94cb6c8fa48996a0'
            '0dc8a3e2c95d79aacaeaacd3c90e41c0f5d6ba9cfbc949a0ca55f4b0fd389d9c')

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
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    # provide pkgconfig file for iconv library

    install -dm755 "$pkgdir/${ANDROID_PREFIX_LIB}/pkgconfig"
    install -m644 "$srcdir/intl.pc" "$pkgdir/${ANDROID_PREFIX_LIB}/pkgconfig"
    sed -i "$pkgdir/${ANDROID_PREFIX_LIB}/pkgconfig/intl.pc" \
        -e "s|@PREFIX[@]|${ANDROID_PREFIX}|g" \
        -e "s|@VERSION[@]|$pkgver|g"
}
