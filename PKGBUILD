# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-graphite
pkgver=1.3.15
pkgrel=1
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
        "0001-Fix-pkgconfig.patch"
        "0002-Fix-staticbuild.patch")
md5sums=('93fe1a233fadf8eafb3f0dba8804b083'
         '1e9a2f9cd1d8bae64f3317ff67de0c5f'
         '7a55e2a39c02c0ad009394f4483c1384')

prepare() {
    cd "${srcdir}/graphite2-${pkgver}"

    patch -Np1 -i ../0001-Fix-pkgconfig.patch
    patch -Np1 -i ../0002-Fix-staticbuild.patch
}

build() {
    cd "${srcdir}/graphite2-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DGRAPHITE2_COMPARE_RENDERER=OFF \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -Wno-dev
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/graphite2-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
