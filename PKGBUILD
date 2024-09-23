# Maintainer: Aleksey Maximov <amaxcz@gmail.com>

pkgname=drawio-nativefier
pkgver=32.1.2
pkgrel=1
pkgdesc="draw.io desktop app (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://app.diagrams.net/"
license=("custom")
depends=("gtk3" "libxss" "nss")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
)

build() {
  cd "${srcdir}"

  nativefier \
    --name "draw.io" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --browserwindow-options '{ "webPreferences": { "spellcheck": true } }' \
    --verbose \
    --single-instance \
    --electron-version "${pkgver}" \
    --honest \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls "${srcdir}" | grep "[Dd]raw.io-linux-")
  _binary=$(ls "${srcdir}/${_folder}" | grep "[Dd]raw.io")

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
sha256sums=('a49c867dbed969852f2364c671cd444ef7d5fa74817b4093abb65831c9cb68f3'
            'a5690119de0e28770988c404f801f76fc75f61caf94a8e461225623bec5575b7')
