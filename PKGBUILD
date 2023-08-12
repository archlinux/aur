# Maintainer: uint2048_t

pkgname=messages-nativefier
pkgver=1.0
pkgrel=1
pkgdesc="Google Messages Nativefier app"
arch=(x86_64)
url="https://messages.google.com/web"
license=(GPL3)
depends=("gtk3" "libxss" "nss")
makedepends=("imagemagick" "nodejs-nativefier")

source=("${pkgname}.desktop" "${pkgname}.png")
sha256sums=("3502b67a2abdaa5a0bbbd271cf8fdcf251658b10361a6ff59a2fc0dd80e778d5"
	    "54da790dd6966fc069373671071b187cda799fd5bf377a0aaa60add69f3d186f")

build() {
  cd "${srcdir}"
  nativefier \
    --name "Messages" \
    --icon "${pkgname}.png" \
    --single-instance \
    --background-color "#2A2E32" \
    --disable-dev-tools \
    --disable-context-menu \
    --internal-urls ".*messages.google.com.*" \
    "https://messages.google.com/web"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/share/applications,usr/bin}
  cp -rL "${srcdir}/Messages-linux"* "${pkgdir}/opt/${pkgname}"
  chmod +x "${pkgdir}/opt/${pkgname}/Messages"
  ln -s "/opt/${pkgname}/Messages" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
}

