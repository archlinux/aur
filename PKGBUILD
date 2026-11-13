# Maintainer: prettyleaf
# Maintainer: pluralplay

pkgname=flclashx-bin
_pkgname=FlClashX
pkgver=0.5.3
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
# The Helper refuses a Core whose SHA-256 differs from manifest.json, and
# strip or a split debug link changes it.
options=('!strip' '!debug')
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.deb")
sha256sums=('3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
sha256sums_aarch64=('027d31dac940c94557dc5cdbc37742607933dbeaea9a52d54c99d61cb7c89df1')
sha256sums_x86_64=('1ecde8c31460caf6a5af81ba5c7c141728082f7ca6551e3a04ab274fdae67822')

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
