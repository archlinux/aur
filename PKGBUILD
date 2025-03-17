# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libxv
pkgver=1.0.13
pkgrel=1
arch=('any')
pkgdesc="X11 Video extension library (Android ${_android_arch})"
license=('custom')
url="https://xorg.freedesktop.org/"
groups=('android-libxv')
depends=("android-${_android_arch}-libxext")
makedepends=('android-configure'
             "android-${_android_arch}-xorgproto")
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/individual/lib/libXv-${pkgver}.tar.xz"{,.sig})
md5sums=('8a26503185afcb1bbd2c65e43f775a67'
         'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"

build() {
    cd "${srcdir}/libXv-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-malloc0returnsnull
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libXv-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
