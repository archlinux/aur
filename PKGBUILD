# Maintainer: Hewel <13846369+hewel@users.noreply.github.com>

pkgname=jellypilot
pkgver=2.1.1
pkgrel=1
pkgdesc='Jellyfin and Emby companion app: cast receiver and library browser driving external MPV'
arch=('x86_64')
url='https://github.com/hewel/jellypilot'
license=('MIT')
# makepkg's default LTOFLAGS (-flto=auto) compile aws-lc-sys's C objects into
# GCC fat-LTO bitcode that rust-lld cannot link; keep the build non-LTO.
options=('!lto')
depends=(
  'gtk3'
  'mpv'
  'libxkbcommon'
  'wayland'
)
makedepends=(
  'git'
  'rust'
  'bun'
)
conflicts=('jellypilot-bin')
source=(
  "git+https://github.com/hewel/jellypilot.git#tag=v$pkgver"
  'top.pigfun.jellypilot.desktop'
)
sha256sums=(
  'SKIP'
  '7236e1197fe9cd03f7df541f77a9710f4cf9a8c1f7de6df3a6f7def6e60d7651'
)

build() {
  cd "$srcdir/$pkgname"

  bun install --frozen-lockfile
  bun run task iced build --release
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "target/release/jellypilot" "$pkgdir/usr/bin/jellypilot"
  install -Dm644 "$srcdir/top.pigfun.jellypilot.desktop" \
    "$pkgdir/usr/share/applications/top.pigfun.jellypilot.desktop"
  install -Dm644 "assets/icons/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/top.pigfun.jellypilot.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
