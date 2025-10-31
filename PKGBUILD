# Maintainer: Pujan Modha <pujan.pm@hotmail.com>
pkgname=helium-browser-appimage
pkgver=0.6.2.1
pkgrel=1
pkgdesc="Private, fast, and honest web browser"
arch=('x86_64')
url="https://github.com/imputnet/helium-linux"
license=('GPL3')
depends=()
optdepends=('fuse2: run AppImage')
provides=('helium-browser')
conflicts=('helium-browser-bin')
options=(!strip)

_appimage="helium-${pkgver}-${arch}.AppImage"
source=(
  "${_appimage}::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/${_appimage}"
  "helium.desktop::https://raw.githubusercontent.com/imputnet/helium-linux/${pkgver}/package/helium.desktop"
  "helium.svg::https://raw.githubusercontent.com/imputnet/helium-chromium/refs/heads/main/resources/branding/product_logo.svg"
)
sha256sums=('f754e07a5f70f19907df8363015efbe823be52ce1cd6083bac8fb09309ecfad9'
            'cce8668c18d33077a585cb5d96522e5a02ae017a2baf800f8d7214ce6d05d3d2'
            '7eb2b8a0b00a8ccefe2b4712c298a9c320d8bbd44f6de9133621e3f3fdd34e7a')

prepare() {
  # Fix upstream desktop file to use the correct binary name and app name (from helium-browser-bin)
  sed -i \
    -e 's/Exec=chromium/Exec=helium/' \
    -e 's/Name=Helium$/Name=Helium Browser/' \
    "helium.desktop"
}

package() {
  install -d "${pkgdir}/opt/helium"
  install -m755 "${_appimage}" "${pkgdir}/opt/helium/helium.AppImage"

  install -d "${pkgdir}/usr/bin"
  printf '#!/bin/sh\nexec /opt/helium/helium.AppImage "$@"\n' > "${pkgdir}/usr/bin/helium"
  chmod 755 "${pkgdir}/usr/bin/helium"

  install -Dm644 "helium.desktop" "${pkgdir}/usr/share/applications/helium.desktop"
  install -Dm644 "helium.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/helium.svg"
}
