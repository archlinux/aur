# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Alexandre Bique <bique.alexandre@gmail.com>
# Contributor: Louis R. Marascio <lrm@fitnr.com>
# Contributor: Cody Maloney <cmaloney@theoreticalchaos.com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

_android_arch=aarch64

pkgname=android-${_android_arch}-gtest
pkgver=1.14.0
pkgrel=1
arch=('any')
pkgdesc="Google Test - C++ testing utility (Android ${_android_arch})"
url='https://github.com/google/googletest'
license=('BSD')
depends=('android-ndk')
makedepends=('android-cmake'
             'python')
optdepends=('python: gmock generator')
conflicts=("android-${_android_arch}-gmock")
replaces=("android-${_android_arch}-gmock")
provides=("android-${_android_arch}-gmock")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/google/googletest/archive/v${pkgver}.tar.gz"
        'gtest-version.patch')
md5sums=('c8340a482851ef6a3fe618a082304cfc'
         '4b2b6493b95389d3428470eb3f904df6')

prepare() {
    cd "${srcdir}/googletest-${pkgver}"

    patch -Np1 -i ../gtest-version.patch
    sed -i "s|__GOOGLETEST_VERSION__|${pkgver}|g" googlemock/CMakeLists.txt
    sed -i "s|__GOOGLETEST_VERSION__|${pkgver}|g" googletest/CMakeLists.txt
}

build() {
    cd "${srcdir}/googletest-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/googletest-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so

    cd googletest
    install -Dm 644 cmake/* -t "${pkgdir}/${ANDROID_PREFIX}/src/googletest/cmake"
    install -Dm 644 src/* -t "${pkgdir}/${ANDROID_PREFIX}/src/googletest/src"
    install -Dm 644 CMakeLists.txt -t "${pkgdir}/${ANDROID_PREFIX}/src/googletest"

    cd ../googlemock
    install -Dm 644 cmake/* -t "${pkgdir}/${ANDROID_PREFIX}/src/gmock/cmake"
    install -Dm 644 src/* -t "${pkgdir}/${ANDROID_PREFIX}/src/gmock/src"
    install -Dm 644 CMakeLists.txt -t "${pkgdir}/${ANDROID_PREFIX}/src/gmock"

    sed -i 's|src/||' "${pkgdir}/${ANDROID_PREFIX}/src/gmock/src/gmock-all.cc"

    python -m compileall -d "${ANDROID_PREFIX_SHARE}/gmock" "${pkgdir}/${ANDROID_PREFIX_SHARE}/gmock"
    python -O -m compileall -d "${ANDROID_PREFIX_SHARE}/gmock" "${pkgdir}/${ANDROID_PREFIX_SHARE}/gmock"
}
