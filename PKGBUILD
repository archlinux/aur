# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-libice
pkgver=1.1.1
pkgrel=2
arch=('any')
pkgdesc="X11 Inter-Client Exchange library (Android ${_android_arch})"
url="https://xorg.freedesktop.org/"
license=('custom')
depends=("android-${_android_arch}-xorgproto")
makedepends=("android-configure"
             "android-${_android_arch}-xtrans"
             "android-${_android_arch}-xorg-util-macros")
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/individual/lib/libICE-${pkgver}.tar.xz"{,.sig})
md5sums=('b444a0e4c2163d1bbc7b046c3653eb8d'
         'SKIP')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>

build() {
    cd "${srcdir}/libICE-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}"
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libICE-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
