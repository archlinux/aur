# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_android_arch=aarch64

pkgname=android-${_android_arch}-libunistring
pkgver=0.9.10
pkgrel=1
pkgdesc="Library for manipulating Unicode strings and C strings (android)"
arch=('any')
url="https://www.gnu.org/software/libunistring/"
license=('GPL')
depends=('android-ndk'
         "android-${_android_arch}-libiconv")
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure')
source=("https://ftp.gnu.org/gnu/libunistring/libunistring-${pkgver}.tar.xz"{,.sig})
sha256sums=('eb8fb2c3e4b6e2d336608377050892b54c3c983b646c561836550863003c05d7'
            'SKIP')
validpgpkeys=('462225C3B46F34879FC8496CD605848ED7E69871') # Daiki Ueno <ueno@gnu.org>

build() {
    cd "${srcdir}"/libunistring-${pkgver}
    source android-env ${_android_arch}

    android-${_android_arch}-configure
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/libunistring-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
