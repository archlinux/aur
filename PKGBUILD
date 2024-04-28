# Maintainer: Aleksey Maximov <amaxcz@gmail.com>

pkgname=microsoft-copilot-nativefier
pkgver=1.0.0
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
    --electron-version 30.0.1 \
    "${url}"

    # --tray \
    # --honest \
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls "${srcdir}" | grep "[Mm]icrosoft[-]*[Cc]opilot-linux-")
  _binary=$(ls "${srcdir}/${_folder}" | grep "[Mm]icrosoft[-]*[Cc]opilot")

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
  chmod go+rx "${pkgdir}/opt/${pkgname}/"
}

sha256sums=('0ca8a92593d66e9342f6ffa9680f05e04f3c9a95e07d3d9bb775091576f84d7b'
            '090a6585a459ea607341a524fb811ef5438045b60de5cdde02b078525898821c')
