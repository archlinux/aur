# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-mpg123
pkgver=1.33.0
pkgrel=1
arch=('any')
pkgdesc="Console based real time MPEG Audio Player for Layer 1, 2 and 3 (Android ${_android_arch})"
url='https://mpg123.de/'
license=('LGPL2.1')
groups=('android-mpg123')
depends=("android-${_android_arch}-alsa-lib")
makedepends=('android-configure'
             "android-${_android_arch}-sdl2")
optdepends=("android-${_android_arch}-sdl2: for sdl audio support")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.sourceforge.net/sourceforge/mpg123/mpg123-${pkgver}.tar.bz2"{,.sig})
md5sums=('7a1373ffe9efa86e899d415b37f3acaf'
         'SKIP')
validpgpkeys=('D021FF8ECF4BE09719D61A27231C4CBC60D5CAFE')

build() {
    cd "${srcdir}/mpg123-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-components \
        --enable-libmpg123 \
        --enable-libout123 \
        --enable-libout123-modules \
        --enable-libsyn123 \
        --enable-int-quality \
        --with-audio="alsa oss sdl"
    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/mpg123-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
