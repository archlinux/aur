pkgname=ioruba-desktop
pkgver=1.8.0
pkgrel=1
pkgdesc="Tactile audio mixer for Arduino-based Linux control"
arch=('x86_64')
url="https://github.com/bernardopg/ioruba"
license=('MIT')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedepends=('npm' 'rust' 'cargo' 'pkgconf' 'webkit2gtk-4.1' 'gtk3' 'librsvg' 'patchelf' 'libappindicator-gtk3')
source=("ioruba-${pkgver}.tar.gz::https://github.com/bernardopg/ioruba/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d24facd07d3f54f34be3679fabd8f7562f93e286eaadb33485327111befd6807')

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

  local _icons="apps/desktop/src-tauri/icons"
  install -Dm644 "${_icons}/32x32.png"     "${pkgdir}/usr/share/icons/hicolor/32x32/apps/ioruba.png"
  install -Dm644 "${_icons}/64x64.png"     "${pkgdir}/usr/share/icons/hicolor/64x64/apps/ioruba.png"
  install -Dm644 "${_icons}/128x128.png"     "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ioruba.png"
  install -Dm644 "${_icons}/128x128@2x.png"     "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ioruba.png"
  install -Dm644 "${_icons}/app-icon.svg"     "${pkgdir}/usr/share/icons/hicolor/scalable/apps/ioruba.svg"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/io.ioruba.desktop.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Ioruba
GenericName=Audio Mixer
GenericName[pt_BR]=Mixer de Áudio
Comment=Tactile audio mixer for Arduino-based Linux control
Comment[pt_BR]=Mixer de áudio tátil para controle via Arduino no Linux
Exec=ioruba-desktop
Icon=ioruba
Terminal=false
Categories=AudioVideo;Audio;Mixer;
Keywords=audio;mixer;volume;arduino;serial;hardware;potentiometer;
StartupNotify=true
StartupWMClass=io.ioruba.desktop
DESKTOP
}
