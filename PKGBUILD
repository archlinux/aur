# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Conor Anderson <conor@conr.ca>

pkgname=wire-desktop
pkgver=3.29.2997
pkgrel=1
pkgdesc='End-to-end encrypted messenger with file sharing, voice calls and video conferences'
arch=('any')
url='https://wire.com/'
license=('GPL3')
depends=('electron19' 'xdg-utils')
makedepends=('git' 'npm' 'yarn')
optdepends=('emoji-font: colorful emoji')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wireapp/${pkgname}/archive/linux/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::https://github.com/wireapp/${pkgname}/releases/download/linux%2F${pkgver}/${pkgver}.tar.gz.sig"
        "${pkgname}.desktop")
sha256sums=('0b714b661827a73bf91371766b706a049ae8347c9cf3379d50b7f323efaeb47a'
            'SKIP'
            '53f37e99d4c2f41a3e31fd70154d82ba06a4af578c68df86af4906f7f37ec787')
validpgpkeys=('ABBA007D6E14E2DB5B283C45D599C1AA126762B1')

prepare() {
    # Create launcher script
    cat << EOF > "${pkgname}"
#!/usr/bin/env sh

electron19 "/usr/lib/${pkgname}" "\$@"
EOF
}

build() {
    cd "${pkgname}-linux-${pkgver}"

    yarn
    BUILD_NUMBER="${pkgver##*.}" LINUX_TARGET=dir ENABLE_ASAR=false yarn build:linux
}

package() {
    # Place files
    install -d "${pkgdir}/usr/lib/${pkgname}"
    cp -a "${pkgname}-linux-${pkgver}/wrap/dist/linux-unpacked/resources/app/"{electron,node_modules,package.json} "${pkgdir}/usr/lib/${pkgname}"

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
