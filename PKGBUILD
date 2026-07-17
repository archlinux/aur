# Maintainer: prettyleaf
# Maintainer: pluralplay

pkgname=flclashx-bin
_pkgname=FlClashX
pkgver=0.4.1
pkgrel=2
pkgdesc="Fork of FlClash | A multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/pluralplay/FlClashX"
license=('GPL-3.0')
conflicts=("${pkgname%-bin}" "flclash-bin" "flclash" "flclashx" "flclashx-git" "flclashx-git-debug")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'libayatana-appindicator'
    'libkeybinder3'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.deb")
sha256sums=('3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
sha256sums_aarch64=('beb8aff9bfaf6efbef9cbcd2d34f51cc2f14f6e86c2ebb8759d6b37fffbf3796')
sha256sums_x86_64=('7a5f2e6dc3af9d84bd231d2d609ef749b9cf529c614e347bcd88db62c99040f5')

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
