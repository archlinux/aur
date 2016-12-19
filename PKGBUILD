# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
pkgname=discovery200-files
pkgver=1.0
pkgrel=1
pkgdesc="Files to use a Discovery 200 3D Printer"
arch=(any)
url="http://www.dagoma.fr/en/produit/imprimante-discovery200/"
license=('GPL')
optdepends=(
    'arduino: for Arduino programming'
    'cura: for crafting gcode files from 3D models'
    'printrun: to drive the printer through USB with pronterface')
source=('https://github.com/Lauszus/Sanguino/releases/download/1.0.0/Sanguino-1.0.0.zip'
        'discovery_200.json')
sha256sums=('1bfe7707894907a2792884fc726e1fe9251842fac75eaf5ef451bba0c18cbb4e'
            'af36f64f8ec3832cf996a315d16f3a3f0a269ee233a1a3e5c76ada03135aeace')

prepare() {
    # Lower the upload speed for the printer board
    sed -i 's/^\(sanguino\.menu\.cpu\.atmega1284p\.upload.speed\)=115200/\1=57600/' "$srcdir/Sanguino/boards.txt"
}

package() {
    # Install Sanguino profile for Arduino, as the printer uses Sanguino with ATmega1284P 16MHz
    # c.f. https://github.com/Lauszus/Sanguino/
    mkdir -p "$pkgdir/usr/share/arduino/hardware/sanguino/avr"
    cp -R "$srcdir/Sanguino/"* "$pkgdir/usr/share/arduino/hardware/sanguino/avr/"

    # Install a Cura printer
    # FIXME: this JSON file uses the Prusa platform, which is not Dagoma's one
    install -m644 -D "$srcdir/discovery_200.json" "$pkgdir/usr/share/cura/resources/machines/discovery_200.json"
}
