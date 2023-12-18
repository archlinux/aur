# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zyplayer-bin
pkgver=3.3.1
pkgrel=1
pkgdesc="跨平台桌面端视频资源播放器,免费高颜值"
arch=(
    "aarch"
    "x86_64"
)
url="https://github.com/Hiram-Wong/ZyPlayer"
license=("MIT")
provides=("${pkgname%-bin}-${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "zy-player"
)
depends=(
    'libcups'
    'libxcomposite'
    'nss'
    'nspr'
    'libxext'
    'pango'
    'libxdamage'
    'libxcb'
    'libxkbcommon'
    'libxfixes'
    'libx11'
    'libxrandr'
    'expat'
    'alsa-lib'
    'libdrm'
    'mesa'
    'gtk3'
    'at-spi2-core'
    'cairo'
    'hicolor-icon-theme'
    'java-runtime'
)
source_aarch=("${pkgname%-bin}-${pkgver}-aarch.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Hiram-Wong/ZyPlayer/v${pkgver}/LICENSE"
)
sha256sums=('84378c42abc60e52c641be1d9d3b5b74e587adbfce6a1be75276524120055edd')
sha256sums_aarch=('c102042caa3fc65a121184e63a42578e27ee21512f29ca08ca82d1aec629083f')
sha256sums_x86_64=('ca42a049f66cabb9b14d0cfc796f47f2a62918faaa78270400ea2649ebebcb17')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin} --no-sandbox|g;s|Utility|AudioVideo|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}