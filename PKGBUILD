# Maintainer: NicoHood <aur {at} nicohood {dot} de>
# Contributor: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: PyroPeter <googlemail.com@abi1789>
# Contributor: darkapex <me@jailuthra.in>
# Contributor: tty0 <vt.tty0[d0t]gmail.com>

pkgname=arduino-bin
pkgver=1.6.11
pkgrel=2
pkgdesc="Arduino prototyping platform SDK"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://arduino.cc/en/Main/Software"
options=(!strip staticlibs)
license=('GPL' 'LGPL')
depends=('gtk2' 'desktop-file-utils' 'shared-mime-info' 'java-runtime=8' 'avrdude')
provides=('arduino')
conflicts=('arduino')
install="arduino.install"
source_i686=("https://downloads.arduino.cc/arduino-${pkgver}-linux32.tar.xz")
source_x86_64=("https://downloads.arduino.cc/arduino-${pkgver}-linux64.tar.xz")
source_armv6h=("https://downloads.arduino.cc/arduino-${pkgver}-linuxarm.tar.xz")
source_armv7h=("https://downloads.arduino.cc/arduino-${pkgver}-linuxarm.tar.xz")
source=("arduino.sh")
sha512sums_i686=('1819d3b5de13bce00fa96b411bca74ccbf5b9db5deb9c8ebf874b8a0c00d0d8e90277d4ec34961cc2fc1f810c1fac8cbe9bc93f737d95d6970f50b929a1484e3')
sha512sums_x86_64=('252ae2ca085e598992cc1a8d067dd69c369789376aea75bb14cb3937317e77d14f239e9df4158fbabdb607ce7a04a59401747a0148db8957ce072075b10b5dee')
sha512sums_armv6h=('c06f18d9589f1252f75ad338a4011ed8905379d7737b14692d3a1ecbd5aea9013de3bcab11cc4e45d1d940ea3d5e7072d3b30bfc1eb760ed3d07ea75645f0d64')
sha512sums_armv7h=('c06f18d9589f1252f75ad338a4011ed8905379d7737b14692d3a1ecbd5aea9013de3bcab11cc4e45d1d940ea3d5e7072d3b30bfc1eb760ed3d07ea75645f0d64')
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
