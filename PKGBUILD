# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=muwire-git
pkgver=0.4.13.r5.gd9c1067
pkgrel=1
pkgdesc='An I2P file sharing program (git version)'
arch=('any')
url='https://muwire.com/'
license=('GPL3')
depends=('bash' 'java-runtime>=8' 'java-runtime<=12' 'hicolor-icon-theme')
makedepends=('git' 'gradle')
source=('git+https://github.com/zlatinb/muwire.git'
        'muwire.desktop'
        'muwire.sh')
sha256sums=('SKIP'
            'e3e425d872f3c8cd68037b4ffe71ec66d07148072db89f6af220e7b24881d633'
            'd48d94fef75622bb2afca202804a32cac1cec0514894e1a7c21bb9c2d3a9438b')

pkgver() {
    cd muwire
    
    # git, tags available
    git describe --long --tags | sed 's/^muwire-//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    gradle -p muwire clean assemble
}

package() {
    local _version
    _version="${pkgver%%.r*}"
    
    cd muwire
    
    bsdtar -x -f "gui/build/distributions/gui-shadow-${_version}.tar" --strip-components 2 */lib/"gui-${_version}.jar"
    
    install -D -m755 "${srcdir}/muwire.sh" "${pkgdir}/usr/bin/muwire"
    install -D -m644 "gui-${_version}.jar" "${pkgdir}/usr/share/java/muwire.jar"
    
    install -D -m644 "${srcdir}/muwire.desktop" -t "${pkgdir}/usr/share/applications"
    
    local _res
    for _res in 16 32 48 64 128
    do
        install -D -m644 "gui/griffon-app/resources/MuWire-${_res}x${_res}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png"
    done
}
