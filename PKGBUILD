
pkgname=arduino-avr-core-rc
pkgver=1.8.2
pkgrel=1
pkgdesc="Arduino AVR core with upstream avr-gcc and avrdude -- stable and release candidates"
arch=('any')
url="https://github.com/arduino/ArduinoCore-avr"
license=('GPL')
provides=('arduino-avr-core')
conflicts=('arduino-avr-core')
depends=('avrdude' 'avr-gcc' 'avr-libc' 'arduino-ctags')
options=(!strip !emptydirs)
source=("https://github.com/arduino/ArduinoCore-avr/archive/${pkgver}.tar.gz"
        "platform.patch")
sha512sums=('8b2b7780d222b584b12376c2db92539d3b194057a8b7d7de1c0a0e350f82ef5898b7c4db32032ab73391746e3e644e96909dd08887a5085426cb8c28da590c5f'
            '34bdd71d8796682ddd1a57e4ef38b2dc4557656f32528af3caa96e6d6f803b6982b9edf044294c2af9478c5ca3dbb6567faa6d24aa97228173e38f7a139b3b68')

prepare()
{
    # Prepare arduino avr core to be used with internal avr-gcc
    mv "ArduinoCore-avr-${pkgver}" ${pkgname//-rc}-${pkgver} 
    cd "${srcdir}/${pkgname//-rc}-${pkgver}"
    

    # Update version in patchfile, then apply it
    #sed -i "s/^version=.*/ version=${pkgver}/" "${srcdir}/platform.patch"
    #patch -Np1 -i "${srcdir}/platform.patch"

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
