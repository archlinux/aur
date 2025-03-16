# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: JSpaces <jspace@unseen.is>
# Contributor: Triode <triode1@btinternet.com>

_android_arch=x86

pkgname=android-${_android_arch}-libsoxr
pkgver=0.1.3
pkgrel=3
arch=('any')
pkgdesc="The SoX Resampler library that aims to give fast and high quality results for any constant resampling ratio (Android ${_android_arch})"
url='https://sourceforge.net/p/soxr/wiki/Home/'
license=('GPL')
groups=('android-libsoxr')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.sourceforge.net/project/soxr/soxr-${pkgver}-Source.tar.xz")
md5sums=('3f16f4dcb35b471682d4321eda6f6c08')

build() {
    cd "${srcdir}/soxr-${pkgver}-Source"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_TESTS=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -DWITH_AVFFT=OFF \
        -DWITH_LSR_BINDINGS=ON \
        -DWITH_OPENMP=OFF \
        -DWITH_PFFFT=ON \
        -Wno-dev
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_TESTS=OFF \
        -DBUILD_SHARED_LIBS=OFF \
        -DWITH_AVFFT=OFF \
        -DWITH_LSR_BINDINGS=ON \
        -DWITH_OPENMP=OFF \
        -DWITH_PFFFT=ON \
        -Wno-dev
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/soxr-${pkgver}-Source"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    cp -vf build-static/src/lib*.a "${pkgdir}/${ANDROID_PREFIX_LIB}/"

    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
