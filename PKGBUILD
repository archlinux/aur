# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=pandia
pkgver=1.0.2
pkgrel=1
pkgdesc='JSON IDE built for files the rest of your tools choke on'
arch=('x86_64')
url="https://www.pandia.app/"
license=('Apache-2.0')
depends=('gtk3' 'cairo' 'libsoup3' 'webkit2gtk-4.1')
makedepends=('rust' 'npm')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/hendurhance/pandia/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('146ef95f01f4fa87142654a58b5c56e9671c9696024621f36d98fe771d91f330'
            'fc33f56e614ac421b3f620e32e62b67e3bcf6566d980d18cdd8c88635e1f2c7f')
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
