# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=astrofox
pkgver=1.3.0
pkgrel=1
pkgdesc="A motion graphics program that lets turn audio into amazing videos"
arch=('any')
url="https://astrofox.io"
license=('MIT')
depends=(electron ffmpeg)
makedepends=(yarn asar sed)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/astrofox-io/astrofox/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=('551624455f2fc16ef579f10024424a52e3297128eaeef1138b6939cfe52fca401e11d5df3c7f1e53c141ff7a19cd0f27ac8153b1647047a7a83eddb73d66ba76')

prepare() {
     # patch for system ffmpeg
    cd $srcdir/${pkgname}-${pkgver}
    
    sed -i "s#^export const FFMPEG_BINARY.*#export const FFMPEG_BINARY = '/usr/bin/ffmpeg';#g" \
        src/main/environment.js
    
    cd $srcdir/${pkgname}-${pkgver}
    
    # delete electron & electron-builder to install deps fast
    sed -i '/"electron"/d' package.json
    sed -i '/"electron-builder"/d' package.json
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
