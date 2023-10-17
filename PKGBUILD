# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nvm-desktop
pkgver=2.3.0
_nvmdver=2.2.0
pkgrel=1
pkgdesc="A version management desktop client for the Nodejs."
arch=('x86_64')
url="https://github.com/1111mp/nvm-desktop"
license=('MIT')
conflicts=("${pkgname}")
depends=('nss' 'cairo' 'gcc-libs' 'libxcb' 'libxrandr' 'gtk3' 'dbus' 'expat' 'libdrm' 'mesa' 'libxcomposite' 'pango' 'at-spi2-core' 'libxext' \
    'libxkbcommon' 'nspr' 'alsa-lib' 'hicolor-icon-theme' 'glibc' 'libcups' 'libxdamage' 'libxfixes' 'libx11' 'glib2')
makedepends=('gendesk' 'npm>=7' 'nodejs>=14' 'yarn' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "nvmd-${_nvmdver}.zip::https://github.com/1111mp/nvmd-command/releases/download/v${_nvmdver}/Linux.zip")
sha256sums=('c57951ab6528e1509e42f165003acaddd8e28e1551b4d61dcaf5af5b3f0be80c'
            'e4c50f228d42cae55e83eda6ccbeac716eadad3ab96e28c68352b7d13d8f265b')
build() {
    gendesk -f -n -q --categories "Development;Utility" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn install
    yarn package
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/build/linux-unpacked/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/Linux/nvmd" -t "${pkgdir}/opt/${pkgname}/resources/assets/sources"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}