# Maintainer: Aleksey Maximov <amaxcz@gmail.com>

pkgname=microsoft-office-365-nativefier
pkgver=32.1.2
pkgrel=1
pkgdesc="Microsoft Office 365 desktop app (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://www.office.com"
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
    --name "Microsoft Office 365" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --browserwindow-options '{ "webPreferences": { "spellcheck": true } }' \
    --verbose \
    --single-instance \
    --electron-version "${pkgver}" \
    --tray \
    "${url}"

    # --honest \
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls "${srcdir}" | grep "[Mm]icrosoft[-]*[Oo]ffice[-]*365-linux-")
  _binary=$(ls "${srcdir}/${_folder}" | grep "[Mm]icrosoft[-]*[Oo]ffice[-]*365")

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
sha256sums=('a3385816f211739f798e1361b4b246a8e17a3bea08930e46a73adba9f3d6a629'
            'b53f2441b4759fb6921bd79ccd2b4b69adc276d72a3e1846da64858cdb03926e')
