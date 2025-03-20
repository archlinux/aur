# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-libsamplerate
pkgver=0.2.2
pkgrel=3
arch=('any')
pkgdesc="An audio sample rate conversion library (Android ${_android_arch})"
url="https://libsndfile.github.io/libsamplerate/"
license=('BSD')
groups=('android-libsamplerate')
depends=('android-ndk')
makedepends=('android-cmake'
             "android-${_android_arch}-alsa-lib"
             "android-${_android_arch}-libsndfile"
             "android-${_android_arch}-opus")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/libsndfile/libsamplerate/releases/download/${pkgver}/libsamplerate-${pkgver}.tar.xz"{,.sig})
md5sums=('97c010fc25156c33cddc272c1935afab'
         'SKIP')
validpgpkeys=('31D95CAB6D80D262244A1750A47620E801E47E95')  # David Seifert soap@gentoo.org

build() {
    cd "${srcdir}/libsamplerate-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_TESTING=OFF \
        -DLIBSAMPLERATE_EXAMPLES=OFF \
        -DALSA_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DALSA_LIBRARY="${ANDROID_PREFIX_LIB}/libasound.so" \
        -Wno-dev
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DBUILD_SHARED_LIBS=OFF \
        -DBUILD_TESTING=OFF \
        -DLIBSAMPLERATE_EXAMPLES=OFF \
        -DALSA_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DALSA_LIBRARY="${ANDROID_PREFIX_LIB}/libasound.a" \
        -Wno-dev
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/libsamplerate-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
