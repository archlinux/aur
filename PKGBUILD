# Maintainer: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname='twitter-nativefier'
pkgver='1.0'
pkgrel='2'
pkgdesc='Twitter desktop built with nativefier (Electron)'
arch=('any')
url='https://twitter.com/'
license=('custom')
depends=('gtk3' 'libxss' 'nss')
makedepends=('imagemagick' 'nodejs-nativefier')
source=("${pkgname%-nativefier}.png"
        "${pkgname}.desktop")
sha256sums=('4ef3b2ed1c74f1a842a9cd51a4b8f58a1920a38f6858891821c85b36e81d2b49'
            'ffd1c6478e85b992ea2fdf4fe0d1c4d14bf846bd7dacf5f0bda7eefccb4963b7')

build () {
  nativefier \
    --name "Twitter" \
    --icon "${pkgname%-nativefier}.png" \
    --width "800px" \
    --height "600px" \
    --verbose \
    --single-instance \
    "${url}"
}

package () {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  cp -rL "${srcdir}/Twitter-linux-"* "${pkgdir}/opt/${pkgname}"
  ln -sfrv "${pkgdir}/opt/${pkgname}/Twitter" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname%-nativefier}.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname%-nativefier}.png"
  done
}
