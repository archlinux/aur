# Maintainer: NobodyDBG <niemandausduisburg@gmx.net>

pkgname=facebook-desktop-app
_pkgname=Facebook-Desktop-App
pkgver=1.0
pkgrel=3
pkgdesc="Facebook Desktop built with nativefier (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://www.facebook.com"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop")
sha256sums=(
  "dad893597cee2d49406c054380f9c338d1838db41083896ded6ccc6f26d8ef6a"
  "cbaf2e041b567660d62fcc9ef92b4ece2f2eba0a392c77acefd845a79a1910d8"
)

build() {
  cd "${srcdir}"
  
  nativefier \
    --name "Facebook-Desktop-App" \
    --icon "${pkgname}.png" \
    --width "1280px" \
    --height "1024px" \
    --verbose \
    --single-instance \
    --tray \
    "https://www.facebook.com"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  cp -rL "${srcdir}/${_pkgname}-linux-x64"* "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
}
