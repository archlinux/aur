# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

_android_arch=aarch64

pkgname=android-${_android_arch}-libshout
pkgver=2.4.6
pkgrel=2
pkgdesc="Library for accessing a shoutcast/icecast server (Android ${_android_arch})"
arch=('any')
url="https://www.icecast.org/"
license=('LGPL')
depends=("android-${_android_arch}-libvorbis"
         "android-${_android_arch}-libtheora"
         "android-${_android_arch}-speex"
         "android-${_android_arch}-openssl")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.xiph.org/releases/libshout/libshout-${pkgver}.tar.gz")
md5sums=('4a66a369a01ce790e578221fa2c8ea60')

build() {
    cd "${srcdir}/libshout-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}" \
        --localstatedir="${ANDROID_PREFIX_VAR}" \
        --disable-examples \
        --disable-tools
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libshout-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
