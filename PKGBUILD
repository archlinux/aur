# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_android_arch=riscv64

pkgname=android-${_android_arch}-graphite
pkgver=1.3.14
pkgrel=2
arch=('any')
pkgdesc="Reimplementation of the SIL Graphite text processing engine (Android ${_android_arch})"
url="https://github.com/silnrsi/graphite"
license=('LGPL'
         'GPL'
         'custom')
groups=('android-graphite')
depends=('android-ndk')
makedepends=('android-cmake'
             'python')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/silnrsi/graphite/releases/download/${pkgver}/graphite2-${pkgver}.tgz"
        "002-graphite2-1.2.1-pkgconfig.patch"
        "003-graphite2-1.3.8-staticbuild.patch")
md5sums=('1bccb985a7da01092bfb53bb5041e836'
         '3462eb980cbe7036c1f966e1768e70cf'
         '7a55e2a39c02c0ad009394f4483c1384')

prepare() {
    cd "${srcdir}/graphite2-${pkgver}"

    patch -Np1 -i ../002-graphite2-1.2.1-pkgconfig.patch
    patch -Np1 -i ../003-graphite2-1.3.8-staticbuild.patch
}

build() {
    cd "${srcdir}/graphite2-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DGRAPHITE2_COMPARE_RENDERER=OFF \
        -Wno-dev
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/graphite2-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}"/${ANDROID_PREFIX_BIN}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
