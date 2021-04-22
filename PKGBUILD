# Maintainer:  Wez Furlong <wez at wezfurlong dot org>

pkgname=('wezterm-git')
pkgdesc="A terminal emulator implemented in Rust, using OpenGL ES 2 for rendering."
pkgver=20200517.122836.92c201c6.105.g5d508350
pkgrel=5
arch=('x86_64' 'i686')
url="https://github.com/wez/wezterm"
license=('MIT')
depends=(
  'dbus'
  'fontconfig'
  'hicolor-icon-theme'
  'libx11'
  'libxkbcommon-x11'
  'wayland'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-wm'
)
makedepends=('rust' 'cargo' 'cmake' 'git' 'pkgconf' 'python')
source=("git+https://github.com/wez/wezterm.git")
sha256sums=('SKIP')
conflicts=('wezterm-bin' 'wezterm-nightly-bin')

prepare() {
  cd $srcdir/wezterm
  git submodule update --init --recursive
}

pkgver() {
  cd $srcdir/wezterm
  git describe --tags | tr - .
}

build() {
  cd $srcdir/wezterm
	cargo build --release
}

package() {
	cd $srcdir/wezterm
  install -Dsm755 target/release/wezterm $pkgdir/usr/bin/wezterm
  install -Dsm755 target/release/wezterm-gui $pkgdir/usr/bin/wezterm-gui
  install -Dsm755 target/release/wezterm-mux-server $pkgdir/usr/bin/wezterm-mux-server
  install -Dsm755 target/release/strip-ansi-escapes $pkgdir/usr/bin/strip-ansi-escapes
  install -Dm644 assets/icon/terminal.png $pkgdir/usr/share/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.png
  install -Dm644 assets/wezterm.desktop $pkgdir/usr/share/applications/org.wezfurlong.wezterm.desktop
  install -Dm644 assets/wezterm.appdata.xml $pkgdir/usr/share/metainfo/org.wezfurlong.wezterm.appdata.xml
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

