# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Norberto Lopes <shelika@mail.telepac.pt>
# Contributor: Kao Dome <kaodome@gmail.com>
# Contributor: Dmitrij D. Czarkoff <czarkoff@gmail.com>
# Contributor: Mathias Rohnstock <linksoft@gmx.de>

_android_arch=x86-64

pkgname=android-${_android_arch}-libmicrohttpd
pkgver=1.0.1
pkgrel=1
arch=('any')
pkgdesc="a small C library that is supposed to make it easy to run an HTTP server as part of another application. (Android ${_android_arch})"
url='https://www.gnu.org/software/libmicrohttpd/'
license=('LGPL')
depends=("android-${_android_arch}-gnutls")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-${pkgver}.tar.gz"{,.sig})
sha256sums=('a89e09fc9b4de34dde19f4fcb4faaa1ce10299b9908db1132bbfa1de47882b94'
            'SKIP')
validpgpkeys=('EA812DBEFA5A7EF17DA8F2C1460A317C3326D2AE'  # Evgeny Grin (Karlson2k) <k2k@yandex.ru>
              'D8423BCB326C7907033929C7939E6BE1E29FC3CC') # Christian Grothoff <christian.grothoff@bfh.ch>

build() {
    cd "${srcdir}/libmicrohttpd-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
      --disable-doc \
      --disable-examples \
      --disable-tools \
      --disable-dependency-tracking \
      --enable-curl \
      --enable-https \
      --enable-largefile \
      --enable-messages \
      --with-pic
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libmicrohttpd-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
