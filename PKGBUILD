pkgname=ioruba-desktop
pkgver=0.5.0
pkgrel=2
pkgdesc="Tactile audio mixer for Arduino-based Linux control"
arch=('x86_64')
url="https://github.com/bernardopg/ioruba"
license=('MIT')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('ioruba')
conflicts=('ioruba' 'ioruba-desktop-bin')
replaces=('ioruba')
makedepends=('npm' 'rust' 'cargo' 'pkgconf' 'webkit2gtk-4.1' 'gtk3' 'librsvg' 'patchelf' 'libappindicator-gtk3')
source=("ioruba-${pkgver}.tar.gz::https://github.com/bernardopg/ioruba/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c979274ab5fa73699aad2a8200996a2295f79651956f0fe8093b44ca92f1c725')

prepare() {
  cd "ioruba-${pkgver}"
  npm ci
}

build() {
  cd "ioruba-${pkgver}"
  npm --workspace @ioruba/desktop run tauri build -- --no-bundle
}

package() {
  cd "ioruba-${pkgver}"

  install -Dm755     "apps/desktop/src-tauri/target/release/ioruba-desktop"     "${pkgdir}/usr/bin/ioruba-desktop"

  install -Dm644     "apps/desktop/src-tauri/icons/128x128.png"     "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ioruba.png"

  install -Dm644 /dev/null "${pkgdir}/usr/share/applications/ioruba.desktop"
  printf '%s\n'     '[Desktop Entry]'     'Type=Application'     'Name=Ioruba'     'Comment=Tactile audio mixer for Arduino-based Linux control'     'Exec=ioruba-desktop'     'Icon=ioruba'     'Categories=AudioVideo;Audio;'     'Terminal=false'     > "${pkgdir}/usr/share/applications/ioruba.desktop"
}
