
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
source=("${pkgname//-rc}-${pkgver}.tar.gz::https://github.com/arduino/ArduinoCore-avr/archive/1.8.1.tar.gz"
        "platform.patch")
sha512sums=('47743c97eda889294a0abe0839989800e8ba64be4278a14acf9fc76afc142f0c46ef8c13350dae552ad4ad042576ede209ef3f413f8e6c50c8565ec8b4152e27'
            '34bdd71d8796682ddd1a57e4ef38b2dc4557656f32528af3caa96e6d6f803b6982b9edf044294c2af9478c5ca3dbb6567faa6d24aa97228173e38f7a139b3b68')

prepare()
{
    # Prepare arduino avr core to be used with internal avr-gcc
    mv "ArduinoCore-avr-${pkgver}" ${pkgname//-rc}-${pkgver} 
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
