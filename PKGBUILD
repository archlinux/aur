# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=arduino-avr-core
pkgver=1.6.20
pkgrel=1
pkgdesc="Arduino AVR core with upstream avr-gcc and avrdude"
arch=('any')
url="https://github.com/arduino/Arduino"
license=('GPL')
depends=('avrdude' 'avr-gcc' 'avr-libc')
options=(!strip !emptydirs)
source=("https://downloads.arduino.cc/cores/avr-${pkgver}.tar.bz2"
        "https://downloads.arduino.cc/cores/avr-${pkgver}.tar.bz2.asc"
        "platform.patch")
sha512sums=('a70b5cff026afcfe61e7e659eee469488da8e68eea1854546a84b6dda811c8f1af793c76ba3f9fc6ed9232837dd68f948455d8752ec66b3e9b16269fc9071a42'
            'SKIP'
            '306c121028a6e82f1b4e8a801776af14519741b1a657c23f755ad1e1b4c3b50db1e64b512c7e476f74f9331a2fbc31035134609e6af28b1beb4a75db5154b611')
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
