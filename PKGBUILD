# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-libxt
pkgver=1.3.1
pkgrel=1
arch=('any')
pkgdesc="X11 toolkit intrinsics library (Android ${_android_arch})"
url="https://xorg.freedesktop.org/"
license=('custom')
depends=("android-${_android_arch}-libsm"
         "android-${_android_arch}-libx11")
makedepends=('android-configure'
             "android-${_android_arch}-xorg-util-macros")
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/releases/individual/lib/libXt-${pkgver}.tar.xz"{,.sig})
md5sums=('9acd189c68750b5028cf120e53c68009'
         'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') #Alan Coopersmith <alan.coopersmith@oracle.com>
validpgpkeys+=('C52048C0C0748FEE227D47A2702353E0F7E48EDB') # "Thomas Dickey <dickey@invisible-island.net>"
validpgpkeys+=('3BB639E56F861FA2E86505690FDD682D974CA72A') #"Matt Turner <mattst88@gmail.com>"

build() {
    cd "${srcdir}/libXt-${pkgver}"
    source android-env ${_android_arch}

    export CFLAGS="${CFLAGS} -DXTHREADS -DXUSE_MTSAFE_API"

    android-${_android_arch}-configure \
        --sysconfdir="${ANDROID_PREFIX_ETC}" \
        --enable-unit-tests=no \
        --enable-malloc0returnsnull=no
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/libXt-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
