# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

_android_arch=riscv64

pkgname=android-${_android_arch}-sord
pkgver=0.16.20
pkgrel=1
arch=('any')
pkgdesc="A lightweight C library for storing RDF data in memory (Android ${_android_arch})"
url="https://drobilla.net/software/sord.html"
license=('ISC')
groups=('android-sord')
depends=("android-${_android_arch}-pcre2"
         "android-${_android_arch}-serd"
         "android-${_android_arch}-zix")
makedepends=('android-meson'
             "android-${_android_arch}-pcre2"
             "android-${_android_arch}-serd"
             "android-${_android_arch}-zix")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://download.drobilla.net/sord-${pkgver}.tar.xz")
md5sums=('82e63c626e645ab6ce571bd4f462e13e')

build() {
    cd "${srcdir}/sord-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -D docs=disabled \
        -D tests=disabled \
        -D tools=disabled
    ninja -C build
}

package() {
    cd "${srcdir}/sord-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_RANLIB} "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
