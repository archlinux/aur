# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=arduino-avr-core
pkgver=1.6.17
pkgrel=1
pkgdesc="Arduino AVR core with upstream avr-gcc and avrdude"
arch=('any')
url="https://github.com/arduino/Arduino"
license=('GPL')
depends=('avrdude' 'avr-gcc' 'avr-libc')
options=(!strip !emptydirs)
source=("https://downloads.arduino.cc/cores/avr-${pkgver}.tar.bz2"
        "platform.patch")
sha512sums=('0dbf8f348270485259f86a00a9d7f429eb999d0064b4f99e95e2d64c1c0eae55a198f631e28bc3cf227db01e3dd6ea894c08e88fff2f0cb946684dde1f15d0f1'
            '306c121028a6e82f1b4e8a801776af14519741b1a657c23f755ad1e1b4c3b50db1e64b512c7e476f74f9331a2fbc31035134609e6af28b1beb4a75db5154b611')

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
