# Maintainer: Anderson <anderson@wirebyinfo.com>

pkgname=whatsapp-linux-covenant
_pkgname=Whatsapp-Linux-Covenant
pkgver=1.3.0
pkgrel=1
pkgdesc="WhatsApp Desktop for Linux (Covenant Edition) built with modern Electron"
arch=('x86_64')
url="https://github.com/araujo791/Whatsapp-Linux-Covenant"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib')
makedepends=('git' 'nodejs>=20' 'npm')
provides=('whatsapp-desktop-linux' 'whatsapp-linux-covenant')
conflicts=('whatsapp-desktop-linux')
source=("git+https://github.com/araujo791/Whatsapp-Linux-Covenant.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  npm_config_cache="${srcdir}/npm-cache" npm install
  npx electron-builder build --x64 --linux dir
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -dm755 "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
  cp -a build/linux-unpacked/* "${pkgdir}/opt/${pkgname}/"

  ln -sf "/opt/${pkgname}/whatsapp-linux-covenant" "${pkgdir}/usr/bin/${pkgname}"
  ln -sf "/opt/${pkgname}/whatsapp-linux-covenant" "${pkgdir}/usr/bin/whatsapp-desktop-linux"

  install -Dm644 "data/io.github.covenant.WhatsAppDesktop.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "data/io.github.covenant.WhatsAppDesktop.appdata.xml" \
    "${pkgdir}/usr/share/metainfo/${pkgname}.appdata.xml"

  install -Dm644 "data/icons/hicolor/512x512/apps/io.github.covenant.WhatsAppDesktop.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/io.github.covenant.WhatsAppDesktop.png"

  install -Dm644 "data/icons/hicolor/scalable/apps/io.github.covenant.WhatsAppDesktop.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.covenant.WhatsAppDesktop.svg"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
