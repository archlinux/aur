# Maintainer: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Conor Anderson <conor@conr.ca>

_electron=electron22
pkgname=wire-desktop
pkgver=3.31.3060
pkgrel=2
pkgdesc='End-to-end encrypted messenger with file sharing, voice calls and video conferences'
arch=('any')
url='https://wire.com/'
license=('GPL3')
depends=("${_electron}" 'xdg-utils')
makedepends=('git' 'npm' 'yarn' 'nodejs-lts-gallium')
optdepends=('emoji-font: colorful emoji')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wireapp/${pkgname}/archive/linux/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::https://github.com/wireapp/${pkgname}/releases/download/linux%2F${pkgver}/${pkgver}.tar.gz.sig"
        "${pkgname}.desktop")
b2sums=('104090ef41e5f8de46e80500e5c95a5edd077392b60ffc7642e5d212b94da5c2b91ea0d9e5a4d18e7e4b2b0b5a5b98bccb2c2a9b5212692aeabd2b9cf02420e4'
        'SKIP'
        '63ec6be507993c3bfffbae86841a9f34151ef8ba9249f32dd3fa758921e1adbcaa22c59e575e8079edb796a64395e26da311302658b62c3819fd6c7946b357c0')
validpgpkeys=('ABBA007D6E14E2DB5B283C45D599C1AA126762B1')

prepare() {
    # Create launcher script
    cat << EOF > "${pkgname}"
#!/usr/bin/env sh

${_electron} "/usr/lib/${pkgname}" "\$@"
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
