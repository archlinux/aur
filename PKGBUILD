# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: EVorster <evorster@gmail.com>

_android_arch=x86-64

pkgname=android-${_android_arch}-vid.stab
pkgver=1.1.1
pkgrel=1
arch=('any')
pkgdesc="Video stabilization library (Android ${_android_arch})"
url='http://public.hronopik.de/vid.stab'
license=('GPL')
depends=('android-ndk')
makedepends=('android-cmake'
             'ninja')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/georgmartius/vid.stab/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('3fb59a96f6e49e2719fd8c551eb3617a')

build() {
    cd "${srcdir}/vid.stab-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/vid.stab-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
