# Maintainer: NicoHood <aur {at} nicohood {dot} de>
# Contributor: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: PyroPeter <googlemail.com@abi1789>
# Contributor: darkapex <me@jailuthra.in>
# Contributor: tty0 <vt.tty0[d0t]gmail.com>

pkgname=arduino-bin
pkgver=1.6.12
pkgrel=1
pkgdesc="Arduino prototyping platform SDK"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://arduino.cc/en/Main/Software"
options=(!strip staticlibs)
license=('GPL' 'LGPL')
depends=('gtk2' 'desktop-file-utils' 'shared-mime-info' 'java-runtime=8')
optdepends=('arduino-avr-core: AVR core with upstream avr-gcc and avrdude')
provides=('arduino' 'arduino-builder' 'arduino-docs')
conflicts=('arduino' 'arduino-builder' 'arduino-docs')
install="arduino.install"
source_i686=("https://downloads.arduino.cc/arduino-${pkgver}-linux32.tar.xz")
source_x86_64=("https://downloads.arduino.cc/arduino-${pkgver}-linux64.tar.xz")
source_armv6h=("https://downloads.arduino.cc/arduino-${pkgver}-linuxarm.tar.xz")
source_armv7h=("https://downloads.arduino.cc/arduino-${pkgver}-linuxarm.tar.xz")
source=("arduino.sh")
sha512sums_i686=('27855ba3ad1be254aa570cc6f7d0747c59bd07df9eb78dd5691af44258596899ece4a5723817277dc9c71ae2bbe293425a928c0ce1e01fa02ca6a3af588f4977')
sha512sums_x86_64=('ff1d5e6506692abdda63b2f0ec8ec0acccdc6d24f2e16240e1527a56b64cd0e30113c7d9b2f3fba443de68981ac16a9943ca327386873d9a1154aaf2b6f448a0')
sha512sums_armv6h=('870c0d036c92557a11ae25e98e31a43bde5e1bcceccbcca8ae84dfc81944989b92c742ee30d4f55eacd086fe56682e54e2fdacbb5c58e4be171b922fa86cbe64')
sha512sums_armv7h=('870c0d036c92557a11ae25e98e31a43bde5e1bcceccbcca8ae84dfc81944989b92c742ee30d4f55eacd086fe56682e54e2fdacbb5c58e4be171b922fa86cbe64')
sha512sums=('6dae08b8687e897ed370cc51cfeeba9020bb749356acfd367c796bf34fb43b763888340501be6a577859c19c37fe857be2b8fb52f1295769403b8e826c4e3f28')

prepare() {
    # Remove the bundled java
    rm -rf "arduino-${pkgver}/java"
}

package() {
    cd "arduino-${pkgver}"

    # Create directories
    install -dm755 "${pkgdir}/usr/share/"{doc,icons/hicolor,applications,mime/packages}

    # Copy the whole SDK
    cp -a . "${pkgdir}/usr/share/arduino"

    # Create wrapper for java8 + buider and documentation symlink
    install -Dm755 "${srcdir}/arduino.sh" "${pkgdir}/usr/bin/arduino"
    ln -s /usr/share/arduino/arduino-builder "${pkgdir}/usr/bin/arduino-builder"
    ln -s /usr/share/arduino/reference "${pkgdir}/usr/share/doc/arduino"

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
