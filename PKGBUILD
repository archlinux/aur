# Maintainer: Alexander JAcocks <alexander@redhat.com>

pkgname=ebay-nativefier
pkgver=1.0
pkgrel=1
pkgdesc="eBay desktop built with nativefier (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://${pkgname%-nativefier}.com"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
  "${pkgname}-inject.js"
)
sha256sums=('2f30de271bd1a4bf30a78a27bb3ee4157c4d85858d9387736e4b94fb661581c3'
            '81a830762d02021e80dd2978bdc01bd9c2ec02ab16709827fae2feadca39250b'
            '22ba360d698d9bb8257e91e7360aa0cf669e7e58a512e9b7aa0ee4b0504563d8')

build() {
  cd "${srcdir}"

  nativefier \
    --name "eBay" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Chrome/116.0.5845.172 Safari/605.1.15" \
    --inject "${pkgname}-inject.js" \
    --verbose \
    --single-instance \
    --tray \
    "${url}"
}

package() {

  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}
  

  _folder=$(ls "${srcdir}" | grep "[Ee][Bb]ay-linux-")
  _binary=$(ls "${srcdir}/${_folder}" | grep "[Ee][Bb]ay")

  cp -rL "${srcdir}/${_folder}" "${pkgdir}/opt/${pkgname}"
  chmod 0755 "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
}
