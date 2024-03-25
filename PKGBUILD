# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Christian Hesse <eworm@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-libnghttp3
pkgver=1.2.0
pkgrel=2
arch=('any')
pkgdesc="HTTP/3 library written in C (Android ${_android_arch})"
url='https://github.com/ngtcp2/nghttp3'
license=('MIT')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/ngtcp2/nghttp3/releases/download/v${pkgver}/nghttp3-${pkgver}.tar.xz"{,.asc})
sha256sums=('d2e216bae7bd7362f850922e4237a5caa204853b3594b22adccab4c1e1c1d1aa'
            'SKIP')
validpgpkeys=('F4F3B91474D1EB29889BD0EF7E8403D5D673C366') # Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>

prepare() {
    cd "${srcdir}/nghttp3-$pkgver"
    source android-env ${_android_arch}

    autoreconf -i
}

build() {
    cd "${srcdir}/nghttp3-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-lib-only
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/nghttp3-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
