# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=arduino-avr-core
pkgver=1.8.3
pkgrel=2
pkgdesc="Arduino AVR core with upstream avr-gcc and avrdude"
arch=('any')
url="https://github.com/arduino/ArduinoCore-avr"
license=('GPL')
depends=('avrdude' 'avr-gcc' 'avr-libc')
options=(!strip !emptydirs)
source=("https://downloads.arduino.cc/cores/avr-${pkgver}.tar.bz2"
        "https://downloads.arduino.cc/cores/avr-${pkgver}.tar.bz2.asc"
        "platform.patch")
sha512sums=('c8a63ad79f16c380def83b1215762f5cbddfc51480d658853370c3210724bb04627272f3affc0ad01af4463a68980665a4e1c37cc8fabcec16e97c4550d1bb03'
            'SKIP'
            '916d76a1313fa9372e141eb132eb3d5d4db32e27f695d3b6b0e2894111bfdacd54feec2ba6ea89b10918b9ef904f9b3d4c105c37d5a6851ac92c5c1758679f00')
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
