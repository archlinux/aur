# Maintainer: Adek Maulana <adek at techdro dot id>

pkgname=tidal-nativefier
pkgver=1.0.1217
pkgrel=1
pkgdesc="TIDAL desktop built with nativefier (electron) with widevine support"
arch=("armv7l" "i686" "x86_64")
url="https://listen.${pkgname%-nativefier}.com"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
)
sha256sums=(
  "eaab216b19013f8a47fcd32d1277e2392b1d8cdaf00f7f61249bd361eefd530b"
  "15baa142a1b230646c1a6a7df38a2664d55a6d6e9de6712d764db569e853430d"
)

build() {
  cd "${srcdir}"
  
  nativefier \
    --name "TIDAL" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --verbose \
    --single-instance \
    --tray \
    --widevine \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls -l "${srcdir}" | grep "TIDAL-linux-" | awk '{print $9}')
  _binary=$(ls -l "${srcdir}/${_folder}" | grep "TIDAL" | awk '{print $9}')

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
