# Maintainer: koyu <me@koyu.space>

pkgname=teams-nativefier
pkgver=1.2.1
pkgrel=1
pkgdesc="Microsoft Teams desktop app built with nativefier (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://teams.microsoft.com"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
)
sha256sums=(
  "cfdf1ca7f6cc9a15e6d815fa31463c3e2a40b0bf3e25de3377a8bf6b8ef4e926"
  "5807fe92daf03c5209040faa40856938c6531886fb8328cd7b262a73b8c4d22b"
)

build() {
  cd "${srcdir}"
  
  nativefier \
    --name "Microsoft Teams" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36" \
    --browserwindow-options '{ "webPreferences": { "spellcheck": true } }' \
    --verbose \
    --single-instance \
    --tray \
    --electron-version 24.2.0 \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls "${srcdir}" | grep "[Mm]icrosoft[-]*[Tt]eams-linux-")
  _binary=$(ls "${srcdir}/${_folder}" | grep "[Mm]icrosoft[-]*[Tt]eams")

  sed -i -e "/loglevel/d" "${srcdir}/${_folder}/resources/app/lib/preload.js"
  cp -rL "${srcdir}/${_folder}" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/teams.png"
  done
}
