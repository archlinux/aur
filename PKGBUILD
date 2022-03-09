pkgname=webcord
pkgver=3.1.2
pkgrel=2
pkgdesc="A Discord and Fosscord client made with the Electron."
arch=('any')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
depends=('electron')
makedepends=('npm' 'typescript' 'git')
options=('!strip' '!emptydirs')

_srcname="WebCord-${pkgver}"

source=(
    "${_srcname}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    "run.sh"
    "buildInfo.json"
    "app.desktop"
)

sha512sums=(
    'eada5effff913c6b1c42ab428d33aa3f8a7f1433c48c63e42696eaa5b1dfe243113e0e3fc43290992698d4f8e6dcb3d431483fe7d1444a855e9b57f3aed2eddd'
    '451b71d9397d4579b0ae72539a13c804eca0e2ee15a9c3706854c54da46ecb6739dacdf78d9584e20afbdd25e3bfb29a628573443f029a78638f53ccd062d6ae'
    '0c81274928a1dfd2d9adb2f8a7df011bb6d178a00bb4378ff0c9ccd17c6fbc180521c76c79969cd81eac611b9636e04036de906dd5be34cadc370fd93b0d21a4'
    '6c8aa696fb3c20876b502c3447759260754f05dcd163c7d017e53e0a474f0a38809c41c3574a1ff6cd9bbcd7794fbe222c5cbdaf832dff8c2b396215a1f624f2'
)

export ELECTRON_SKIP_BINARY_DOWNLOAD=1

prepare() {
    cd "${srcdir}"
    npm i \
        "@types/dompurify"@"^2.2.3" \
        "@types/marked"@"^4.0.1" \
        "@types/semver"@"^7.3.8" \
        "@types/source-map-support"@"^0.5.3" \
        "@types/spdx-expression-parse"@"^3.0.1" \
        "@types/ws"@"^8.5.1" \
        "electron"@"^17.0.0"

    cd "${_srcname}"
    npm i --omit=dev
    rm -r "sources/code/build"
}

build() {
    cd "${srcdir}/${_srcname}"
    tsc --sourceMap false --outDir "${srcdir}/sources/app"
}

package() {
    local lib="${pkgdir}/usr/lib/${pkgname}"

    cd "${srcdir}"
    install -Dm755 -t "${lib}" "${source[1]}"
    install -dm755 "${pkgdir}/usr/bin" && ln -s "/usr/lib/${pkgname}/${source[1]}" "$_/webcord"
    install -Dm644 -t "${lib}" "${source[2]}"
    install -Dm644 "${source[3]}" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    cp -rdt "${lib}" "sources"

    cd "${_srcname}"
    install -Dm644 -t "${lib}" "package.json"
    cp -rdt "${lib}" "node_modules"
    cp -rdt "${lib}/sources" "sources/assets"
    rm -r "${lib}/sources/assets/icons/app."*
    install -Dm644 "sources/assets/icons/app.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
}
