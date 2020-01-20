# Maintainer: Francisco Guimaraes <francisco at gmail dot com>

pkgname=whatsapp-nativefier-dark
pkgver=0.20200116224810
pkgrel=1
pkgdesc="WhatsApp desktop built with nativefier (electron) using dark theme"
arch=("armv7l" "i686" "x86_64")
url="https://web.whatsapp.com"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
  "${pkgname}-inject.js")
sha256sums=(
  "3899581abcfed9b40b7208bbbca8bdbfe3ae9655980dbf55f04dec9cb3309f27"
  "61f0033b6ac363699620065b18d54b922bc597c243667adafa61f8545839e0ad"
  "ed4727b01f02f6b65285e27a12c239dbc2df42a51f68de7400524d080ba14f10"
)

build() {
  cd "${srcdir}"

  nativefier \
    --name "WhatsApp" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --inject "${pkgname}-inject.js" \
    --verbose \
    --single-instance \
    --tray \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  cp -rL "${srcdir}/whats-app-linux-"* "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/whats-app" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
}
