# Maintainer: John Peter <johnpetersa19@gmail.com>
pkgname=cloudflare-warp-panel
_pkgname=cloudflare_warp_panel
pkgver=7.7.1
pkgrel=1
pkgdesc="A graphical control panel (GUI) for the Cloudflare WARP client for Linux."
arch=('x86_64')
url="https://github.com/johnpetersa19/cloudflare_warp_panel"
license=('GPL3')
depends=('cloudflare-warp-bin' 'gtk3' 'libadwaita')
makedepends=('git' 'flutter' 'dart')
source=("${_pkgname}-${pkgver}+${pkgrel}.tar.gz::https://github.com/johnpetersa19/${_pkgname}/archive/refs/tags/${pkgver}+${pkgrel}.tar.gz")
sha256sums=('66ca2ba9ef8a86ba329947154d4f6910feecc87500015461040ab8aa15f1aa97')

prepare() {
  rm -rf "${srcdir}/${_pkgname}-${pkgver}-${pkgrel}/build"
  rm -rf "${srcdir}/${_pkgname}-${pkgver}-${pkgrel}/linux/build"

  mv "${srcdir}/${_pkgname}-${pkgver}-${pkgrel}" "${srcdir}/${pkgname}-${pkgver}"
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
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -d "${pkgdir}/usr/share/applications"

  cp -r ./* "${pkgdir}/usr/share/${pkgname}/"

  ln -s "/usr/share/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/assets/cloudflare-logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<-EOF
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
