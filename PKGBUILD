# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libxmu
pkgver=1.2.1
pkgrel=2
arch=('any')
pkgdesc="X11 miscellaneous micro-utility library (Android ${_android_arch})"
url="https://gitlab.freedesktop.org/xorg/lib/libxmu"
license=('MIT-open-group AND SMLNJ AND X11 AND ISC')
groups=('android-libxmu')
depends=("android-${_android_arch}-libxext"
         "android-${_android_arch}-libxt"
         "android-${_android_arch}-libx11"
         "android-${_android_arch}-xorgproto")
makedepends=('android-configure'
             "android-${_android_arch}-xorg-util-macros")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://xorg.freedesktop.org//archive/individual/lib/libXmu-${pkgver}.tar.xz"{,.sig})
md5sums=('85edefb7deaad4590a03fccba517669f'
         'SKIP')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # "Matt Turner <mattst88@gmail.com>"

build() {
    cd "${srcdir}/libXmu-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}"
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libXmu-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
