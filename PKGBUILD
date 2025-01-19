# Maintainer:
pkgname=dr42-time-scheduler-client
pkgver=0.1.15
pkgrel=1
pkgdesc="A simple time management app"
arch=('any')
url="https://github.com/Dr-42/time-scheduler-client"
license=('BSD-2-CLAUSE')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'file' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'base-devel' 'curl' 'wget' 'cargo' 'nodejs' 'dpkg' 'pnpm')
provides=('time-scheduler-client')
conflicts=('time-scheduler-client' 'time-scheduler-client')
options=('!strip' '!emptydirs')
source=('git+https://github.com/Dr-42/time-scheduler-client.git')
sha256sums=('SKIP')
pkgver() {
  cd "$srcdir"/time-scheduler-client
  printf $(pnpm ver | tail -n 1)
}
prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir"/time-scheduler-client
  pnpm install
  pnpm tauri build
}
package() {
  cd "$srcdir"/time-scheduler-client/src-tauri/target/release/bundle/deb
  dpkg-deb -x *.deb here
  cd here

  install -Dm755 usr/bin/time-scheduler-client "$pkgdir"/usr/bin/time-scheduler-client

  # Install desktop file
  install -Dm644 usr/share/applications/time-scheduler-client.desktop "$pkgdir"/usr/share/applications/time-scheduler-client.desktop

  # Install icons
  # Manually copy icons from src-tauri/icons
  cd "$srcdir"/time-scheduler-client/src-tauri/icons

  install -Dm644 128x128.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/time-scheduler-client.png
  install -Dm644 128x128@2x.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/time-scheduler-client.png
  install -Dm644 32x32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/time-scheduler-client.png
  # Extract package data
}
