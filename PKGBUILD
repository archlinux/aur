# Maintainer: NicoHood <aur {at} nicohood {dot} de>
# Contributor: Tomas Schertel <tschertel at gmail dot com>
# Contributor: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: PyroPeter <googlemail.com@abi1789>
# Contributor: darkapex <me@jailuthra.in>
# Contributor: tty0 <vt.tty0[d0t]gmail.com>

pkgname=arduino
pkgver=1.6.11
pkgrel=5
epoch=1
pkgdesc="Arduino prototyping platform SDK"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/arduino/Arduino"
license=('GPL' 'LGPL')
depends=('gtk2' 'desktop-file-utils' 'shared-mime-info' 'java-runtime=8' 'avrdude')
makedepends=('java-environment=8' 'apache-ant' 'unzip')
options=(!strip staticlibs)
install="arduino.install"
source=("https://github.com/arduino/Arduino/archive/${pkgver}.tar.gz"
        "arduino.sh")
sha512sums=('f18f173c95aea1b60aa4e7ef98e0dc1a44595571d522569b53842fe8c110e92da82902c25aea6b1affe4e3dfe0098ce0c173cf73c42b2237ce353a5a70932f68'
            '6dae08b8687e897ed370cc51cfeeba9020bb749356acfd367c796bf34fb43b763888340501be6a577859c19c37fe857be2b8fb52f1295769403b8e826c4e3f28')

build() {
    cd "Arduino-${pkgver}/build"
    export PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH
    ant clean build
}

package() {
    cd "Arduino-${pkgver}/build/linux/work"

    # Create directories
    install -dm755 "${pkgdir}/usr/share/"{doc,icons/hicolor,applications,mime/packages}

    # Copy the whole SDK
    cp -a . "${pkgdir}/usr/share/arduino"

    # Create wrapper for java8 + buider and documentation symlink
    install -Dm755 "${srcdir}/arduino.sh" "${pkgdir}/usr/bin/arduino"
    ln -s /usr/share/arduino/arduino-builder "${pkgdir}/usr/bin/arduino-builder"
    ln -s /usr/share/arduino/reference "${pkgdir}/usr/share/doc/arduino"

    # Fix avrdude (see https://github.com/arduino/Arduino/issues/5094)
    rm -f "${pkgdir}/usr/share/arduino/hardware/tools/avr/bin/avrdude"{,_bin}
    ln -s /usr/bin/avrdude "${pkgdir}/usr/share/arduino/hardware/tools/avr/bin/avrdude"

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
