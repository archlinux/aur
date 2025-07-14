# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: ant32 < antreimer at gmail dot com >
# Contributor: Alexey Pavlov < Alexpux at gmail dot com >
# Contributor: Ray Donnelly < mingw dot android at gmail dot com >

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-icu
pkgver=77.1
pkgrel=3
arch=('any')
pkgdesc="International Components for Unicode library (Android ${_android_arch})"
groups=('android-icu')
depends=('android-ndk')
makedepends=('android-environment'
             'autoconf-archive'
             'patchelf')
options=(!strip !buildflags staticlibs !emptydirs)
license=('custom')
url="https://icu.unicode.org/"
source=("https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz")
md5sums=('bc0132b4c43db8455d2446c3bae58898')

prepare() {
    cd "${srcdir}/icu/source"

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
        --enable-release \
        --disable-rpath \
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

    # Fix the libraries soname

    for f in $(ls "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so); do
        patchelf --set-soname $(basename "$f") "$f"
    done
}
