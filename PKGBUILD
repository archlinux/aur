# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=batch-explorer-bin
_pkgname=BatchExplorer
pkgver=2.21.0_stable.1069
_electronversion=29
pkgrel=1
pkgdesc="A client tool to help create, debug and monitor Azure Batch Applications.(Prebuilt version)"
arch=("x86_64")
url="https://azure.github.io/BatchExplorer/"
_ghurl="https://github.com/Azure/BatchExplorer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'nspr'
    'alsa-lib'
    'gtk3'
    'nss'
    'python>=3'
    'libsecret'
    'openssl-1.1'
    'nodejs'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-${pkgver//_/-}.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Azure/BatchExplorer/v${pkgver//_/-}/LICENSE"
)
sha256sums=('0c3c0e70d3597e4d22a34b4918878f767000333960be24e56d15c5be8c7da522'
            '0b9ebab8a849f3ae8ed5bd7a35022bff9dce901efeeb53e855e91c02c8500ab0')
build() {
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
