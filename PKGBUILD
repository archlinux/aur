# Maintainer: john <aur {at} jbrengineering {dot} co {dot} uk>

pkgname=arduino-samd-core
pkgver=1.8.6
pkgrel=4
pkgdesc="Arduino support for SAMD21 series ARM 32 bit microcontrollers (used on Arduino M0 Pro, MKR1000, Arduino Zero etc.)"
arch=('any')
url="https://github.com/arduino/ArduinoCore-samd"
license=('GPL')
depends=('arm-none-eabi-gcc' 
         'openocd')
optdepends=('arduino: Arduino IDE: IDE'
            'avrdude: M0 uploading support'
            'bossa: Zero uploading support')
options=(!strip)
source=("https://downloads.arduino.cc/cores/samd-${pkgver}.tar.bz2"
        "https://downloads.arduino.cc/CMSIS-4.5.0.tar.bz2"
        "https://downloads.arduino.cc/CMSIS-Atmel-1.2.0.tar.bz2"
        "platform.patch")
sha512sums=('04275054f628b20ca6851331bbb0c0753f8d7636dba6bb4b396a6c8bf41cf7195128f827947244e0a1b22f48983cb5aac014671a451f7bdc6c69dca6f2d4943e'
            '97af9c847c0fec6abfe4769910351f1d85aa19d09b4eea88a3852b3d3f196c7f02b16e0fc9686bcff3d94f8cfae512ab7e550f8fa1abb8db87da7e95c56f5502'
            '2b80184e0487cde3a662f0e04e05ad8d0bf2fb5c64423464017890b1ddc2255acbd9d76be30f195fa4cf460c157ee55c32c354f58337560ba189f448b3e113bc'
            '141ab6773a42b77408fcc9b358523b99a3ce8e4e91736f1cf6dbeb842df02b83fe1d0f764eea10f97f9ea550eb165ad5940c4e1d7437dc872bae15dd8d06a73d')

prepare()
{
    # Prepare arduino samd core to be used with internal toolchains
    cd "${srcdir}/samd"
    patch -Np1 -i "${srcdir}/platform.patch"
}

package() {
    # Copy to archlinux arduino folder, within the packages sub directory structured as Arduino IDE
    install -dm755 "${pkgdir}/usr/share/arduino/packages/arduino/hardware"
    install -dm755 "${pkgdir}/usr/share/arduino/hardware/archlinux-arduino"
    install -dm755 "${pkgdir}/usr/share/arduino/packages/arduino/tools/CMSIS/4.5.0"
    install -dm755 "${pkgdir}/usr/share/arduino/packages/arduino/tools/CMSIS-Atmel/1.2.0"
    # install to standard package directory for Arduino-mk to find
    cp -a "${srcdir}/samd" "${pkgdir}/usr/share/arduino/packages/arduino/hardware"
    # symbolic link maintain compatability with Arch Arduino install
    ln -s "${pkgdir}/usr/share/arduino/packages/arduino/hardware/samd" "${pkgdir}/usr/share/arduino/hardware/archlinux-arduino"
    cp -a "${srcdir}/CMSIS/"* "${pkgdir}/usr/share/arduino/packages/arduino/tools/CMSIS/4.5.0/"
    cp -a "${srcdir}/CMSIS-Atmel/"* "${pkgdir}/usr/share/arduino/packages/arduino/tools/CMSIS-Atmel/1.2.0/"
}
