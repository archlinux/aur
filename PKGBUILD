# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

_android_arch=x86-64

pkgname=android-${_android_arch}-sord
pkgver=0.16.16
pkgrel=1
arch=('any')
pkgdesc="A lightweight C library for storing RDF data in memory (Android ${_android_arch})"
url="https://drobilla.net/software/sord.html"
license=('ISC')
depends=("android-${_android_arch}-pcre2"
         "android-${_android_arch}-serd"
         "android-${_android_arch}-zix")
makedepends=('android-meson'
             "android-${_android_arch}-pcre2"
             "android-${_android_arch}-serd"
             "android-${_android_arch}-zix")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://download.drobilla.net/sord-$pkgver.tar.xz")
md5sums=('003384f397d832180b0cc1bdf339368d')

build() {
    cd "${srcdir}/sord-${pkgver}"
    source android-env ${_android_arch}

    mkdir -p build
    cd build
    android-${_android_arch}-meson \
        --default-library both \
        -D docs=disabled \
        -D tests=disabled \
        -D tools=disabled
    ninja
}

package() {
    cd "${srcdir}/sord-${pkgver}/build"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja install
    ${ANDROID_STRIP} -g "$pkgdir/${ANDROID_PREFIX_LIB}"/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_RANLIB} "$pkgdir/${ANDROID_PREFIX_LIB}"/*.a || true
}
