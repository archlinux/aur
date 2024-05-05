# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libxft
pkgver=2.3.8
pkgrel=1
arch=('any')
pkgdesc="FreeType-based font drawing library for X (Android ${_android_arch})"
license=('custom')
url="https://xorg.freedesktop.org/"
depends=("android-${_android_arch}-fontconfig"
         "android-${_android_arch}-libxrender")
makedepends=('android-configure')
source=("${url}/releases/individual/lib/libXft-${pkgver}.tar.xz"{,.sig})
options=(!strip !buildflags staticlibs !emptydirs)
md5sums=('cea0a3304e47a841c90fbeeeb55329ee'
         'SKIP')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>

build() {
    cd "${srcdir}/libXft-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}"
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libXft-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
