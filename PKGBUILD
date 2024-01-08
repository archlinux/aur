# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=nexus_wallet
pkgname="${_pkgname//_/-}-bin"
_appname="Nexus Wallet"
pkgver=3.1.2
pkgrel=1
pkgdesc="The official Logical and Interface layers of the Nexus Software Stack."
arch=('x86_64')
url="https://crypto.nexus.io/wallet"
_ghurl="https://github.com/Nexusoft/NexusInterface"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'libcups'
    'gtk3'
    'libxrandr'
    'libx11'
    'mesa'
    'cairo'
    'nspr'
    'expat'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'at-spi2-core'
    'libdrm'
    'libxfixes'
    'pango'
    'libxkbcommon'
    'nss'
    'libxcb'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-Linux-${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Nexusoft/NexusInterface/v${pkgver}/LICENSE"
)
sha256sums=('bab72f31af814ea3b0d803d74034eb44cadbae452f7e4eb7ebbfbf709300ac10'
            'e7ee68282295100c6be4565152cb535d43086d2354760a8f006f1e980e0a3bb5')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${_pkgname}\"|${pkgname%-bin} --no-sandbox|g;s|P2P|Network|g;s|${_pkgname}|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_appname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}