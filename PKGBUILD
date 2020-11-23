# Maintainer: NobodyDBG <niemandausduisburg@gmx.net>

pkgname=db-web-bahnhofstafel
_pkgname=DB-Web-Bahnhofstafel
pkgver=1.0
pkgrel=1
pkgdesc="DB Bahnhofstafel Desktop built with nativefier (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://www.facebook.com"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
  "https://fahrweg.dbnetze.com/resource/blob/1359908/f9d782b88f2c1224ac1192e2d4b5f6ff/betriebsstellen-data.pdf") #Operating point table
sha256sums=(
  "43acca31f22d3a49c02d14565b6ac3933018f6b812e6368f2a37bc8e37cfc688"
  "67fdbc93135c1af00cd1b65ac582923089fefb24413d5d8d23fbc356877eee88"
  "fcfc436cfe50f1ca6d1f2082ef3ccdf2d1ab7df560164fee301f144dd81ea6a5"
)

build() {
  cd "${srcdir}"
  
  echo "Please input operation point. You can find it in the betriebsstellen-data.pdf inside the folder."
  read varname
  
  echo "create App"
  nativefier \
    --name "DB-Web-Bahnhofstafel" \
    --icon "${pkgname}.png" \
    --width "1280px" \
    --height "1024px" \
    --verbose \
    --single-instance \
    --tray \
    "https://iris.noncd.db.de/wbt/js/index.html?bhf=$varname"
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
