pkgname=webcord
pkgver=2.1.3
pkgrel=2
pkgdesc="A Discord web-based client made with the Electron API."
arch=('any')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
depends=('electron15')
makedepends=('npm' 'typescript' 'git')
conflicts=("${pkgname}")
options=('!strip' '!emptydirs')

_srcname="WebCord-${pkgver}"

source=(
    "${_srcname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "package.json"
    "buildInfo.json"
    "app.desktop"
    "disable-updates-check.patch"
)

sha512sums=(
    '00aa8e9ec824f8db861d786b61481ddc52ec149e1a9a3eccd5d1bfe80e5e990936dfe8cc21607f7938be43c5fb9e1c82b6e4df154839aeee67b688c3e4740833'
    '868e3ca8ee5f936e9c596cfb61fdb32df72e0d30d0633878bd784464239e730d40c6f611797489753bcda919b53ccd26adaae84c345204434df951cf4939fe70'
    '1914cc3b7c8da664f98510e727b601a090c5a5bc29050f01980e2104f80f06bb9fcda20d8d882523d9219cd0a9c50417d0902d00499f002109c81c3de74bb9b3'
    'bb07c103ef15c2b12d610cfbdedc6b6ff9c3c8b3ec942a9f7cda461e9a906b49a268a9ce6a1fc0eb3783695fc8ecefac04aff4b8052bb17a19101cba340d40f0'
    '454f3d005e77d7f146ff13b8f5c0af8ce9480529b6b9f4ce8541e6e141a8c8a79b700bdf95337e52b8aa7fd7fd3478d16fb274f4d46bf3bb70467d77e909dcdc'
)

prepare() {
    cd "${srcdir}"

    ELECTRON_SKIP_BINARY_DOWNLOAD=1 \
        npm i --package-lock=false

    cd "${_srcname}"

    npm i --omit=dev --package-lock=false

    rm -r "sources/code/build"

    patch -p0 -N -i "${srcdir}/disable-updates-check.patch"
}

build() {
    cd "${srcdir}/${_srcname}"

    tsc --sourceMap false
}

package() {
    cd "${srcdir}"

    local bin="${pkgname}"
    echo "#!/bin/sh" >"${bin}"
    echo "electron15 \"/usr/lib/${pkgname}/\" \$@" >>"${bin}"
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
