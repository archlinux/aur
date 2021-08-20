# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=radio-garden
pkgver=1.0
pkgrel=1
pkgdesc="Thousands of live radio stations across the globe. Built with nativefier (electron)"
arch=("armv7l" "i686" "x86_64")
url="http://${pkgname/-/.}"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
)
sha256sums=(
  "e7b04bc6e758274ed1751664bb448deec4e99cb36c228946656539131a15aeb4"
  "547f4d2a9aed560ea3b9e8181b2007a2b03fba23e6e647bb18bfee567ab18e9a"
)

build() {
  cd "${srcdir}"
  
  nativefier \
    --name "RadioGarden" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --verbose \
    --single-instance \
    --tray \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls -l "${srcdir}" | grep "[Rr]adio[-]*[Gg]arden-linux-" | awk '{print $9}')
  _binary=$(ls -l "${srcdir}/${_folder}" | grep "[Rr]adio[-]*[Gg]arden" | awk '{print $9}')

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
