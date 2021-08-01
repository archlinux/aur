# Maintainer: Mahdy Mirzade <me@mahdym.ir>

pkgname=odysee-nativefier
pkgver=1.0
pkgrel=1
pkgdesc="Odysee.com desktop built with nativefier (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://${pkgname%-nativefier}.com"
license=("GPL-3")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
  "${pkgname}-inject.js"
)
sha256sums=(
  "eb39fb3525bb40278d902ff9afdcec2eea749827095cce3b395bba17d0a4e53d"
  "b23960f67fde24cc0fd853c81db8a806c878c563d45f674961f54ecec08a5e1e"
  "f46bdc1adc9868d13b4f0809667cd5a9b1a6e5e47bc25b570f062d7072d0f942"
)

build() {
  cd "${srcdir}"
  
  nativefier \
    --name "Odysee" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --user-agent "safari" \
    --inject "${pkgname}-inject.js" \
    --browserwindow-options '{ "webPreferences": { "spellcheck": true } }' \
    --verbose \
    --single-instance \
    --tray \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls -l "${srcdir}" | grep "[Oo]dysee-linux-" | awk '{print $9}')
  _binary=$(ls -l "${srcdir}/${_folder}" | grep "[Oo]dysee" | awk '{print $9}')

  sed -i -e "/loglevel/d" "${srcdir}/${_folder}/resources/app/lib/preload.js"
  cp -rL "${srcdir}/${_folder}" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
}
