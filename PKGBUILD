# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libunistring
pkgver=1.3
pkgrel=1
arch=('any')
pkgdesc="Library for manipulating Unicode strings and C strings (Android ${_android_arch})"
url="https://www.gnu.org/software/libunistring/"
license=('GPL')
groups=('android-libunistring')
depends=('android-ndk'
         "android-${_android_arch}-libiconv")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://ftp.gnu.org/gnu/libunistring/libunistring-${pkgver}.tar.xz"{,.sig})
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871'  # Daiki Ueno <ueno@unixuser.org>
              '9001B85AF9E1B83DF1BDA942F5BE8B267C6A406D') # Bruno Haible (Open Source Development) <bruno@clisp.org>
md5sums=('57dfd9e4eba93913a564aa14eab8052e'
         'SKIP')

build() {
    cd "${srcdir}/libunistring-${pkgver}"
    source android-env ${_android_arch}

    export ac_cv_func_pthread_atfork=no

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libunistring-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
