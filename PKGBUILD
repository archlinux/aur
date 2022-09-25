# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=astrofox
pkgver=1.4.0
pkgrel=3
pkgdesc="A motion graphics program that lets turn audio into amazing videos"
arch=('any')
url="https://astrofox.io"
license=('MIT')
_electron=electron19
depends=(${_electron} ffmpeg)
makedepends=(yarn asar sed)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/astrofox-io/astrofox/archive/refs/tags/v${pkgver}.tar.gz"
${pkgname}.sh
${pkgname}.desktop
)
sha512sums=('bf0adc3ea6f8a388c3e08b93ba70fdb950ec36cf847a9382e516e735506a8f0c0ebf1ae03315d13a29382aa70f684b4742443891d5c661ac839b9a8300b7a195'
            '74cc07387771a9c1a8255f0ec0bb28c9527a8a15ff344977b803e8dbaba14af29de4e04747da04ca7204f2e22fe0882030d5c6db9a1bd50e482e6de4b025713b'
            'b4b3828b1216adf3cf1105074b64bfbd6fd440fb61da7a389a3e6b172e6607c90de3218e6762997344d861dc10fbc2b3ecbccf02d01a292918b89eed3903bcf2')

prepare() {
     # patch for system ffmpeg
    cd $srcdir/${pkgname}-${pkgver}

    sed -i "s#^export const FFMPEG_BINARY.*#export const FFMPEG_BINARY = '/usr/bin/ffmpeg';#g" \
        src/main/environment.js

    cd $srcdir/${pkgname}-${pkgver}
    export HOME=$srcdir
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
    mv app/dev-app-update.yml app/app-update.yml
    asar pack app/ ${pkgname}.asar

    sed -i "s|_ELECTRON_|${_electron}|g" ${srcdir}/${pkgname}.sh

}

package() {
    cd $srcdir/${pkgname}-${pkgver}
    install -Dm755 $srcdir/${pkgname}.sh           ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.asar      ${pkgdir}/usr/share/${pkgname}/${pkgname}.asar
    install -Dm644 build/icons/512x512.png  ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
    install -Dm644 $srcdir/${pkgname}.desktop       ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
# vim: ts=2 sw=2 et:
