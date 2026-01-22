# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-openjph
pkgver=0.26.0
pkgrel=1
arch=('any')
pkgdesc="Open-source implementation of JPEG2000 Part-15 (Android ${_android_arch})"
url='https://github.com/aous72/OpenJPH/'
license=('BSD-2-Clause')
groups=('android-openjph')
depends=("android-ndk")
makedepends=('android-cmake'
             "android-${_android_arch}-libtiff")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/aous72/OpenJPH/archive/${pkgver}/openjph-${pkgver}.tar.gz")
md5sums=('469e12ba5e953ce7002d02f9486c8721')

prepare() {
    cd "${srcdir}/OpenJPH-${pkgver}"

    if [[ "${_android_arch}" == armv7a-eabi || "${_android_arch}" == x86 ]]; then
        sed -i 's|fseeko|fseek|g' src/core/openjph/ojph_file.h
        sed -i 's|ftello|ftell|g' src/core/openjph/ojph_file.h
    fi
}

build() {
    cd "${srcdir}/OpenJPH-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DDOJPH_BUILD_TESTS=OFF \
        -DOJPH_BUILD_EXECUTABLES=OFF
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DDOJPH_BUILD_TESTS=OFF \
        -DOJPH_BUILD_EXECUTABLES=OFF
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/OpenJPH-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
