# Maintainer: John Peter <johnpetersa19@gmail.com>

pkgname=cloudflare-warp-panel
_pkgname=cloudflare_warp_panel
pkgver=8.1.0
pkgrel=2
pkgdesc="A graphical control panel (GUI) for the Cloudflare WARP client for Linux."
arch=('x86_64')
url="https://github.com/johnpetersa19/cloudflare_warp_panel"
license=('GPL3')

depends=('cloudflare-warp-bin' 'gtk3' 'libadwaita')
makedepends=('flutter' 'dart')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/johnpetersa19/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5d485ce5e1b0216bbdcbf5c775ce3ea40f7257a59e675c851ebd87c6c403298f')

prepare() {
  rm -rf "${srcdir}/${_pkgname}-${pkgver}/build"
  rm -rf "${srcdir}/${_pkgname}-${pkgver}/linux/build"

  mv "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  flutter pub get
  flutter gen-l10n
  flutter build linux --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build/linux/x64/release/bundle"

  install -d "${pkgdir}/usr/share/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -d "${pkgdir}/usr/share/applications"

  cp -r ./* "${pkgdir}/usr/share/${pkgname}/"

  ln -s "/usr/share/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 \
    "${srcdir}/${pkgname}-${pkgver}/assets/cloudflare-logo.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=Cloudflare WARP Panel
Comment=${pkgdesc}
Exec=${pkgname}
Icon=${pkgname}
Terminal=false
Type=Application
Categories=Network;Utility;
StartupNotify=true
EOF
}
