# Maintainer: Ritwick Verma <verma1997@gmail.com>
#
# SudoStamp on the desktop: a tray icon, notifications naming the command sudo is waiting on, pause,
# and a window for pairing and health. Per-user and unprivileged; repairs go through pkexec and the
# `sudostamp` package's installer. A package of its own so a server's `sudostamp` stays arch=any
# with no compiler. Updated per release by scripts/publish-aur.sh.
pkgname=sudostamp-desktop
pkgver=2.0.0
pkgrel=1
pkgdesc="SudoStamp on the desktop: tray status, sudo notifications, pause, pairing and health"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/ritwick7/sudostamp"
# MIT (the app), Apache-2.0 (the fingerprint glyph), and the fonts egui builds in: OFL-1.1 and
# Ubuntu-font-1.0 (see NOTICE).
license=('MIT' 'Apache-2.0' 'OFL-1.1' 'LicenseRef-Ubuntu-Font-1.0')
# The window opens Wayland/X11, EGL and xkbcommon at run time (not linked), hence named here.
# sudostamp>=1.7.0: the installer's `doctor --json`/`setup --json` and the probe's events (1.6.0),
# and QR pairing (`discover --qr-stdin`, `setup --json --qr`, 1.7.0). An older one breaks the window.
depends=('sudostamp>=1.7.0' 'polkit' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'libxkbcommon' 'wayland')
makedepends=('cargo')
optdepends=('libx11: the window on an X11 session'
            'libxcursor: the window on an X11 session'
            'libxrandr: the window on an X11 session'
            'libxi: the window on an X11 session'
            'libxkbcommon-x11: the window on an X11 session')
options=('!lto' '!debug')
source=("sudostamp-v$pkgver.tar.gz::$url/-/archive/v$pkgver/sudostamp-v$pkgver.tar.gz")
sha256sums=('7dcfec202f95d2b439dd371c9b96dfb467c48a04f22243896209e3135fd43518')

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
