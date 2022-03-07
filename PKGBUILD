pkgname=webcord
pkgver=3.1.2
pkgrel=1
pkgdesc="A Discord and Fosscord web-based client made with the Electron API."
arch=('any')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
depends=('electron')
makedepends=('npm' 'typescript' 'git')
conflicts=("${pkgname}")
options=('!strip' '!emptydirs')

_srcname="WebCord-${pkgver}"

source=(
    "${_srcname}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    "package.json"
    "buildInfo.json"
    "app.desktop"
)

sha512sums=(
    'eada5effff913c6b1c42ab428d33aa3f8a7f1433c48c63e42696eaa5b1dfe243113e0e3fc43290992698d4f8e6dcb3d431483fe7d1444a855e9b57f3aed2eddd'
    '71ed07229617f2b09ae9eba7e3b7898db79f6bb6b3709fd6547e3210796965648524dbfbcf77b106eeea474df16d2dc2159e412ea57963c5a2df4a32ed75475b'
    '0c81274928a1dfd2d9adb2f8a7df011bb6d178a00bb4378ff0c9ccd17c6fbc180521c76c79969cd81eac611b9636e04036de906dd5be34cadc370fd93b0d21a4'
    '6c8aa696fb3c20876b502c3447759260754f05dcd163c7d017e53e0a474f0a38809c41c3574a1ff6cd9bbcd7794fbe222c5cbdaf832dff8c2b396215a1f624f2'
)

prepare() {
    cd "${srcdir}"
    ELECTRON_SKIP_BINARY_DOWNLOAD=1 npm i

    cd "${_srcname}"
    npm i --omit=dev
    rm -r "sources/code/build"
}

build() {
    cd "${srcdir}/${_srcname}"
    tsc --sourceMap false
}

package() {
    cd "${srcdir}"

    local bin="${pkgname}"
    echo "#!/bin/sh" >"${bin}"
    echo "electron '/usr/lib/${pkgname}' \$@" >>"${bin}"
    install -Dm755 -t "${pkgdir}/usr/bin" "${bin}"

    install -Dm644 "app.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    local lib="${pkgdir}/usr/lib/${pkgname}"

    install -Dm644 -t "${lib}" "buildInfo.json"

    cd "${_srcname}"

    install -Dm644 -t "${lib}" "package.json"
    cp -rt "${lib}" "sources" "node_modules"

    rm -r \
        "${lib}/sources/app/.build" \
        "${lib}/sources/code" \
        "${lib}/sources/assets/icons/app.ic"*

    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps" && ln -s "/usr/lib/${pkgname}/sources/assets/icons/app.png" "$_/${pkgname}.png"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
}
