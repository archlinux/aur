# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: drakkan <nicola.murino at gmail dot com>

_android_arch=x86

pkgname=android-${_android_arch}-libnghttp2
pkgver=1.66.0
pkgrel=1
arch=('any')
pkgdesc="Framing layer of HTTP/2 is implemented as a reusable C library (Android ${_android_arch})"
url='https://nghttp2.org/'
license=('MIT')
groups=('android-libnghttp2')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/nghttp2/nghttp2/releases/download/v${pkgver}/nghttp2-${pkgver}.tar.xz")
md5sums=('295c22437cc44e1634a2b82ea93df747')

build() {
    cd "${srcdir}/nghttp2-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --disable-examples \
        --enable-lib-only
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/nghttp2-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/doc"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/man"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
