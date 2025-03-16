# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-ladspa
pkgver=1.17
pkgrel=2
arch=('any')
license=('LGPL-2.1')
pkgdesc="Linux Audio Developer's Simple Plugin API (LADSPA) (Android ${_android_arch})"
url="https://www.ladspa.org/"
groups=('android-ladspa')
depends=('android-ndk')
makedepends=('android-environment'
             "android-${_android_arch}-libsndfile")
optdepends=("android-${_android_arch}-libsndfile: for applyplugin")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://ladspa.org/download/ladspa_sdk_${pkgver}.tgz"
        '0001-Fix-Makefile.patch'
        '0002-fix-memleak-in-plugin-scanning.patch')
md5sums=('f4a2fb40405d1fc746d10fe0d3536db1'
         '1c5c972b111d8b0212d91bd970228b2b'
         'c78da6b7004bac103a709ef74ede5330')

prepare() {
    cd "${srcdir}/ladspa_sdk_${pkgver}"

    patch -Np1 -i ../0001-Fix-Makefile.patch
    patch -Np1 -i ../0002-fix-memleak-in-plugin-scanning.patch

    sed -i 's|#include "utils.h"|#include "../utils.h"|g' src/plugins/*.c
    sed -i 's|#include "utils.h"|#include "../utils.h"|g' src/plugins/*.cpp
}

build() {
    cd "${srcdir}/ladspa_sdk_${pkgver}"
    source android-env ${_android_arch}

    make \
        -C src \
        CC="${CC}" \
        CPP="${CXX}" \
        CFLAGS="${CFLAGS} -I. -Wall -Werror -fPIC" \
        CXXFLAGS="${CXXFLAGS} -I. -Wall -Werror -fPIC" \
        $MAKEFLAGS \
        targets
}

package() {
    cd "${srcdir}/ladspa_sdk_${pkgver}"
    source android-env ${_android_arch}

    make \
        -C src \
        INSTALL_PLUGINS_DIR="${pkgdir}/${ANDROID_PREFIX_LIB}/ladspa" \
        INSTALL_INCLUDE_DIR="${pkgdir}/${ANDROID_PREFIX_INCLUDE}" \
        install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}/ladspa"/*.so
}
