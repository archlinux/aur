# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=arduino-avr-core
pkgver=1.8.6
pkgrel=1
pkgdesc="Arduino AVR core with upstream avr-gcc and avrdude"
arch=('any')
url="https://github.com/arduino/ArduinoCore-avr"
license=('GPL')
depends=('avrdude' 'avr-gcc' 'avr-libc')
options=(!strip !emptydirs !debug)
source=(https://github.com/arduino/ArduinoCore-avr/archive/$pkgver/$pkgname-$pkgver.tar.gz
        "platform.patch")
sha512sums=('910fbf8103571d377e0094393fd249e4c5d637b81b1996521e5812372d55bc1a3dc1b87f668510e705a88072ac0514294fb27d2d5499f64a84e2e5b0c3a78ac3'
            '916d76a1313fa9372e141eb132eb3d5d4db32e27f695d3b6b0e2894111bfdacd54feec2ba6ea89b10918b9ef904f9b3d4c105c37d5a6851ac92c5c1758679f00')
validpgpkeys=('326567C1C6B288DF32CB061A95FA6F43E21188C4') # Arduino Packages <support@arduino.cc>

prepare()
{
    # Prepare arduino avr core to be used with internal avr-gcc
    cd ArduinoCore-avr-$pkgver

    # Update version in patchfile, then apply it
    sed -i "s/^ version=.*/ version=${pkgver}/" "${srcdir}/platform.patch"
    patch -Np1 -i "${srcdir}/platform.patch"

    # Remove elf files
    find . -name "*.elf" -type f -exec rm -f {} \;
    find . -name "*.a" -type f -exec rm -f {} \;
}

package() {
    # Copy archlinux arduino avr core
    install -dm755 "${pkgdir}/usr/share/arduino/hardware/archlinux-arduino/avr"
    cp -ar ArduinoCore-avr-$pkgver/* "${pkgdir}/usr/share/arduino/hardware/archlinux-arduino/avr"
}
