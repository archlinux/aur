# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Christian Hesse <eworm@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-libnghttp3
pkgver=1.10.1
pkgrel=1
arch=('any')
pkgdesc="HTTP/3 library written in C (Android ${_android_arch})"
url='https://github.com/ngtcp2/nghttp3'
license=('MIT')
groups=('android-libnghttp3')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/ngtcp2/nghttp3/releases/download/v${pkgver}/nghttp3-${pkgver}.tar.xz")
md5sums=('1bd789bf8da16789cc4801eae95e4a35')

prepare() {
    cd "${srcdir}/nghttp3-${pkgver}"
    source android-env ${_android_arch}

    autoreconf -fiv
}

build() {
    cd "${srcdir}/nghttp3-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-lib-only
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/nghttp3-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
