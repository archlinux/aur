# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_android_arch=aarch64

pkgname=android-${_android_arch}-graphite
pkgver=1.3.14
pkgrel=1
pkgdesc="Reimplementation of the SIL Graphite text processing engine (android)"
arch=('any')
url="https://github.com/silnrsi/graphite"
license=('LGPL' 'GPL' 'custom')
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-cmake'
             'python')
source=("https://github.com/silnrsi/graphite/releases/download/${pkgver}/graphite2-${pkgver}.tgz"
        "002-graphite2-1.2.1-pkgconfig.patch"
        "003-graphite2-1.3.8-staticbuild.patch")
sha256sums=('f99d1c13aa5fa296898a181dff9b82fb25f6cc0933dbaa7a475d8109bd54209d'
            '22bef0d90c0266b3b0eff01859c1e002f84c165d12242c2bfc153f8f98fb272a'
            'c139e0bed6e45f333fbdc136a5013395fe22ca5381eac2294958bc85ea1b69fd')

prepare() {
    cd "${srcdir}"/graphite2-${pkgver}
    patch -Np1 -i "../002-graphite2-1.2.1-pkgconfig.patch"
    patch -Np1 -i "../003-graphite2-1.3.8-staticbuild.patch"
}

build() {
    cd "${srcdir}"/graphite2-${pkgver}

    android-${_android_arch}-cmake \
        -DGRAPHITE2_COMPARE_RENDERER=OFF \
        .
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}"/graphite2-${pkgver}
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
