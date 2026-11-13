# Maintainer: prettyleaf
# Maintainer: pluralplay

pkgname=flclashx-bin
_pkgname=FlClashX
pkgver=0.5.1
pkgrel=1
pkgdesc="Fork of FlClash | A multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/pluralplay/FlClashX"
license=('GPL-3.0')
conflicts=("${pkgname%-bin}" "flclash-bin" "flclash" "flclashx")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'libayatana-appindicator'
    'libkeybinder3'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.deb")
sha256sums=('3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
sha256sums_aarch64=('6a305e06453820febea0b5fa0dfd34f9d5c8ea3109c23c4c913ea5c21c233d59')
sha256sums_x86_64=('74a93a37d950d889c438f5ee5eb1990f966e71a76781dcde0cca5f80450d8c6a')

prepare() {
    sed -i -e "
      s/@appname@/${pkgname%-bin}/g
      s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    # .deb ships the entry under its reverse-DNS name with an absolute Exec into
    # /opt; repoint it at the packaged wrapper. Categories is already present.
    sed -i -e "
      s|^Exec=.*|Exec=${pkgname%-bin}|
      s|^Icon=.*|Icon=${pkgname%-bin}|
    " "${srcdir}/usr/share/applications/com.follow.clashx.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -dm755 "${pkgdir}/usr/lib/${pkgname%-bin}"
    # App bundle lives under /opt in the .deb, not /usr/share.
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/com.follow.clashx.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    # .deb ships only the 256x256 icon.
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png"
}
