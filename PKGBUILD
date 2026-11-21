# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: syntheit <daniel@matv.io>

pkgname=tagspaces
pkgver=6.15.1
pkgrel=1
pkgdesc="Offline file organizer and browser with tagging support"
arch=('any')
url="https://www.tagspaces.org"
license=('AGPL-3.0-or-later')
_electron=electron45
depends=('bash' "${_electron}")
makedepends=('gendesk' 'git' 'libxcrypt-compat' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tagspaces/tagspaces/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh")
sha256sums=('0e14967ae94f72c9ded902f5a0edc758bdd7681ac27ce14a595cde5607da7588'
            '3ece307810a9e0acedb73bb422a58233b9d0933ebfd125db6064b5ea4723a60f')

prepare() {
    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name 'TagSpaces' \
        --categories 'Office' \
        --custom StartupWMClass='TagSpaces'
    sed -i "s/@ELECTRON@/${_electron}/" "${pkgname}.sh"

    cd "${pkgname}-${pkgver}"
    sed -i 's/"husky install"/""/' package.json
    sed -i 's/process.resourcesPath/path.dirname(app.getAppPath())/g' src/main/main.ts

    # A key is required in order for the main application to communicate with the web server
    echo "KEY=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 128)" >release/app/.env
}

build() {
    cd "${pkgname}-${pkgver}"
    npm install
    npm run package-linux -- --dir \
        --config.electronDist="/usr/lib/${_electron}" \
        --config.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    install -Dm644 builds/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r builds/linux-unpacked/resources/{app.asar.unpacked,assets} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

    cd "${pkgname}-${pkgver}"
    install -Dm644 assets/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
