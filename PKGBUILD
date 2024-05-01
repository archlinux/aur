# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libxfixes
pkgver=6.0.1
pkgrel=2
arch=('any')
pkgdesc="X11 miscellaneous 'fixes' extension library (Android ${_android_arch})"
url="https://xorg.freedesktop.org/"
license=('custom')
depends=("android-${_android_arch}-libx11")
makedepends=('android-configure'
             "android-${_android_arch}-xorg-util-macros"
             "android-${_android_arch}-xorgproto")
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/individual/lib/libXfixes-${pkgver}.tar.xz"{,.sig})
md5sums=('65b9ba1e9ff3d16c4fa72915d4bb585a'
         'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"

build() {
    cd "${srcdir}/libXfixes-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}"
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libXfixes-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
