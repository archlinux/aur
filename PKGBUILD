# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-libxi
pkgver=1.8.2
pkgrel=1
arch=('any')
pkgdesc="X11 Input extension library (Android ${_android_arch})"
url="https://xorg.freedesktop.org"
depends=("android-${_android_arch}-libxext"
         "android-${_android_arch}-libxfixes")
makedepends=("android-${_android_arch}-xorg-util-macros"
             "android-${_android_arch}-xorgproto")
license=('custom')
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/individual/lib/libXi-${pkgver}.tar.xz"{,.sig})
md5sums=('95a960c1692a83cc551979f7ffe28cf4'
         'SKIP')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer

build() {
    cd "${srcdir}/libXi-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}" \
        --disable-malloc0returnsnull
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libXi-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
