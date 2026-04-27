# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: syntheit <daniel@matv.io>

pkgname=tagspaces
pkgver=6.11.2
pkgrel=1
pkgdesc="Offline file organizer and browser with tagging support"
arch=('any')
url="https://www.tagspaces.org"
license=('AGPL-3.0-or-later')
_electron=electron39
depends=('bash' "${_electron}")
makedepends=('gendesk' 'git'  'libxcrypt-compat' 'nvm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tagspaces/tagspaces/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh")
sha256sums=('acf0f0d3a31492667b8656ee02e1100469f9f66583a6c0129eafb5953d2385c5'
            '3ece307810a9e0acedb73bb422a58233b9d0933ebfd125db6064b5ea4723a60f')

_ensure_local_nvm() {
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
    _ensure_local_nvm

    cd "${pkgname}-${pkgver}"
    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name 'TagSpaces' \
        --categories 'Office' \
        --custom StartupWMClass='TagSpaces'

    sed "s/@ELECTRON@/${_electron}/" -i "${srcdir}/${pkgname}.sh"
    sed 's/"husky install"/""/' -i package.json

    # A key is required in order for the main application to communicate with the web server
    echo "KEY=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 128)" >release/app/.env

    nvm install 22
}

build() {
    _ensure_local_nvm

    cd "${pkgname}-${pkgver}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    npm install
    npm run package-linux -- \
        -c.electronDist="/usr/lib/${_electron}" \
        -c.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 ../builds/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r ../builds/linux-unpacked/resources/{app.asar.unpacked,assets} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 assets/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
