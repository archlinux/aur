# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

_android_arch=aarch64

pkgname=android-${_android_arch}-pcsclite
pkgver=2.3.3
pkgrel=1
arch=('any')
pkgdesc="PC/SC Architecture smartcard middleware library (Android ${_android_arch})"
url='https://pcsclite.apdu.fr/'
license=('BSD')
groups=('android-pcsclite')
depends=('android-ndk')
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://pcsclite.apdu.fr/files/pcsc-lite-${pkgver}.tar.xz"{,.asc}
        '0002-Disable-issetugid.patch'
        '0003-Fix-missing-pthread_cancel.patch')
md5sums=('b364c6495b1658218785be2e00f5052d'
         'SKIP'
         '17cc08c1b9ed2c5912be2fd2b368c669'
         '3050ecacb997c4c6f901ddd18d4c87fc')
validpgpkeys=('F5E11B9FFE911146F41D953D78A1B4DFE8F9C57E') # Ludovic Rousseau <rousseau@debian.org>

prepare() {
    cd "${srcdir}/pcsc-lite-${pkgver}"

    patch -Np1 -i ../0002-Disable-issetugid.patch
    patch -Np1 -i ../0003-Fix-missing-pthread_cancel.patch
}

build() {
    cd "${srcdir}/pcsc-lite-${pkgver}"
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
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}

