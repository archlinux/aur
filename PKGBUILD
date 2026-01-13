# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Nicolas Avrutin <nicolasavru@gmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_android_arch=x86-64

pkgname=android-${_android_arch}-hidapi
pkgver=0.15.0
pkgrel=1
arch=('any')
pkgdesc="Simple library for communicating with USB and Bluetooth HID devices (Android ${_android_arch})"
url='https://github.com/libusb/hidapi'
license=('GPL3'
         'BSD'
         'custom')
groups=('android-hidapi')
depends=('android-ndk')
makedepends=('android-cmake'
             "android-${_android_arch}-libusb")
optdepends=("android-${_android_arch}-libusb: for hidapi-libusb")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/libusb/hidapi/archive/hidapi-${pkgver}.tar.gz"
        '0001-android-pthread-barrier.patch')
md5sums=('0a91bba20cc9b6717341a723132238f3'
         'f4bdaa804c01b031cd3499c49494c843')

prepare() {
    cd "${srcdir}/hidapi-hidapi-${pkgver}"

    patch -Np1 -i ../0001-android-pthread-barrier.patch
}

build() {
    cd "${srcdir}/hidapi-hidapi-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_TESTING=OFF \
        -Wno-dev
    cmake --build build-shared

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DCMAKE_POLICY_DEFAULT_CMP0057=NEW \
        -DBUILD_SHARED_LIBS=OFF \
        -DBUILD_TESTING=OFF \
        -Wno-dev
    cmake --build build-static
}

package() {
    cd "${srcdir}/hidapi-hidapi-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    install -vDm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
