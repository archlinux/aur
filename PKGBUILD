# Maintainer: caodien <caodien at gmail dot com>
# Contributor: NicoHood <aur {at} nicohood {dot} de>
# Contributor: Christopher Loen <christopherloen at gmail dot com>

pkgname=arduino-git
pkgver=1.8.13.r24.gf4e8a91f1
pkgrel=1
pkgdesc="Arduino prototyping platform SDK"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/arduino/Arduino"
license=('GPL' 'LGPL')
depends=('gtk2' 'desktop-file-utils' 'shared-mime-info' 'java-runtime>=8')
makedepends=('java-environment=8' 'ant' 'unzip')
optdepends=('arduino-avr-core: AVR core with upstream avr-gcc and avrdude'
            'python2: Intel Galileo Board installation')
options=(!strip)
install="arduino.install"
provides=('arduino' 'arduino-builder')
conflicts=('arduino' 'arduino-builder')
source=("${pkgname}::git+https://github.com/arduino/Arduino/#branch=master")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}/build"
    ant clean build -Dlight_bundle=true
}

package() {
    cd "${srcdir}/${pkgname}/build/linux/work"

    # Create directories
    install -dm755 "${pkgdir}/usr/share/"{doc,icons/hicolor,applications,mime/packages} "${pkgdir}/usr/bin"

    # Copy the whole SDK
    cp -a . "${pkgdir}/usr/share/arduino"

    # Create arduino, builder and documentation symlink
    ln -s /usr/share/arduino/arduino "${pkgdir}/usr/bin/arduino"
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
