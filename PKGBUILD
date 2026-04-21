# Maintainer:
# Contributor: Rooki <aur at rooki dot xyz>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: lsf
# Contributor: Daniel Haß <aur@hass.onl>

pkgname=standardnotes
pkgver=3.201.21
pkgrel=1
pkgdesc="Think fearlessly with end-to-end encrypted notes and files"
arch=('x86_64')
url="https://standardnotes.com"
license=('AGPL-3.0-or-later')
_electron=electron35
depends=('bash' "${_electron}" 'glibc' 'hicolor-icon-theme' 'libstdc++' 'nodejs' 'python')
makedepends=('python-setuptools' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/standardnotes/app/archive/tags/@standardnotes/desktop@${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('a829b21f4fa95569c2dc2725db58a32bae05a31c8ceac0647399b3d9c67293d2'
            'b990343f6d187f3997129a7e2d5892fb2cb7a942a8040f9be2b8887ad5150215'
            '6dc53fdd5d597acd1bcc1bfe7ecc6458291fb53c5b1a4d2ece12e0dbfa8b41a2')

prepare() {
    sed -i "s|@ELECTRON@|${_electron}|" "${pkgname}.sh"
}

build() {
    cd "app-tags-${pkgname}-desktop-${pkgver}/packages/desktop"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    yarn install --immutable
    yarn rebuild:home-server
    yarn build:desktop
    yarn run webpack --config desktop.webpack.prod.js
    yarn run electron-builder --linux \
        --config.linux.target=dir \
        --config.extraMetadata.version="${pkgver}" \
        --config.electronDist="/usr/lib/${_electron}" \
        --config.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "app-tags-${pkgname}-desktop-${pkgver}/packages/desktop"
    install -Dm644 dist/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r dist/linux-unpacked/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    for size in 16x16 32x32 128x128 256x256 512x512; do
        install -Dm644 "build/icon.iconset/icon_${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
        install -Dm644 "build/icon.iconset/icon_${size}@2x.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}@2x/apps/${pkgname}.png"
    done
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
