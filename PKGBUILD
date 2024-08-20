# Maintainer: Kamil Klubuntu <klubuntu dot dev at gmail dot com>

pkgname=discord-nativefier
pkgver=1.0.0
	pkgrel=1
pkgdesc="Discord built with nativefier, with working share screen audio & Krisp"
arch=("armv7l" "i686" "x86_64")
url="https://github.com/klubuntu/discord-nativefier.git"
app_url="https://discord.com/app"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
  "icon-app.png"
  "${pkgname}.desktop"
)
sha256sums=(
  "79117e2c7881cca6f89fed19689bacef7b283f6e21440bab41016dba5917422d"
  "47da6a369f2653be718213ae533b62f13a0e4f53f1e9e718721ffbd79468bc2b"
)


build() {
  cd "${srcdir}"
  nativefier \
    --name "Discord" \
    --icon "icon-app.png" \
    --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.6478.36 Safari/537.36" \
    --verbose \
    --single-instance \
    --tray \
    "${app_url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _app_dir=$(ls "${srcdir}" | grep "[Dd]iscord-linux-")
  _app_bin=$(ls "${srcdir}/${_app_dir}" | grep "[Dd]iscord")

  mkdir -p "${pkgdir}/opt/${pkgname}"
  user=$(whoami)
  chown -R "$user:$user" "${pkgdir}/opt/${pkgname}"
  cp -rL "${srcdir}/${_app_dir}"/* "${pkgdir}/opt/${pkgname}"
  chmod +x "${pkgdir}/opt/${pkgname}/${_app_bin}"
  ln -s "/opt/${pkgname}/${_app_bin}" "${pkgdir}/usr/bin/discord"
  install -Dm644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/{$pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    magick "${srcdir}/icon-app.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
}
