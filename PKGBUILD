# Maintainer: Conor Anderson <conor@conr.ca>
# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=wire-desktop-beta
_pkgname=${pkgname%-beta}
pkgver=3.6.2885
pkgrel=4
pkgdesc='End-to-end encrypted messenger with file sharing, voice calls and video conferences'
arch=('x86_64')
url='https://wire.com/'
license=('GPL3')
depends=('electron' 'xdg-utils')
makedepends=('git' 'npm' 'yarn')
optdepends=('emoji-font: colorful emoji')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wireapp/${_pkgname}/archive/linux/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::https://github.com/wireapp/${_pkgname}/releases/download/linux%2F${pkgver}/${_pkgname}-linux-${pkgver}.tar.gz.sig"
        "${pkgname}.desktop")
sha256sums=('524db450d41a2dc677b8450cdf4e13dcc753280b2f6565ed5e23e6f59c14bed4'
            'SKIP'
            '35e522978ac21f7aa2f67faa712037d8999482eed1b88953dbea5420a9b13196')
validpgpkeys=('ABBA007D6E14E2DB5B283C45D599C1AA126762B1')

prepare() {
    # Remove "node-addressbook" dependency as it's only for macOS
    sed -i '/node-addressbook/d' "${_pkgname}-linux-${pkgver}/electron/package.json"

    # Create launcher script
    cat << EOF > "${pkgname}"
#!/usr/bin/env sh

electron "/usr/lib/${pkgname}" "\$@"
EOF
}

build() {
    cd "${_pkgname}-linux-${pkgver}"
    yarn
    yarn build:ts
    # **********
    # ***TODO*** in the next release simply use 'linux-prod-package'
    BUILD_NUMBER="${pkgver##*.}" npx grunt 'clean:linux' 'update-keys' 'gitinfo'  'set-custom-data' 'release-internal' 'bundle'
}

package() {
    # Place files
    install -d "${pkgdir}/usr/lib/${pkgname}"
    cp -a "${_pkgname}-linux-${pkgver}/electron/"* "${pkgdir}/usr/lib/${pkgname}"

    # Place launcher script
    install -Dm755 -t "${pkgdir}/usr/bin/" "${pkgname}"

    # Place desktop entry and icon
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
    local res
    for res in 32x32 256x256; do
        install -Dm644 "${_pkgname}-linux-${pkgver}/resources/icons/${res}.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${pkgname}.png"
    done
}

# vim:set ts=4 sw=4 et:
