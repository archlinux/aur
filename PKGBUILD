# Maintainer: she11sh0cked <22623152+she11sh0cked@users.noreply.github.com>

pkgname=turntable-nativefier
pkgver=1.0.0
pkgrel=0
pkgdesc="Turntable desktop built with nativefier (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://tt.live"
license=("custom")
depends=("gtk3" "libxss" "nss")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
    "${pkgname}.desktop"
    "${pkgname}.png"
)
sha256sums=(
    "47f624b3ac19f7e6ecc0ea7389b9afd49b58d44e9316df132a356a5db74eeec3"
    "0e0e1328664edb107808311b099a873a071bcde3d322491e3094ba89ab3f78ba"
)

build() {
  cd "${srcdir}"
  
  nativefier \
    --name "Turntable" \
    --icon "${pkgname}.png" \
    --widevine \
    -e "13.2.3" \
    --verbose \
    --single-instance \
    --tray \
    "$url"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls "${srcdir}" | grep "[Tt]urntable-linux-")
  _binary=$(ls "${srcdir}/${_folder}" | grep "[Tt]urntable")

  cp -rL "${srcdir}/${_folder}" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
}