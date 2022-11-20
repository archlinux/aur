# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>

pkgname=snapchat-nativefier
pkgver=0.1.1
pkgrel=1
pkgdesc="Snapchat web built with nativefier (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://web.${pkgname%-nativefier}.com"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "inkscape" "nodejs-nativefier" "unzip")
source=(
  "https://upload.wikimedia.org/wikipedia/en/c/c4/Snapchat_logo.svg"
  "whatsapp-nativefier-inject.js::https://aur.archlinux.org/cgit/aur.git/plain/whatsapp-nativefier-inject.js?h=whatsapp-nativefier"
  "${pkgname}.desktop"
)
sha256sums=('73b811daaddb6eac1dde7f110850148ca273cb108e4f4cd95ac1d4d1b72eeab2'
            'SKIP'
            '46ff7aa6dbe376cf081411419bd30249e5b6babc50abfa2bde15f4d659a64bf4')

build() {
  cd "${srcdir}"

  inkscape -w 1024 -h 1024 Snapchat_logo.svg -o Snapchat_logo.png
  magick Snapchat_logo.png -resize 194x194 snapchat-nativefier.png

  nativefier \
    --name "Snapchat" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --user-agent "Mozilla/5.0 (X11; Linux $(uname -m)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.167 Safari/537.36" \
    --inject "whatsapp-nativefier-inject.js" \
    --verbose \
    --single-instance \
    --tray \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls "${srcdir}" | grep "[Ss]napchat[-]*linux-")
  _binary=$(ls "${srcdir}/${_folder}" | grep "[Ss]napchat")

  cp -rL "${srcdir}/${_folder}" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    magick convert "${srcdir}/Snapchat_logo.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
}
