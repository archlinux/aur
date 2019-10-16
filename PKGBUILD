# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=muwire
pkgver=0.5.0
pkgrel=1
pkgdesc='An I2P file sharing program'
arch=('any')
url='https://muwire.com/'
license=('GPL3')
depends=('bash' 'java-runtime' 'hicolor-icon-theme')
makedepends=('gradle')
source=("https://github.com/zlatinb/muwire/archive/muwire-${pkgver}.tar.gz"
        'muwire.desktop'
        'muwire.sh')
sha256sums=('fb1a61ad815a69540850b099c990252748e6ffe0166ecd558ac7d8f0a8b58920'
            'e3e425d872f3c8cd68037b4ffe71ec66d07148072db89f6af220e7b24881d633'
            'd48d94fef75622bb2afca202804a32cac1cec0514894e1a7c21bb9c2d3a9438b')

build() {
    gradle -p "muwire-muwire-${pkgver}" clean assemble
}

package() {
    cd "muwire-muwire-${pkgver}"
    
    bsdtar -x -f "gui/build/distributions/gui-shadow-${pkgver}.tar" --strip-components 2 */lib/"gui-${pkgver}.jar"
    
    install -D -m755 "${srcdir}/muwire.sh" "${pkgdir}/usr/bin/muwire"
    install -D -m644 "gui-${pkgver}.jar"   "${pkgdir}/usr/share/java/muwire.jar"
    
    install -D -m644 "${srcdir}/muwire.desktop" -t "${pkgdir}/usr/share/applications"
    
    local _res
    for _res in 16 32 48 64 128
    do
        install -D -m644 "gui/griffon-app/resources/MuWire-${_res}x${_res}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png"
    done
}
