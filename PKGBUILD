# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname="thorium-reader"
pkgname="${_pkgname}-git"
pkgver=2.3.0.r36.gb8b37dbe
pkgrel=1
pkgdesc="Cross-platform desktop reading app based on the Readium Desktop toolkit"
arch=('any')
url="https://github.com/edrlab/thorium-reader"
license=('MIT')
conflicts=(
    "${_pkgname}"
)
provides=(
    "${_pkgname}"
)
depends=(
    'electron27'
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm>=9.0.0'
)
_pkgsrc="${_pkgname}"
source=(
    "${_pkgsrc}"::"git+${url}.git"
    "${_pkgname}.sh"
)
sha256sums=('SKIP'
            '67372e4273ddd69a6df951c66643230c114533e584f9f131d2a0847e9c833c3c')
pkgver() {
    cd "${_pkgsrc}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 18
    nvm use 18
}
build() {
    local _gendesk_options=(
        -q -f -n
        --pkgname="$_pkgname"
        --pkgdesc="$pkgdesc"
        --name="Thorium Reader"
        --exec="$_pkgname %u"
        --icon="$_pkgname"
        --terminal=false
        --categories="Office"
        --mimetypes="application/epub+zip"
        --startupnotify=true
        --custom="StartupWMClass=ThoriumReader"
    )
    gendesk "${_gendesk_options[@]}"

    _ensure_local_nvm

    cd "${srcdir}/${_pkgsrc}"
    npm ci --cache "${srcdir}/npm-cache"
    npm run package:pack-only
}
package() {
    install -Dm755 "${srcdir:?}/${_pkgname}.sh" "${pkgdir:?}/usr/bin/${_pkgname}" 
    install -Dm644 "${srcdir:?}/${_pkgsrc}/release/linux-unpacked/resources/app.asar" -t "${pkgdir:?}/usr/lib/${_pkgname}/"
    for _icons in 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir:?}/${_pkgsrc}/dist/assets/icons/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir:?}/${_pkgname}.desktop" -t "${pkgdir:?}/usr/share/applications/"
    install -Dm644 "${srcdir:?}/${_pkgsrc}/LICENSE" -t "${pkgdir:?}/usr/share/licenses/${pkgname}"
}
