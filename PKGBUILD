# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

_android_arch=aarch64

pkgname=android-${_android_arch}-pcsclite
pkgver=2.2.0
pkgrel=1
arch=('any')
pkgdesc="PC/SC Architecture smartcard middleware library (Android ${_android_arch})"
url='https://pcsclite.apdu.fr/'
license=('BSD')
depends=('android-ndk')
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://pcsclite.apdu.fr/files/pcsc-lite-${pkgver}.tar.xz"{,.asc}
        '0001-Fix-pcsc-arch.patch')
md5sums=('9e4006e1f3210ffa7dd0fadbc9083dc2'
         'SKIP'
         '0d862bb58084ec6e7da1ccc764de4ac4')
validpgpkeys=('F5E11B9FFE911146F41D953D78A1B4DFE8F9C57E') # Ludovic Rousseau <rousseau@debian.org>

prepare() {
    cd "${srcdir}/pcsc-lite-$pkgver"

    patch -Np1 -i ../0001-Fix-pcsc-arch.patch
}

build() {
    cd "${srcdir}/pcsc-lite-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -Dlibsystemd=false \
        -Dlibudev=false \
        -Dlibusb=false \
        -Dpolkit=false \
        -Dusb=false \
        -Dserial=false \
        -Dserialconfdir="${ANDROID_PREFIX_ETC}/reader.conf.d" \
        -Dusbdropdir="${ANDROID_PREFIX_LIB}/pcsc/drivers"
    ninja -C build
}

package() {
    cd "${srcdir}/pcsc-lite-$pkgver"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" meson install -C build
    rm -rf "$pkgdir/bin"
    rm -f "$pkgdir/${ANDROID_PREFIX_BIN}/pcscd"
    rm -rf "$pkgdir/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
}

