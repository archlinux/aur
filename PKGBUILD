# Maintainer: shafrnv <shafrnv@localhost>
pkgname=vi-tg-git
pkgver=0.1.0.r1.g57f6b7b
pkgrel=1
pkgdesc="Terminal Telegram client (Go backend + Rust TUI)"
arch=('x86_64' 'aarch64')
url="https://github.com/shafrnv/vi-tg"
license=('MIT')
depends=('glibc' 'gcc-libs' 'ffmpeg' 'mpv')
makedepends=('git' 'go' 'rust' 'pkgconf')
optdepends=(
  'curl: faster backend readiness check in launcher'
  'xdotool: optional X11 helper used by TUI'
)
provides=('vi-tg')
conflicts=('vi-tg')
options=('!lto')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd vi-tg
  local ver
  ver="$(grep -m1 '^version' Cargo.toml | sed 's/.*"\(.*\)"/\1/')"
  printf "%s.r%s.g%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd vi-tg
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd vi-tg
  export CARGO_HOME="$srcdir/cargo-home"
  export CGO_ENABLED=1
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="$srcdir/gopath"
  export GOMODCACHE="$srcdir/gomodcache"
  export GOCACHE="$srcdir/gocache"

  go build -ldflags="-s -w" -o vi-tg-server ./backend/
  cargo build --release --locked --offline
}

package() {
  cd vi-tg
  install -Dm755 target/release/vi-tg "$pkgdir/usr/bin/vi-tg-tui"
  install -Dm755 vi-tg-server "$pkgdir/usr/bin/vi-tg-server"
  install -Dm755 scripts/vi-tg.sh "$pkgdir/usr/bin/vi-tg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/vi-tg/README.md"
}
