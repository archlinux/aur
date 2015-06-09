# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Jonas Amstutz <amstutjo at student dot ethz dot ch>

_zipname="GeckoCIRCUITS"
pkgname="geckocircuits"
pkgver=1.72
pkgrel=1
pkgdesc="Powerful Circuit Simulator developed by PES/ETH Zürich"
arch=('any')
options=('!strip')
url="http://www.gecko-simulations.com/geckocircuits.html"
license=('GPL3')
depends=('java-environment>=6')
makedepends=('imagemagick')
provides=("${pkgname}")
source=("http://www.gecko-simulations.com/downloads/${_zipname}.zip")
sha256sums=('49c0a70a5d659a5051e388ebc77a147750eb5ee85b12943ff0abcad8f5d13aea')

_geckocircuits_desktop="[Desktop Entry]
Encoding=UTF-8
Version=${pkgver}
Name=GeckoCircuits
Icon=gecko
GenericName=Powerful Circuit Simulator
Comment=Powerful Circuit Simulator for Electronic Systems
Exec=/usr/bin/geckocircuits
Terminal=false
Type=Application
Categories=Development;"

_geckocircuits_sh="#!/bin/bash
java -jar /opt/geckocircuits/GeckoCIRCUITS.jar"

build() {
    cd "${srcdir}"   
    echo -e "$_geckocircuits_desktop" | tee geckocircuits.desktop
    echo -e "$_geckocircuits_sh" | tee geckocircuits.sh
}

package() {

    cd "${srcdir}"
    # copy to fakeroot environment
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -R ${srcdir}/${_zipname}/* ${pkgdir}/opt/${pkgname}
    
    # install 
    mkdir -p ${pkgdir}/usr/share/{applications,pixmaps}
    install -Dm644 ${srcdir}/geckocircuits.desktop ${pkgdir}/usr/share/applications/
    convert ${pkgdir}/opt/${pkgname}/gecko.ico ${pkgdir}/usr/share/pixmaps/gecko.png

    # create starter file 
    install -Dm755 ${srcdir}/geckocircuits.sh ${pkgdir}/opt/${pkgname}/geckocircuits.sh
    # link starter file
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/${pkgname}/geckocircuits.sh ${pkgdir}/usr/bin/geckocircuits
}
