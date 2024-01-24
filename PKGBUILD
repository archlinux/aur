# Maintainer: koyu <me@koyu.space>

pkgname=amie-nativefier
pkgver=1.1.0
pkgrel=1
pkgdesc="Amie desktop app built with nativefier (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://calendar.amie.so"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
)
sha256sums=(
  "7ac04e015ba0efa3c884900fba02734ffe22ddd72cec87758ea61c0581eb7d9a"
  "efa67f60d02a6f6e7dcc5f3dfb63520099a0801ebb9d9594184754a3178c4481"
)

build() {
  cd "${srcdir}"
  
  nativefier \
    --name "Amie" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --browserwindow-options '{ "webPreferences": { "spellcheck": true } }' \
    --verbose \
    --single-instance \
    --tray \
    --electron-version 24.2.0 \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls "${srcdir}" | grep "[Aa]mie-linux-")
  _binary=$(ls "${srcdir}/${_folder}" | grep "[Aa]mie")

  sed -i -e "/loglevel/d" "${srcdir}/${_folder}/resources/app/lib/preload.js"
  cp -rL "${srcdir}/${_folder}" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/amie.png"
  done
  chmod -R 755 "${pkgdir}/opt/${pkgname}"
}
