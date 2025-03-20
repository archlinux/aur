# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-serd
pkgver=0.32.4
pkgrel=1
arch=('any')
pkgdesc="Lightweight C library for RDF syntax supporting reading/ writing Turtle and NTriples (Android ${_android_arch})"
url="https://drobilla.net/software/serd.html"
license=('0BSD OR ISC'
         'BSD-3-Clause'
         'ISC')
groups=('android-serd')
depends=('android-ndk')
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://download.drobilla.net/serd-${pkgver}.tar.xz"{,.sig})
md5sums=('553a9b50caa23a7c57732f83e6f80658'
         'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

build() {
    cd "${srcdir}/serd-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -D docs=disabled \
        -D html=disabled \
        -D lint=false \
        -D man=disabled \
        -D man_html=disabled \
        -D singlehtml=disabled \
        -D static=false \
        -D tests=disabled \
        -D tools=disabled
    ninja -C build
}

package() {
    cd "${srcdir}/serd-${pkgver}"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_RANLIB} "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
