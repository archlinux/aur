pkgname=webcord
pkgver=2.0.1
pkgrel=2
pkgdesc="A Discord web-based client made with the Electron API."
arch=('any')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
depends=('electron>=15.1.0' 'electron<16')
makedepends=('npm>=7' 'typescript>=4.3.4' 'typescript<5')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-bin" "${pkgname}-git")
options=('!strip' '!emptydirs')

_srcname="WebCord-${pkgver}"

source=(
    "${_srcname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "app.desktop"
)

sha512sums=(
    'e0cae32c6fd2dc35521b6521f22f73b1403a7c902fd738ee263d289bbff997b94f6d45b4e23edd8fcbb273ad53c89fa35d8d16bc969ee46acd24153da79d1aa0'
    'bb07c103ef15c2b12d610cfbdedc6b6ff9c3c8b3ec942a9f7cda461e9a906b49a268a9ce6a1fc0eb3783695fc8ecefac04aff4b8052bb17a19101cba340d40f0'
)

build() {
    cd "${srcdir}/${_srcname}"

    npm i --only=prod

    tsc &>/dev/null | true
}

package() {
    cd "${srcdir}"

    local bin="./${pkgname}"
    echo "#!/bin/sh" >"${bin}"
    echo "electron \"/usr/lib/${pkgname}/\" \$@" >>"${bin}"
    install -Dm755 -t "${pkgdir}/usr/bin/" "${bin}"

    install -Dm644 "./app.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    cd "${_srcname}"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "./LICENSE"

    local lib="${pkgdir}/usr/lib/${pkgname}"

    install -Dm644 -t "${lib}/" "./package.json"
    cp -rt "${lib}/" "./sources/" "./node_modules/"

    rm -r \
        "${lib}/sources/app/.build" \
        "${lib}/sources/app/build" \
        "${lib}/sources/code/build" \
        "${lib}/sources/assets/icons/app.ic"*

    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps" && ln -s "/usr/lib/${pkgname}/sources/assets/icons/app.png" "$_/${pkgname}.png"
}
