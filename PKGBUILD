# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: syntheit <daniel@matv.io>

pkgname=tagspaces
pkgver=6.7.1
pkgrel=1
pkgdesc="Offline file organizer and browser with tagging support"
arch=('x86_64')
url="https://www.tagspaces.org"
license=('AGPL-3.0-or-later')
_electron=electron37
depends=('bash' "${_electron}" 'gcc-libs' 'glibc')
makedepends=('gendesk' 'git' 'nvm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tagspaces/tagspaces/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh")
sha256sums=('8637bc746f6a2d24bbe7df6ee974d413ac26ade6cf1a342ead94b2cd93c1ff20'
            '3ece307810a9e0acedb73bb422a58233b9d0933ebfd125db6064b5ea4723a60f')

prepare() {
    source /usr/share/nvm/init-nvm.sh
    nvm install 22

    cd "${pkgname}-${pkgver}"
    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name 'TagSpaces' \
        --categories 'Office' \
        --custom StartupWMClass='TagSpaces'

    sed "s/@ELECTRON@/${_electron}/" -i "${srcdir}/${pkgname}.sh"

    # Skip husky
    mkdir -p .git
    npm run skip:husky:pre-commit

    # A key is required in order for the main application to communicate with the web server
    echo "KEY=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 128)" > release/app/.env

    npm install
    npm run install-ext-node-linux
}

build() {
    cd "${pkgname}-${pkgver}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    npx ts-node ./.erb/scripts/clean.js
    npm run build
    npm run clean-maps
    npx electron-builder --linux --dir --config resources/builder.json \
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
