# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86

pkgname=android-${_android_arch}-lz4
pkgver=1.10.0
pkgrel=1
arch=('any')
pkgdesc="Very fast lossless compression algorithm (Android ${_android_arch})"
url='http://lz4.github.io/lz4/'
license=('GPL2')
groups=('android-lz4')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/lz4/lz4/archive/v${pkgver}.tar.gz")
md5sums=('dead9f5f1966d9ae56e1e32761e4e675')

build() {
    cd "${srcdir}/lz4-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S build/cmake \
        -B build-shared \
        -DLIB_INSTALL_DIR=lib \
        -DBUILD_SHARED_LIBS=ON \
        -DLZ4_BUILD_CLI=OFF \
        -DLZ4_BUILD_LEGACY_LZ4C=OFF
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S build/cmake \
        -B build-static \
        -DLIB_INSTALL_DIR=lib \
        -DBUILD_SHARED_LIBS=OFF \
        -DLZ4_BUILD_CLI=OFF \
        -DLZ4_BUILD_LEGACY_LZ4C=OFF
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/lz4-${pkgver}"
    source android-env ${_android_arch}

    for _type in static shared; do
        make install -C build-${_type} DESTDIR="${pkgdir}"
    done

    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
