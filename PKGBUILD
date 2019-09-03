# Maintainer: Huy Duong <qhuyduong at hotmail dot com>

pkgname=zalo-nativefier
pkgver=0.1.1
pkgrel=2
pkgdesc="Zalo desktop built with nativefier (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://chat.${pkgname%-nativefier}.me"
license=("custom")
depends=("gtk3" "libxss" "nss")
makedepends=("imagemagick" "nodejs-nativefier")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop")

build() {
  cd "${srcdir}"
  
  nativefier \
    --name "Zalo" \
    --icon "${pkgname}.png" \
    --verbose \
    --single-instance \
    --tray \
    --internal-urls ".*zalo.*" \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  cp -rL "${srcdir}/zalo-linux-"* "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/zalo" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
}
md5sums=('5c773fc7033090839aa5a2a1d09f2773'
         'ac0b946b80fafd826eed8ec2c4c4e4a3')
