# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Conor Anderson <conor@conr.ca>

pkgname=wire-desktop
pkgver=3.7.2891
pkgrel=1
pkgdesc='End-to-end encrypted messenger with file sharing, voice calls and video conferences'
arch=('x86_64')
url='https://wire.com/'
license=('GPL3')
depends=('electron' 'xdg-utils')
makedepends=('git' 'npm' 'yarn')
optdepends=('emoji-font: colorful emoji')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wireapp/${pkgname}/archive/linux/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::https://github.com/wireapp/${pkgname}/releases/download/linux%2F${pkgver}/${pkgname}-linux-${pkgver}.tar.gz.sig"
        "${pkgname}.desktop")
sha256sums=('162ebb6c8642edfd74fc02b494dbea912b727fadc91db93c137ee35e0e81dba5'
            'SKIP'
            '53f37e99d4c2f41a3e31fd70154d82ba06a4af578c68df86af4906f7f37ec787')
validpgpkeys=('ABBA007D6E14E2DB5B283C45D599C1AA126762B1')

prepare() {
    # Remove "node-addressbook" dependency as it's only for macOS
    sed -i '/node-addressbook/d' "${pkgname}-linux-${pkgver}/electron/package.json"

    # Create launcher script
    cat << EOF > "${pkgname}"
#!/usr/bin/env sh

electron "/usr/lib/${pkgname}" "\$@"
EOF
}

build() {
    cd "${pkgname}-linux-${pkgver}"
    yarn
    yarn build:ts
    BUILD_NUMBER="${pkgver##*.}" npx grunt 'linux-prod-package'
}

package() {
    # Place files
    install -d "${pkgdir}/usr/lib/${pkgname}"
    cp -a "${pkgname}-linux-${pkgver}/electron/"* "${pkgdir}/usr/lib/${pkgname}"

    # Place launcher script
    install -Dm755 -t "${pkgdir}/usr/bin/" "${pkgname}"

    # Place desktop entry and icon
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
    local res
    for res in 32x32 256x256; do
        install -Dm644 "${pkgname}-linux-${pkgver}/resources/icons/${res}.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${pkgname}.png"
    done
}

# vim:set ts=4 sw=4 et:
