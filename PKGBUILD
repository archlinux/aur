# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=astrofox
pkgver=1.2.0
pkgrel=1
pkgdesc="A motion graphics program that lets turn audio into amazing videos"
arch=('any')
url="https://astrofox.io"
license=('MIT')
depends=(electron)
makedepends=(yarn asar)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/astrofox-io/astrofox/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('51c8dfe5c8922484ffba1f64bcbe383388cc9989d8ea9e03500ae41340525820538b40dcfde7e7961ed5704e3d89bc67ea146ac15cbe033bc5a9e63804cdf44e')

prepare() {
    cd $srcdir/${pkgname}-${pkgver}
    
    # delete electron & electron-builder to install deps fast
    sed -i "141,142d" package.json 
    yarn install
    yarn run  build-main  && yarn run build-prod
    
    # prepare for asar entry
    sed -i '13,$d' package.json
    echo '''    "main": "main.js",
    "dependencies": {}
}
''' >> package.json
    cp package.json app/
    
    rm app/*.map
    asar pack app/ ${pkgname}.asar
    
    # desktop file
    echo """[Desktop Entry]
Name=Astrofox
Exec=${pkgname} %U
Terminal=false
Type=Application
Icon=astrofox
StartupWMClass=Astrofox
Comment=Audio reactive motion graphics program
Categories=AudioVideo;
""" > ${pkgname}.desktop
    
    # executable
    echo """#! /usr/bin/bash
electron /usr/share/${pkgname}/${pkgname}.asar --no-sandbox
" > ${pkgname}
}

package() {
    cd $srcdir/${pkgname}-${pkgver}
    install -Dm755 ${pkgname}           ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.asar      ${pkgdir}/usr/share/${pkgname}/${pkgname}.asar
    install -Dm644 build/icons/512x512.png  ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
    install -Dm644 ${pkgname}.desktop       ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
# vim: ts=2 sw=2 et:
