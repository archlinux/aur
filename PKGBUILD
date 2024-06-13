# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: ant32 < antreimer at gmail dot com >
# Contributor: Alexey Pavlov < Alexpux at gmail dot com >
# Contributor: Ray Donnelly < mingw dot android at gmail dot com >

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-icu
pkgver=75.1
pkgrel=1
arch=('any')
pkgdesc="International Components for Unicode library (Android ${_android_arch})"
depends=('android-ndk')
makedepends=('android-environment'
             'autoconf-archive')
options=(!strip !buildflags staticlibs !emptydirs)
license=('custom')
url="https://icu.unicode.org/"
source=("https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz"{,.asc}
        "0001-Unversioned-libs.patch")
sha256sums=('cb968df3e4d2e87e8b11c49a5d01c787bd13b9545280fc6642f826527618caef'
            'SKIP'
            '8a49d3231bfb2aff95d1f82c21af8183423692b020a883de7a347c60446d3b36')
validpgpkeys=("FFA9129A180D765B7A5BEA1C9B432B27D1BA20D7"
              "3DA35301A7C330257B8755754058F67406EAA6AB"
              "0E51E7F06EF719FBD072782A5F56E5AFA63CCD33"
              "4569BBC09DA846FC91CBD21CE1BBA44593CF2AE0")

prepare() {
    cd "${srcdir}/icu"

    patch -p1 -i ../0001-Unversioned-libs.patch

    cd source
    autoreconf -fi
}

build() {
    cd "${srcdir}/icu/source"
    mkdir -p nativebuild && pushd nativebuild
    CC=gcc CXX=g++ ../configure \
        --enable-static \
        --disable-shared
    make $MAKEFLAGS
    popd

    source android-env ${_android_arch}

    unset CPPFLAGS

    target=${_android_arch/x86-/x86_}-linux-android

    ./configure \
        --host=${target} \
        --target=${target} \
        --build="${CHOST}" \
        --prefix="${ANDROID_PREFIX}" \
        --libdir="${ANDROID_PREFIX_LIB}" \
        --includedir="${ANDROID_PREFIX_INCLUDE}" \
        --enable-shared \
        --enable-static \
        --with-cross-build="${PWD}/nativebuild" \
        --with-data-packaging=library \
        --disable-rpath \
        --enable-release \
        --disable-extras \
        --disable-tools \
        --disable-tests \
        --disable-samples
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/icu/source"
    source android-env ${_android_arch}

    make install DESTDIR="${pkgdir}"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}/man"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so.*
}
