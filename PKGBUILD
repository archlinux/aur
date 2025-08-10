# Maintainer: Aleksey Maximov <amaxcz@gmail.com>

pkgname=openai-chatgpt-nativefier
pkgver=37.2.6
pkgrel=1
pkgdesc="OpnenAI ChatGPT desktop app (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://chatgpt.com/"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
  "chatgpt-autocleaner.js"
)

build() {
  cd "${srcdir}"

  nativefier \
    --name "ChatGPT" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --inject "chatgpt-autocleaner.js" \
    --browserwindow-options '{ "webPreferences": { "spellcheck": true } }' \
    --verbose \
    --single-instance \
    --electron-version "${pkgver}" \
    --honest \
    --internal-urls "(.*?\\.google\\.com.*?|.*?\\.chatgpt\\.com.*?|.*?\\.openai\\.com.*?|.*?\\.oaistatic\\.com.*?)" \
    "${url}"

    #--tray \
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls "${srcdir}" | grep "[Cc]hatGPT-linux-")
  _binary=$(ls "${srcdir}/${_folder}" | grep "[Cc]hatGPT")

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
sha256sums=('9c55eca10f08761429d2b7b977c7aafc3c09789a9d1ec945d814d7de9d2b0203'
            '04ed8323dbdf9f2c4741fa05f171e2016feb9c51a5ca52917ab05785b71608f7'
            '4484d72dc9143d5bd6b221d6ab01bc4c228205f1439b59f59c8246665913b72d')
