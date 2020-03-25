# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=muwire
pkgver=0.6.12
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
sha256sums=('df121c83938678087e667c28026026d00976f5962309d654c3891be3cee1ee94'
            'e3e425d872f3c8cd68037b4ffe71ec66d07148072db89f6af220e7b24881d633'
            'd48d94fef75622bb2afca202804a32cac1cec0514894e1a7c21bb9c2d3a9438b')

build() {
    gradle -p "muwire-muwire-${pkgver}" clean assemble
}

package() {
    cd "muwire-muwire-${pkgver}"
    
    bsdtar -x -f "gui/build/distributions/gui-shadow-${pkgver}.tar" --strip-components 2 */lib/"gui-${pkgver}-all.jar"
    
    install -D -m755 "${srcdir}/muwire.sh"   "${pkgdir}/usr/bin/muwire"
    install -D -m644 "gui-${pkgver}-all.jar" "${pkgdir}/usr/share/java/muwire.jar"
    
    install -D -m644 "${srcdir}/muwire.desktop" -t "${pkgdir}/usr/share/applications"
    
    local _res
    for _res in 16 32 48 64 128
    do
        install -D -m644 "gui/griffon-app/resources/MuWire-${_res}x${_res}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png"
    done
}
