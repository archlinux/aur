# Maintainer: koyu <me@koyu.space>

pkgname=servbyte-desktop
pkgver=1.0.0
pkgrel=2
pkgdesc="ServByte desktop application"
arch=("armv7l" "i686" "x86_64")
url="https://developer.servbyte.eu/auth/login"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
)
sha256sums=(
  "f23358c9ea7b4bb151ade5e33702ddf14af8028134c36dd10d57f9f91d4dffff"
  "c02d53a804b6a38801a2d0fd92e4564381c92d4324070275b44e4f74102e2322"
)

build() {
  cd "${srcdir}"
  
  nativefier \
    --name "ServByte" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36" \
    --browserwindow-options '{ "webPreferences": { "spellcheck": true } }' \
    --verbose \
    --single-instance \
    --tray \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls "${srcdir}" | grep "[Ss]erv[Bb]yte[-]*-linux-")
  _binary=$(ls "${srcdir}/${_folder}" | grep "[Ss]erv[Bb]yte[-]*")

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
