# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-pcsclite
pkgver=2.0.3
pkgrel=1
arch=('any')
pkgdesc="PC/SC Architecture smartcard middleware library (Android ${_android_arch})"
url='https://pcsclite.apdu.fr/'
license=('BSD')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://pcsclite.apdu.fr/files/pcsc-lite-${pkgver}.tar.bz2"{,.asc})
md5sums=('4167d2d3fa2be3f8e24b2f44e38a35ee'
         'SKIP')
validpgpkeys=('F5E11B9FFE911146F41D953D78A1B4DFE8F9C57E') # Ludovic Rousseau <rousseau@debian.org>

build() {
    cd "${srcdir}/pcsc-lite-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sbindir="${ANDROID_PREFIX_BIN}" \
        --sysconfdir="${ANDROID_PREFIX_ETC}" \
        --enable-usbdropdir="${ANDROID_PREFIX_LIB}/pcsc/drivers" \
        --enable-filter \
        --disable-libsystemd \
        --disable-libudev \
        --disable-polkit
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/pcsc-lite-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -f "$pkgdir/${ANDROID_PREFIX_BIN}/pcscd"
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}

