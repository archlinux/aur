# Maintainer: Ritwick Verma <verma1997@gmail.com>
#
# SudoStamp on the desktop: a tray icon, notifications naming the command sudo is waiting on, pause,
# and a window for pairing and health. Per-user and unprivileged; repairs go through pkexec and the
# `sudostamp` package's installer. A package of its own so a server's `sudostamp` stays arch=any
# with no compiler. Updated per release by scripts/publish-aur.sh.
pkgname=sudostamp-desktop
pkgver=1.7.0
pkgrel=1
pkgdesc="SudoStamp on the desktop: tray status, sudo notifications, pause, pairing and health"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/ritwick7/sudostamp"
# MIT (the app), Apache-2.0 (the fingerprint glyph), and the fonts egui builds in: OFL-1.1 and
# Ubuntu-font-1.0 (see NOTICE).
license=('MIT' 'Apache-2.0' 'OFL-1.1' 'LicenseRef-Ubuntu-Font-1.0')
# The window opens Wayland/X11, EGL and xkbcommon at run time (not linked), hence named here.
depends=('sudostamp' 'polkit' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'libxkbcommon' 'wayland')
makedepends=('cargo')
optdepends=('libx11: the window on an X11 session'
            'libxcursor: the window on an X11 session'
            'libxrandr: the window on an X11 session'
            'libxi: the window on an X11 session'
            'libxkbcommon-x11: the window on an X11 session')
options=('!lto' '!debug')
source=("sudostamp-v$pkgver.tar.gz::$url/-/archive/v$pkgver/sudostamp-v$pkgver.tar.gz")
sha256sums=('e0e392c7a9c779f1fe4236383377892f5b058102f2288fc675942dc2aa60ab06')

_src() { cd "$srcdir"/sudostamp-v"$pkgver"*/desktop; }

prepare() {
  _src
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  _src
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  _src
  install -Dm755 target/release/sudostamp-desktop "$pkgdir/usr/bin/sudostamp-desktop"
  install -Dm644 data/sudostamp-desktop.desktop "$pkgdir/usr/share/applications/sudostamp-desktop.desktop"
  install -Dm644 data/sudostamp-desktop-autostart.desktop "$pkgdir/etc/xdg/autostart/sudostamp-desktop.desktop"
  install -Dm644 data/icons/*.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ../NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
