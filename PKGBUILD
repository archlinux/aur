# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libunistring
pkgver=1.4.1
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
source=("https://ftp.gnu.org/gnu/libunistring/libunistring-${pkgver}.tar.xz")
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871')
md5sums=('7419fcbca7c0b29d3b218a09a15cbc76')

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

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
