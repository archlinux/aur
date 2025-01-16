# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=astrofox
pkgver=1.4.0
pkgrel=5
_electron=electron34
pkgdesc="A motion graphics program that lets turn audio into amazing videos"
arch=('any')
url="https://astrofox.io"
license=('MIT')
depends=(${_electron} ffmpeg)
makedepends=(yarn asar sed 'jq' 'moreutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/astrofox-io/astrofox/archive/refs/tags/v${pkgver}.tar.gz"
    ${pkgname}.sh
    ${pkgname}.desktop
    "update-master.patch::https://github.com/astrofox-io/astrofox/compare/v1.4.0...master.patch"
    "electron30.patch::https://patch-diff.githubusercontent.com/raw/astrofox-io/astrofox/pull/116.patch"
)
sha512sums=('bf0adc3ea6f8a388c3e08b93ba70fdb950ec36cf847a9382e516e735506a8f0c0ebf1ae03315d13a29382aa70f684b4742443891d5c661ac839b9a8300b7a195'
            '74cc07387771a9c1a8255f0ec0bb28c9527a8a15ff344977b803e8dbaba14af29de4e04747da04ca7204f2e22fe0882030d5c6db9a1bd50e482e6de4b025713b'
            'b4b3828b1216adf3cf1105074b64bfbd6fd440fb61da7a389a3e6b172e6607c90de3218e6762997344d861dc10fbc2b3ecbccf02d01a292918b89eed3903bcf2'
            'fbc51fb7a52560d8ed9c883f15ccf20432361cce6b59af2a737bbe4d67111361e3fbdd0080120dcd9482cfced2880a93712261d20b60862af3e2d23cbac7a717'
            '0555e946d11f3bae064f9256da51fe1306df8eaad9771aa46a52823dd3655e6d735c1af45688e1e48c4e22bca51ffad0e0deb6cf821554409a694b336848368b')

prepare() {
    # patch for system ffmpeg
    cd $srcdir/${pkgname}-${pkgver}
    patch --strip=1 --ignore-whitespace <../update-master.patch
    patch --strip=1 --ignore-whitespace <../electron30.patch

    # system ffmpeg
    sed -i "s#^export const FFMPEG_BINARY.*#export const FFMPEG_BINARY = '/usr/bin/ffmpeg';#g" \
        src/main/environment.js
    # set electron in script
    sed -i "s|_ELECTRON_|${_electron}|g" ${srcdir}/${pkgname}.sh

    # system electron
    local electronDist="/usr/lib/${_electron}"
    local electronVersion="$(<$electronDist/version)"
    jq ".devDependencies.electron = \"$electronVersion\"" package.json | sponge package.json
    jq ".build.electronDist = \"$electronDist\"" package.json | sponge package.json
    jq ".build.electronVersion = \"$electronVersion\"" package.json | sponge package.json

    # disable in-app update
    sed -i 's|"autoUpdate": true,|"autoUpdate": false,|g' src/config/app.json
    sed -i 's|"checkForUpdates": true,|"checkForUpdates": false,|g' src/config/app.json

    # fix entry
    jq ".version = \"$pkgver\"" package.json | sponge package.json
    jq '.main = "main.js"' package.json | sponge package.json
}
build() {
    cd $srcdir/${pkgname}-${pkgver}
    export HOME=$srcdir

    yarn install --prod
    yarn add webpack
    yarn run build-main && yarn run build-prod

    cp package.json app/

    rm app/*.map
    cp src/build/app/dev-app-update.yml app/app-update.yml
    asar pack app/ ${pkgname}.asar

}

package() {
    cd $srcdir/${pkgname}-${pkgver}
    install -Dm755 $srcdir/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.asar ${pkgdir}/usr/share/${pkgname}/${pkgname}.asar
    install -Dm644 build/icons/512x512.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
    install -Dm644 $srcdir/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
# vim: ts=2 sw=2 et:
