# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=pandia
pkgver=1.0.7
pkgrel=1
pkgdesc='A powerful, open-source JSON visualization and editing tool for developers'
arch=('x86_64')
url="https://www.pandia.app/"
license=('Apache-2.0')
depends=('gtk3' 'cairo' 'libsoup3' 'webkit2gtk-4.1')
makedepends=('rust' 'npm')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/hendurhance/pandia/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('7904ff5f3ee3cd69106efd4968cf1efc44549fd0a6f796c4f041d9dc973fb064'
            'a271b0980d3c1b4c0fc011de9d92e746a04c754610a955181cc4ed6fe659d95e')
options=('!lto')

prepare() {
  cd "${pkgname}-${pkgver}"
  npm install --cache "${srcdir}/npm-cache"
}

build() {
  cd "${pkgname}-${pkgver}"
  npm run tauri build -- --no-bundle
}

package() {
  cd "${pkgname}-${pkgver}"
  # Install executable
  install -D -m 755 "src-tauri/target/release/Pandia" "${pkgdir}/usr/bin/${pkgname}"
  # Install icons
  install -D -m 644 "src-tauri/icons/32x32.png" \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -D -m 644 "src-tauri/icons/64x64.png" \
    "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
  install -D -m 644 "src-tauri/icons/128x128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -D -m 644 "src-tauri/icons/128x128@2x.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -D -m 644 "src-tauri/icons/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
  # Install desktop file
  install -D -m 755 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
