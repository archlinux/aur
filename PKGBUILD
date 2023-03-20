# Maintainer: Ruben Kharel <talkto at rubenk dot com dot np>

pkgname=chatgpt-nativefier
pkgver=1.1
pkgrel=1
pkgdesc="ChatGPT desktop built with nativefier (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://chat.openai.com/"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
	"${pkgname}-inject.js"
)
sha256sums=(
	"9c55eca10f08761429d2b7b977c7aafc3c09789a9d1ec945d814d7de9d2b0203"
	"82655f9bff4a43d38234ae0dc8881e98a7773d5c78488db50c3cf84426012dec"
	"9a5703c6a8eafae1933108cbe04e8e829e1c83284323724147d7ca28bf356dd0"
)

build() {
  cd "${srcdir}"

  nativefier \
    --name "ChatGPT" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
		--user-agent "firefox" \
    --verbose \
		--internal-urls "(.*?)(chat.openai.com)" \
    --single-instance \
    --tray \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls "${srcdir}" | grep "[Cc]hat[-]*GPT-linux-")
  _binary=$(ls "${srcdir}/${_folder}" | grep "[Cc]hat[-]*GPT")

  cp -rL "${srcdir}/${_folder}" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
}
