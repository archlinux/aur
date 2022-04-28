# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=astrofox
pkgver=1.4.0
pkgrel=1
pkgdesc="A motion graphics program that lets turn audio into amazing videos"
arch=('any')
url="https://astrofox.io"
license=('MIT')
depends=(electron ffmpeg)
makedepends=(yarn asar sed)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/astrofox-io/astrofox/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=('bf0adc3ea6f8a388c3e08b93ba70fdb950ec36cf847a9382e516e735506a8f0c0ebf1ae03315d13a29382aa70f684b4742443891d5c661ac839b9a8300b7a195')

prepare() {
     # patch for system ffmpeg
    cd $srcdir/${pkgname}-${pkgver}
    
    sed -i "s#^export const FFMPEG_BINARY.*#export const FFMPEG_BINARY = '/usr/bin/ffmpeg';#g" \
        src/main/environment.js
    
    cd $srcdir/${pkgname}-${pkgver}
    
    # delete electron & electron-builder to install deps fast
    sed -i '/"electron"/d' package.json
    sed -i '/"electron-builder"/d' package.json
    sed -i 's|"autoUpdate": true,|"autoUpdate": false,|g' src/config/app.json
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
