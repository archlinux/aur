# Maintainer: Francisco Guimaraes <francisco at gmail dot com>

pkgname=whatsapp-nativefier-dark
pkgver=0.20200221002211
pkgrel=4
pkgdesc="WhatsApp desktop built with nativefier (electron) using dark theme"
arch=("armv7l" "i686" "x86_64")
url="https://web.whatsapp.com"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "yarn")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
  "${pkgname}-inject.js")
sha256sums=(
  "f79228902c35740ba202fc74494b3fa851911e466955298b231d7fcfebc63b37"
  "12b72fd82fff48dc8c5a08f7bc070259b9929cf408bf6738133a08508e4d3d09"
  "75bfb9191f68551cdcf9a48871ed69edbab4a503ccde25609123552e9095c0c7"
)
iconsha256sum=${sha256sums[0]}
tmpdesktopfile="/tmp/whatsapp-nativefier-dark.desktop"

build() {
  yarn
  cd "${srcdir}"

  ../node_modules/.bin/nativefier \
    --name "WhatsApp" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --background-color "#1f232a" \
    --inject "${pkgname}-inject.js" \
    --verbose \
    --single-instance \
    --tray \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  cp -rL "${srcdir}/WhatsApp-linux-"* "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/WhatsApp" "${pkgdir}/usr/bin/${pkgname}"
  sed "s/Icon=whatsapp-nativefier-dark/Icon=${iconsha256sum}/g" "${srcdir}/${pkgname}.desktop" > "${tmpdesktopfile}"

  install -Dm644 "${tmpdesktopfile}" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${iconsha256sum}.png"
  done
}
