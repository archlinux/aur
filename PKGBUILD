# Maintainer: Aleksey Maximov <amaxcz@gmail.com>

pkgname=microsoft-copilot-nativefier
pkgver=32.1.2
pkgrel=1
pkgdesc="Microsoft Copilot desktop app (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://copilot.microsoft.com"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
)

build() {
  cd "${srcdir}"

  nativefier \
    --name "Microsoft Copilot" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --browserwindow-options '{ "webPreferences": { "spellcheck": true } }' \
    --verbose \
    --single-instance \
    --electron-version "${pkgver}" \
    "${url}"

    # --tray \
    # --honest \
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls "${srcdir}" | grep "[Mm]icrosoft[-]*[Cc]opilot-linux-")
  _binary=$(ls "${srcdir}/${_folder}" | grep "[Mm]icrosoft[-]*[Cc]opilot")

  #sed -i -e "/loglevel/d" "${srcdir}/${_folder}/resources/app/lib/preload.js"
  cp -rL "${srcdir}/${_folder}" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    magick "${srcdir}/${pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
  chmod go+rx "${pkgdir}/opt/${pkgname}/"
}

sha256sums=('013fb8cc232b0a5a14df505f8f7d5ae8366da51bfb52bf4b54e77f6b30a4518c'
            'b33b06b923ef7a9e2f3d64ebcba61f0c5e72c5986ec94c496bbf97ac516ea36a')
