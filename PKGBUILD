# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: EVorster <evorster@gmail.com>

_android_arch=x86

pkgname=android-${_android_arch}-vid.stab
pkgver=1.1.1
pkgrel=3
arch=('any')
pkgdesc="Video stabilization library (Android ${_android_arch})"
url='http://public.hronopik.de/vid.stab'
license=('GPL')
groups=('android-vid.stab')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/georgmartius/vid.stab/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('3fb59a96f6e49e2719fd8c551eb3617a')

build() {
    cd "${srcdir}/vid.stab-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DBUILD_SHARED_LIBS=ON \
        -Wno-dev
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DBUILD_SHARED_LIBS=OFF \
        -Wno-dev
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/vid.stab-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
