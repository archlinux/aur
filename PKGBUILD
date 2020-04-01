# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=muwire-git
pkgver=0.6.12.r39.g293ff76a
pkgrel=1
pkgdesc='An I2P file sharing program (git version)'
arch=('any')
url='https://muwire.com/'
license=('GPL3')
depends=('bash' 'java-runtime' 'hicolor-icon-theme')
makedepends=('git' 'gradle')
provides=('muwire')
conflicts=('muwire')
source=('git+https://github.com/zlatinb/muwire.git'
        'muwire.desktop'
        'muwire.sh')
sha256sums=('SKIP'
            'e3e425d872f3c8cd68037b4ffe71ec66d07148072db89f6af220e7b24881d633'
            'd48d94fef75622bb2afca202804a32cac1cec0514894e1a7c21bb9c2d3a9438b')

pkgver() {
    git -C muwire describe --long --tags | sed 's/^muwire-//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    gradle -p muwire clean assemble
}

package() {
    bsdtar -xf "muwire/gui/build/distributions/gui-shadow-${pkgver%%.r*}.tar" \
        -C muwire --strip-components 2 "*/lib/gui-${pkgver%%.r*}-all.jar"
    install -D -m755 muwire.sh "${pkgdir}/usr/bin/muwire"
    install -D -m644 muwire.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 "muwire/gui-${pkgver%%.r*}-all.jar" "${pkgdir}/usr/share/java/muwire.jar"
    local _res
    for _res in 16 32 48 64 128
    do
        install -D -m644 "muwire/gui/griffon-app/resources/MuWire-${_res}x${_res}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/muwire.png"
    done
}
