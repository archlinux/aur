# Maintainer: Aleksey Maximov <amaxcz@gmail.com>

pkgname=google-gemini-nativefier
pkgver=1.0.0
pkgrel=2
pkgdesc="Google Gemini desktop app (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://gemini.google.com"
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
    --name "Gemini" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --browserwindow-options '{ "webPreferences": { "spellcheck": true } }' \
    --verbose \
    --single-instance \
    --electron-version 30.0.1 \
    --honest \
    "${url}"

    # --tray \
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls "${srcdir}" | grep "[Gg]emini-linux-")
  _binary=$(ls "${srcdir}/${_folder}" | grep "[Gg]emini")

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
sha256sums=('237b11a0d250c1560f9edbaf9d21fdc3b335ddf194aaf7544f5b49495a161635'
            'b9f5e2bbc53542f37a33be2c728462c59f87ecf4f2a19a901f26a7dc2310d586')
