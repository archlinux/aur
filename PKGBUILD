# Maintainer: Cambionn <cambionn.anon+archlinux at proton dot me>

pkgname=astiga-nativefier
pkgver=1.0.1
pkgrel=1
pkgdesc="Astiga desktop built with nativefier (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://asti.ga"
license=('MIT')
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
  "LICENSE"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
)

build() {
  cd "${srcdir}"
  
  nativefier \
    --name "Astiga" \
    --icon "${pkgname}.png" \
    --single-instance \
    --tray \
    --maximize \
    --disable-dev-tools \
    "https://play.asti.ga/"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/applications}}

  #install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  #get folder & binary from nativefier build
  _folder=$(ls -l "${srcdir}" | grep "[Aa]stiga-linux-" | awk '{print $9}')
  _binary=$(ls -l "${srcdir}/${_folder}" | grep "[Aa]stiga" | awk '{print $9}')
  
  sed -i -e "/loglevel/d" "${srcdir}/${_folder}/resources/app/lib/preload.js"
  
  cp -rL "${srcdir}/${_folder}" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
  
  #install application
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  #create icons
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
}
