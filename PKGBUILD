# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Maarten de Vries <maarten@de-vri.es>
# Contributor: Ken Tossell <ken@tossell.net>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libuvc
pkgver=0.0.7
pkgrel=2
arch=('any')
pkgdesc="a cross-platform library for USB video devices (Android ${_android_arch})"
url="https://int80k.com/libuvc/"
license=('BSD')
depends=("android-${_android_arch}-libusb"
         "android-${_android_arch}-libjpeg-turbo")
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/ktossell/libuvc/archive/v${pkgver}.tar.gz")
md5sums=('19f3255652d447cc9a34737bc5a4c9ab')

build() {
    cd "${srcdir}/libuvc-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DBUILD_EXAMPLE=OFF \
        -DBUILD_TEST=OFF \
        -DJPEG_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DJPEG_LIBRARY="${ANDROID_PREFIX_LIB}/libjpeg.so" \
        -DLibUSB_LIBRARY="${ANDROID_PREFIX_LIB}/libusb-1.0.so" \
        -Wno-dev
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/libuvc-${pkgver}"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
