# Maintainer: AntiApple4life <antiapple at antiapple dot net>
pkgname=wayvr-dashboard-git
pkgver=0.3.3.r0.gdcf3a1a
pkgrel=1
pkgdesc="WayVR Dashboard is a work-in-progress overlay application (WayVR/wlx-overlay-s plugin via IPC) for launching various applications and games directly into a VR desktop environment"
arch=('x86_64')
url="https://github.com/olekolek1000/wayvr-dashboard"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'npm' 'nodejs')
provides=("${pkgname%-git}")
options=('!lto')
install=instructions.install
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --abbrev=7 --tags | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname%-git}
  npm install
}

build() {
  cd ${pkgname%-git}
  npx tauri build -b deb
}

package() {
  cd ${pkgname%-git}
  _artver=$(git describe --tags --abbrev=0)
  cp -a src-tauri/target/release/bundle/deb/${pkgname%-git}_${_artver}_*/data/* "${pkgdir}"
}
