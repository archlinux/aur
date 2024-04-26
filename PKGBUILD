# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-libsamplerate
pkgver=0.2.2
pkgrel=1
arch=('any')
pkgdesc="An audio sample rate conversion library (Android ${_android_arch})"
url="https://libsndfile.github.io/libsamplerate/"
license=('BSD')
depends=('android-ndk')
makedepends=('android-cmake'
             "android-${_android_arch}-alsa-lib"
             "android-${_android_arch}-libsndfile"
             "android-${_android_arch}-opus")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/libsndfile/libsamplerate/releases/download/$pkgver/libsamplerate-$pkgver.tar.xz"{,.sig})
md5sums=('97c010fc25156c33cddc272c1935afab'
         'SKIP')
validpgpkeys=('31D95CAB6D80D262244A1750A47620E801E47E95')  # David Seifert soap@gentoo.org

build() {
    cd "${srcdir}/libsamplerate-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DBUILD_TESTING=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -DLIBSAMPLERATE_EXAMPLES=OFF \
        -DALSA_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DALSA_LIBRARY="${ANDROID_PREFIX_LIB}/libasound.so" \
        -Wno-dev
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/libsamplerate-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
