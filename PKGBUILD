# Maintainer: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Conor Anderson <conor@conr.ca>

pkgname=wire-desktop
pkgver=3.30.3018
pkgrel=1
pkgdesc='End-to-end encrypted messenger with file sharing, voice calls and video conferences'
arch=('any')
url='https://wire.com/'
license=('GPL3')
depends=('electron' 'xdg-utils')
makedepends=('git' 'npm' 'yarn' 'nodejs-lts-gallium')
optdepends=('emoji-font: colorful emoji')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wireapp/${pkgname}/archive/linux/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::https://github.com/wireapp/${pkgname}/releases/download/linux%2F${pkgver}/${pkgver}.tar.gz.sig"
        "${pkgname}.desktop")
b2sums=('808b386961285cc2b71d58db579815233224403ae33e1bdb2636b00fdf60c400e79e030916ca2aad50565ea3184e8654f80ce6c6b809d69e5313e13b09c76e6f'
        'SKIP'
        '63ec6be507993c3bfffbae86841a9f34151ef8ba9249f32dd3fa758921e1adbcaa22c59e575e8079edb796a64395e26da311302658b62c3819fd6c7946b357c0')
validpgpkeys=('ABBA007D6E14E2DB5B283C45D599C1AA126762B1')

prepare() {
    # Create launcher script
    cat << EOF > "${pkgname}"
#!/usr/bin/env sh

electron20 "/usr/lib/${pkgname}" "\$@"
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
