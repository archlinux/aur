# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=arduino-avr-core
pkgver=1.8.2
pkgrel=1
pkgdesc="Arduino AVR core with upstream avr-gcc and avrdude"
arch=('any')
url="https://github.com/arduino/ArduinoCore-avr"
license=('GPL')
depends=('avrdude' 'avr-gcc' 'avr-libc')
options=(!strip !emptydirs)
source=("https://downloads.arduino.cc/cores/avr-${pkgver}.tar.bz2"
        "https://downloads.arduino.cc/cores/avr-${pkgver}.tar.bz2.asc"
        "platform.patch")
sha512sums=('e2d006f0b6540dba6623baac07d36078987fe8efdac39c6d160ab018a6c93a96369ece1ee92de0fae4a58fd4e93db108d2395de06c68d84ed2743739ed466aac'
            'SKIP'
            '34bdd71d8796682ddd1a57e4ef38b2dc4557656f32528af3caa96e6d6f803b6982b9edf044294c2af9478c5ca3dbb6567faa6d24aa97228173e38f7a139b3b68')
validpgpkeys=('326567C1C6B288DF32CB061A95FA6F43E21188C4') # Arduino Packages <support@arduino.cc>

prepare()
{
    # Prepare arduino avr core to be used with internal avr-gcc
    cd "${srcdir}/avr"

    # Update version in patchfile, then apply it
    sed -i "s/^ version=.*/ version=${pkgver}/" "${srcdir}/platform.patch"
    patch -Np1 -i "${srcdir}/platform.patch"

    # Remove elf files
    find . -name "*.elf" -type f -exec rm -f {} \;
    find . -name "*.a" -type f -exec rm -f {} \;
}

package() {
    # Copy archlinux arduino avr core
    install -dm755 "${pkgdir}/usr/share/arduino/hardware/archlinux-arduino"
    cp -a "${srcdir}/avr" "${pkgdir}/usr/share/arduino/hardware/archlinux-arduino"
}
