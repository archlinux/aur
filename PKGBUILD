
pkgname=arduino-samd-core-rc
pkgver=1.8.3
pkgrel=1
pkgdesc="Arduino samd core -- stable and release candidates"
arch=('any')
url="https://github.com/arduino/ArduinoCore-samd"
license=('GPL')
provides=('arduino-samd-core')
conflicts=('arduino-samd-core')
depends=('arduino-ctags') ## this needs to be fixed to include the analogs to: avrdude, avr-gcc and avr-libc
options=(!strip !emptydirs)
source=("https://github.com/arduino/ArduinoCore-samd/archive/${pkgver}.tar.gz"
        "platform.patch")
sha512sums=('f2ca5d2ed93393785d17033bd3a2acfee0dc4b00bb5d33282f6f306db7fbf836f3d136343e85a9a6a30482263fcab7d9c0e5233b323eba028bba9239bb3fa991'
            '7297a87af15ee68de23af6081391637caf871809b8c50d89065ea9311db41bde99b7ec1446669c68ffc9a3cef3d8401e7caeff040e3a1e84564ab0111d315a20')

prepare()
{
    # Prepare arduino avr core to be used with internal avr-gcc
    mv "ArduinoCore-samd-${pkgver}" ${pkgname//-rc}-${pkgver} 
    cd "${srcdir}/${pkgname//-rc}-${pkgver}"
    
    # Update version in patchfile, then apply it
    sed -i "s/^version=.*/ version=${pkgver}/" "${srcdir}/platform.patch"
    patch -Np1 -i "${srcdir}/platform.patch"

    echo "tools.ctags.path=/usr/bin" >> platform.txt
    echo "tools.ctags.cmd.path={path}/arduino-ctags" >> platform.txt

    # Remove elf files
    find . -name "*.elf" -type f -exec rm -f {} \;
    find . -name "*.a" -type f -exec rm -f {} \;
}

package() {
    # Copy archlinux arduino avr core
    install -dm755 "${pkgdir}/usr/share/arduino/hardware/archlinux-arduino"
    cp -a "${srcdir}/${pkgname//-rc}-${pkgver}" "${pkgdir}/usr/share/arduino/hardware/archlinux-arduino"
    
}
