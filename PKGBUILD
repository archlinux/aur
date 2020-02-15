# Maintainer: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname='deezer-nativefier'
pkgver='1.0'
pkgrel='4'
pkgdesc='Deezer desktop built with nativefier (Electron)'
arch=('any')
url='https://www.deezer.com/'
license=('custom')
depends=('gtk3' 'libxss' 'nss')
makedepends=('imagemagick' 'nodejs-nativefier')
source=("${pkgname%-nativefier}.png"
        "${pkgname}.desktop")
sha256sums=('557b7ff1d344d75dacc6cd5a61f3361684c16a4de1455f6de7bd233d1aeb5c4e'
            '5c7d70acf97eb4f8392ee9fb3c80cef032dbd8356b09e0c231bf8e5e7bfa7492')

build () {
  nativefier \
    --name "Deezer" \
    --icon "${pkgname%-nativefier}.png" \
    --width "800px" \
    --height "600px" \
    --verbose \
    --single-instance \
    --tray \
    "${url}"
}

package () {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}
    
  cp -rL "${srcdir}/Deezer-linux-"* "${pkgdir}/opt/${pkgname}"
  ln -sfrv "${pkgdir}/opt/${pkgname}/Deezer" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname%-nativefier}.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname%-nativefier}.png"
  done
}
