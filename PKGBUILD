
pkgname=arduino-rc
pkgver=1.8.10
pkgrel=1
epoch=1
pkgdesc="Arduino prototyping platform SDK -- stable and release candidates"
arch=('x86_64')
url="https://github.com/arduino/Arduino"
license=('GPL' 'LGPL')
conflicts=('arduino')
provides=('arduino')
depends=('gtk2' 'desktop-file-utils' 'shared-mime-info' 'java-runtime>=8' 'arduino-builder' 'arduino-cli-rc')
makedepends=('java-environment>=8' 'ant' 'unzip')
optdepends=('arduino-docs: Offline documentation for arduino'
            'arduino-avr-core: AVR core with upstream avr-gcc and avrdude'
            'python2: Intel Galileo Board installation')
options=(!strip)
install="arduino.install"
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/arduino/Arduino/releases/download/${pkgver}/arduino-${pkgver}.tar.xz"
        "${pkgname}-${pkgver}.tar.xz.asc::https://github.com/arduino/Arduino/releases/download/${pkgver}/arduino-${pkgver}.tar.xz.asc"
        "https://github.com/arduino-libraries/WiFi101-FirmwareUpdater-Plugin/releases/download/v0.10.9/WiFi101-Updater-ArduinoIDE-Plugin-0.10.9.zip"
        "https://downloads.arduino.cc/libastylej-2.05.1-4.zip"
        "https://downloads.arduino.cc/libastylej-2.05.1-4.zip.asc"
        "https://downloads.arduino.cc/liblistSerials/liblistSerials-1.4.2.zip"
        "https://downloads.arduino.cc/liblistSerials/liblistSerials-1.4.2.zip.asc"
        "arduino.sh")
sha512sums=('7ab27c4a0b7dc5b6e264360fcb90bac9c5a67a2297c241ecd672fe75aff8145ed2372741d6dfc571cf1074ee6105c2fe5f7dff64ed0db5df987c1f06ab34aeb8'
            'SKIP'
            '7227ca0b9017afab3e93d5f7d074b8c2fa2e2a93d8e6a310c8f1497330e4ea5c4f5927be59e7129634503733b2527aa1ce2791266cd7f21b8ce039ce2fe40f33'
            '92ecaf24c64aaefafffe7bcdb6ae327f61dc6b9952546cb8cfad51aa1d01be7e1f5c33138f1bd2cd7cd466820ea991e0e5ad3cca62de7a543971aacbe33b06ac'
            'SKIP'
            '80f27ef196a205dc512f0aebb426765f2536a00059a633929bbdcfea81d7fb9fec31b27322c534a3e5953240a2906e89914562b0be0649053206a1941f659b58'
            'SKIP'
            'd10fae26d9f7c162c8c46e15c2d8d98a222a05c69463e2646e8e12f5b32e8c2673d4684ea01adc81d5da9c7f4edab2e4f83b77214b6fe24b232a1590f62ced2f')
validpgpkeys=('326567C1C6B288DF32CB061A95FA6F43E21188C4') # Arduino Packages <support@arduino.cc>

#prepare()
#{
#    #patch --strip=1 < avr-core.patch
#}

build() {
    cd "Arduino-master-${pkgver}/build"

    # Compile with java8
    export PATH=/usr/lib/jvm/default/bin/:"$PATH"

    # Do not include their avr-core + tools and no docs. We build them seperately
    ant clean dist -Dversion="${pkgver}" build -Dlight_bundle=true \
                                             -Dno_docs=true \
                                             -Dlocal_sources=true \
                                             -Dno_arduino_builder=true
}

package() {
    cd "Arduino-master-${pkgver}/build/linux/work"

    # Create directories
    install -dm755 "${pkgdir}/usr/share/"{doc,icons/hicolor,applications,mime/packages}

    # Copy the whole SDK
    cp -a . "${pkgdir}/usr/share/arduino"

    # Create wrapper for java8 + buider and documentation symlink
    install -Dm755 "${srcdir}/arduino.sh" "${pkgdir}/usr/bin/arduino"

    # Link arduino-builder, libastylej, libserialport and docs
    # TODO astyle libserialport do not work yet
    # TODO remove unzip dependency once all deps are resolved
    # https://github.com/arduino/ctags/issues/12
    # https://github.com/arduino/Arduino/issues/5538
    # https://github.com/arduino/listSerialPortsC/issues/9

    

    # Arduino-builder
    # https://bugs.archlinux.org/task/52377
    # https://github.com/arduino/arduino-builder/issues/209
    ln -s /usr/bin/arduino-builder "${pkgdir}/usr/share/arduino/arduino-builder"
    install -dm755 "${pkgdir}/usr/share/arduino/tools-builder"

    #rm "${pkgdir}/usr/share/arduino/lib/libastylej.so"
    #ln -s /usr/lib/libastyle-2.05.1.so "${pkgdir}/usr/share/arduino/lib/libastylej.so"
    #rm "${pkgdir}/usr/share/arduino/lib/liblistSerialsj.so"
    #ln -s /usr/lib/libserialport.so "${pkgdir}/usr/share/arduino/lib/liblistSerialsj.so"
    rm -r "${pkgdir}/usr/share/arduino/reference"
    ln -s /usr/share/doc/arduino "${pkgdir}/usr/share/arduino/reference"

    # Install desktop icons (keep a symlink for the arduino binary)
    cp -a lib/icons/* "${pkgdir}/usr/share/icons/hicolor"
    rm -rf "${pkgdir}/usr/share/arduino/lib/icons"
    ln -s /usr/share/icons/hicolor "${pkgdir}/usr/share/arduino/lib/icons"

    # Create desktop file using existing template
    sed "s,<BINARY_LOCATION>,arduino %U,g;s,<ICON_NAME>,arduino,g" "lib/desktop.template" \
    > "${pkgdir}/usr/share/applications/arduino.desktop"

    # Install Arduino mime type
    ln -s /usr/share/arduino/lib/arduino-arduinoide.xml "${pkgdir}/usr/share/mime/packages/arduino.xml"
}
