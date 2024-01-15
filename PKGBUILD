# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=batch-explorer-bin
_pkgname=BatchExplorer
pkgver=2.20.0_stable.966
_electronversion=26
pkgrel=1
pkgdesc="A client tool to help create, debug and monitor Azure Batch Applications"
arch=("x86_64")
url="https://azure.github.io/BatchExplorer/"
_ghurl="https://github.com/Azure/BatchExplorer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'nspr'
    'libxfixes'
    'libxcb'
    'alsa-lib'
    'at-spi2-core'
    'readline'
    'libxshmfence'
    'libdrm'
    'hicolor-icon-theme'
    'pango'
    'cairo'
    'gtk3'
    'gdk-pixbuf2'
    'libxkbcommon'
    'util-linux-libs'
    'expat'
    'libcups'
    'libxext'
    'libxrandr'
    'bzip2'
    'openssl-1.1'
    'mesa'
    'libx11'
    'nss'
    'libxcomposite'
    'xz'
    'libxdamage'
    'python'
    'libsecret'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Azure/BatchExplorer/v${pkgver//_/-}/LICENSE"
)
sha256sums=('2d4a1b57f8c3d83e47233f533d71340aeaac11c3e03be0beea0fd6a49c7acb60'
            '0b9ebab8a849f3ae8ed5bd7a35022bff9dce901efeeb53e855e91c02c8500ab0')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin} --no-sandbox %U|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}