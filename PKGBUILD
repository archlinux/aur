# Maintainer: NobodyDBG <niemandausduisburg@gmx.net>

pkgname=vrr-app
pkgver=1.0
pkgrel=4
pkgdesc="VRR Fahrplanauskunft built with nativefier (electron)"
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
  "ce248a8392a7a7c75edc50362aec103d5f98051d0567e57170c606d41cf67ec2"
  "93be29e1faab23c478eb9dabeee3dceda920f8dcb11c055e364985bfa5eae6c7"
)

build() {
  cd "${srcdir}"
  
  nativefier \
    --name "VRR-App" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --verbose \
    --single-instance \
    --tray \
    "http://efa.vrr.de/vrr/XSLT_TRIP_REQUEST2?language=de&itdLPxx_transpCompany=vrr"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  cp -rL "${srcdir}/VRR-App-linux-x64"* "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/VRR-App" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
}
