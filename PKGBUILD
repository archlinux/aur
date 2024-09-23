# Maintainer: Aleksey Maximov <amaxcz@gmail.com>

pkgname=anthropic-claude-nativefier
pkgver=32.1.2
pkgrel=1
pkgdesc="Anthropic Claude desktop app (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://claude.ai/"
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
    --name "claude" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --browserwindow-options '{ "webPreferences": { "spellcheck": true } }' \
    --verbose \
    --single-instance \
    --electron-version "${pkgver}" \
    --honest \
    "${url}"

    #--tray \
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls "${srcdir}" | grep "[Cc]laude-linux-")
  _binary=$(ls "${srcdir}/${_folder}" | grep "[Cc]laude")

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
sha256sums=('8da55751e40d70b8f0bd663879f0b187be57724f42fe822f55b14ee6a5470eec'
            '5532a3a04d6510eda645d178bbf2bb8cd63791857f64c01dc1dd308971df422d')
