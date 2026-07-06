# Maintainer: Justin Slay <justin.slay@gmail.com>
pkgname=fw-fanctrl-gui-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Graphical fan curve editor and tray controller for fw-fanctrl on Framework laptops (git)"
arch=('x86_64')
url="https://github.com/jslay88/fw-fanctrl-gui"
license=('MIT')
depends=('fw-fanctrl' 'webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl' 'hicolor-icon-theme')
makedepends=('git' 'nodejs' 'npm' 'rust')
optdepends=('gnome-shell-extension-appindicator: tray icon support on GNOME Shell')
provides=('fw-fanctrl-gui')
conflicts=('fw-fanctrl-gui')
options=('!strip')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd fw-fanctrl-gui
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd fw-fanctrl-gui
  npm ci
  npm run tauri build -- --bundles deb
}

package() {
  cd fw-fanctrl-gui
  local deb=(src-tauri/target/release/bundle/deb/fw-fanctrl-gui_*_amd64.deb)
  bsdtar -xOf "${deb[0]}" data.tar.gz | bsdtar -xf - -C "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
