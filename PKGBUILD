# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-libxrandr
pkgver=1.5.4
pkgrel=1
arch=('any')
pkgdesc="X11 RandR extension library (Android ${_android_arch})"
license=('custom')
url="https://xorg.freedesktop.org/"
depends=("android-${_android_arch}-libxext"
         "android-${_android_arch}-libxrender"
         "android-${_android_arch}-libx11")
makedepends=("android-${_android_arch}-xorg-util-macros"
             "android-${_android_arch}-xorgproto")
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/individual/lib/libXrandr-${pkgver}.tar.xz"{,.sig})
md5sums=('24e0b72abe16efce9bf10579beaffc27'
         'SKIP')
validpgpkeys+=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>

build() {
    cd "${srcdir}/libXrandr-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}" \
        --enable-malloc0returnsnull=no
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libXrandr-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
