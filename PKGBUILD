# Maintainer: Conor Anderson <conor@conr.ca>
# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=wire-desktop-beta
_pkgname=${pkgname%-beta}
pkgver=3.12.2916
pkgrel=1
pkgdesc='End-to-end encrypted messenger with file sharing, voice calls and video conferences'
arch=('any')
url='https://wire.com/'
license=('GPL3')
depends=('electron6' 'xdg-utils')
makedepends=('git' 'npm' 'yarn')
optdepends=('emoji-font: colorful emoji')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wireapp/${_pkgname}/archive/linux/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::https://github.com/wireapp/${_pkgname}/releases/download/linux%2F${pkgver}/${_pkgname}-linux-${pkgver}.tar.gz.sig"
        "${pkgname}.desktop")
sha256sums=('2957063edf3784c4c456fe19ef32cfa106ebe3c7b8d211e11702f32ae66b8a3c'
            'SKIP'
            '35e522978ac21f7aa2f67faa712037d8999482eed1b88953dbea5420a9b13196')
validpgpkeys=('ABBA007D6E14E2DB5B283C45D599C1AA126762B1')

prepare() {
    # Create launcher script
    cat << EOF > "${pkgname}"
#!/usr/bin/env sh

electron6 "/usr/lib/${pkgname}" "\$@"
EOF
}

build() {
    cd "${_pkgname}-linux-${pkgver}"

    git init
    git -c user.name='FIXME' -c user.email='FIXME' commit --allow-empty -m "FIXME"

    yarn
    BUILD_NUMBER="${pkgver##*.}" LINUX_TARGET=dir ENABLE_ASAR=false yarn build:linux
}

package() {
    # Place files
    install -d "${pkgdir}/usr/lib/${pkgname}"
    cp -a "${_pkgname}-linux-${pkgver}/wrap/dist/linux-unpacked/resources/app/"{electron,node_modules,package.json} "${pkgdir}/usr/lib/${pkgname}"

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
