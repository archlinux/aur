# Maintainer: Dee.H.Y <dongfengweixiao AT hotmail DOT com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flclash-bin
_pkgname=FlClash
pkgver=0.8.90
pkgrel=1
pkgdesc="A multi-platform proxy client based on ClashMeta,simple and easy to use, open-source and ad-free."
arch=(
    #'aarch64'
    'x86_64'
)
url="https://github.com/chen08209/FlClash"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'libayatana-appindicator'
    'ayatana-ido'
    'libdbusmenu-glib'
    'libkeybinder3'
)
source=(
  "${pkgname%-bin}.sh"
)
# source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_x86_64=(
  "${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
  "https://gist.githubusercontent.com/dongfengweixiao/bbddee34d6456326200fac3463761296/raw/c18484d78449d0e3b376a6e2a49852486305ff1e/libquickjs_c_bridge_plugin.so.base64"
)
sha256sums=('3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
sha256sums_x86_64=('0ae1320f25d48fbf6980e0dd212b518216bf3b7d6e11180533e11e60a6b1166b'
                   '367033ae3a8bd11f37e398f38c5de0acd8985b62b93b966eb43648fba6bd9094')
# sha256sums_aarch64=('b250a118058cadd5d3dde417f38c439c5d535ae0597a145be235d6cdcbf4e325')
prepare() {
    sed -i -e "
      s/@appname@/${pkgname%-bin}/g
      s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
      s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
      s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
      5i\Categories=Network;
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    base64 -d "${srcdir}/libquickjs_c_bridge_plugin.so.base64" > "${pkgdir}/usr/lib/${pkgname%-bin}/lib/libquickjs_c_bridge_plugin.so"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png"
}