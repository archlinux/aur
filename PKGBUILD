pkgname=webcord
pkgver=2.2.0
pkgrel=1
pkgdesc="A Discord web-based client made with the Electron API."
arch=('any')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
depends=('electron')
makedepends=('npm' 'typescript' 'git')
conflicts=("${pkgname}")
options=('!strip' '!emptydirs')

_srcname="WebCord-${pkgver}"

source=(
    "${_srcname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "package.json"
    "buildInfo.json"
    "app.desktop"
)

sha512sums=(
    '7a874a0abb52609759a2ba85fd1a8f8bb75f30b32b9d4786a16e98ac0beddee42447267e52b76cbe41fc6dc41f4164b36bbbe8f1e844f83b79ea39f0cfbc5134'
    '7e9cd984c15d5977bc2e85e8d62e46a5dc7347c4746e22a0d5dbbe70551172c1a7330c214ec6d07d102d0c6ad736336efb50a57bbae16e34cc0ac80aa1082ba4'
    '0c81274928a1dfd2d9adb2f8a7df011bb6d178a00bb4378ff0c9ccd17c6fbc180521c76c79969cd81eac611b9636e04036de906dd5be34cadc370fd93b0d21a4'
    'bb07c103ef15c2b12d610cfbdedc6b6ff9c3c8b3ec942a9f7cda461e9a906b49a268a9ce6a1fc0eb3783695fc8ecefac04aff4b8052bb17a19101cba340d40f0'
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
