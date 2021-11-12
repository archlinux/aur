pkgname=webcord
pkgver=2.1.0
pkgrel=1
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
    '203d8dfb848720c304238fabbc716ff7f21b07efa5d9f78e3fbfdfebb99f04098d5a459ea4e056a139dcfb1c499f349a2623da0417a4280b60cfbe96b577c056'
    'bb07c103ef15c2b12d610cfbdedc6b6ff9c3c8b3ec942a9f7cda461e9a906b49a268a9ce6a1fc0eb3783695fc8ecefac04aff4b8052bb17a19101cba340d40f0'
)

build() {
    cd "${srcdir}/${_srcname}"

    npm i --omit=dev

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
