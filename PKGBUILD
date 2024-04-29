# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>

_android_arch=x86-64

pkgname=android-${_android_arch}-serd
pkgver=0.32.2
pkgrel=1
arch=('any')
pkgdesc="Lightweight C library for RDF syntax supporting reading/ writing Turtle and NTriples (Android ${_android_arch})"
url="https://drobilla.net/software/serd.html"
license=('0BSD OR ISC'
         'BSD-3-Clause'
         'ISC')
depends=('android-ndk')
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://download.drobilla.net/serd-$pkgver.tar.xz"{,.sig})
md5sums=('3af4135454f7d07458584520dfd3f656'
         'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

build() {
    cd "${srcdir}/serd-${pkgver}"
    source android-env ${_android_arch}

    mkdir -p build
    cd build
    android-${_android_arch}-meson \
        --default-library both \
        -D docs=disabled \
        -D html=disabled \
        -D lint=false \
        -D man=disabled \
        -D man_html=disabled \
        -D singlehtml=disabled \
        -D static=false \
        -D tests=disabled \
        -D tools=disabled
    ninja
}

package() {
    cd "${srcdir}/serd-${pkgver}/build"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja install
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a || true
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_RANLIB} "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a || true
}
