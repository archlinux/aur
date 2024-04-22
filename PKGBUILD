# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Nicolas Avrutin <nicolasavru@gmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_android_arch=x86-64

pkgname=android-${_android_arch}-hidapi
pkgver=0.14.0
pkgrel=1
arch=('any')
pkgdesc="Simple library for communicating with USB and Bluetooth HID devices (Android ${_android_arch})"
url='https://github.com/libusb/hidapi'
license=('GPL3'
         'BSD'
         'custom')
depends=('android-ndk')
optdepends=("android-${_android_arch}-libusb: for hidapi-libusb")
makedepends=('android-cmake'
             "android-${_android_arch}-libusb")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/libusb/hidapi/archive/hidapi-${pkgver}.tar.gz")
md5sums=('d65a951df6f566f90bbeb4414caf2c1e')

build() {
    cd "${srcdir}/hidapi-hidapi-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/hidapi-hidapi-$pkgver"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
