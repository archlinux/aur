# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Michael Hansen <zrax0111 gmail com>

_android_arch=x86-64

pkgname=android-${_android_arch}-libwebm
pkgver=1.0.0.30
pkgrel=1
arch=('any')
pkgdesc="WebM video file parser (Android ${_android_arch})"
url="https://www.webmproject.org/"
license=('BSD')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/webmproject/libwebm/archive/libwebm-${pkgver}.tar.gz"
        'cmake_install.patch')
md5sums=('ca0884b845e5150cdec1d0cf8729ef3d'
         '0043032d67179a644969ef9909ad8d11')

prepare() {
    cd "${srcdir}/libwebm-libwebm-${pkgver}"

    patch -p1 -i ../cmake_install.patch
    sed -i 's/cmake_minimum_required(VERSION 3.2)/cmake_minimum_required(VERSION 3.6)/g' CMakeLists.txt
}

build() {
    cd "${srcdir}/libwebm-libwebm-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DENABLE_IWYU=ON \
        -DENABLE_WEBM_PARSER=ON \
        -DENABLE_SAMPLE_PROGRAMS=OFF \
        -DENABLE_TESTS=OFF \
        -DENABLE_WEBMINFO=OFF \
        -Wno-dev
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        -DBUILD_SHARED_LIBS=OFF \
        -DENABLE_IWYU=ON \
        -DENABLE_WEBM_PARSER=ON \
        -DENABLE_SAMPLE_PROGRAMS=OFF \
        -DENABLE_TESTS=OFF \
        -DENABLE_WEBMINFO=OFF \
        -Wno-dev
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/libwebm-libwebm-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
