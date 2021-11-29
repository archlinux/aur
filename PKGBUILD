pkgname=webcord
pkgver=2.1.2
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
    "app.desktop"
    "disable-updates-check.patch"
)

sha512sums=(
    '1e80b09ba72b7c69a2f023fbc6c87afae0f2ad81c726b12f1d77d7ba87e9da34c4af9ab49e9bae1cef60f9ea7c479a0092e12ab0d8698c7ebcffc21085bcf46d'
    'bb07c103ef15c2b12d610cfbdedc6b6ff9c3c8b3ec942a9f7cda461e9a906b49a268a9ce6a1fc0eb3783695fc8ecefac04aff4b8052bb17a19101cba340d40f0'
    '454f3d005e77d7f146ff13b8f5c0af8ce9480529b6b9f4ce8541e6e141a8c8a79b700bdf95337e52b8aa7fd7fd3478d16fb274f4d46bf3bb70467d77e909dcdc'
)

prepare() {
    cd "${srcdir}/${_srcname}"

    patch -p0 -N -i "${srcdir}/disable-updates-check.patch"

    npm i --omit=dev
}

build() {
    cd "${srcdir}/${_srcname}"

    tsc | true
}

package() {
    cd "${srcdir}"

    local bin="${pkgname}"
    echo "#!/bin/sh" >"${bin}"
    echo "electron15 \"/usr/lib/${pkgname}/\" \$@" >>"${bin}"
    install -Dm755 -t "${pkgdir}/usr/bin" "${bin}"

    install -Dm644 "app.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    cd "${_srcname}"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"

    local lib="${pkgdir}/usr/lib/${pkgname}"

    install -Dm644 -t "${lib}" "package.json"
    cp -rt "${lib}" "sources" "node_modules"

    rm -r \
        "${lib}/sources/app/.build" \
        "${lib}/sources/app/build" \
        "${lib}/sources/code/build" \
        "${lib}/sources/assets/icons/app.ic"*

    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps" && ln -s "/usr/lib/${pkgname}/sources/assets/icons/app.png" "$_/${pkgname}.png"
}
