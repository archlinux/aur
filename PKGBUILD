# Maintainer: Your Name <you@example.com>

pkgname=hxy-git
pkgver=0.3.0
pkgrel=1
pkgdesc="Hex editor built with Rust and egui (git snapshot)"
arch=('x86_64')
url="https://github.com/landaire/hxy"
license=('MIT' 'Apache-2.0')
depends=(
  'fontconfig'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxrandr'
  'sqlite'
  'vulkan-icd-loader'
  'wayland'
)
optdepends=('xdg-desktop-portal: native file dialogs via the portal backend')
makedepends=('cargo' 'git' 'pkgconf')
provides=('hxy')
conflicts=('hxy')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/hxy"

  local ver
  ver=$(git describe --long --tags --abbrev=7 2>/dev/null || true)
  if [[ -n $ver ]]; then
    ver=${ver#v}
    ver=${ver//-/.}
  else
    ver="0.3.0.r$(git rev-list --count HEAD).g$(git rev-parse --short=7 HEAD)"
  fi

  printf '%s\n' "$ver"
}

build() {
  cd "$srcdir/hxy/crates/hxy"
  cargo build --release --locked --bin hxy
}

package() {
  cd "$srcdir/hxy/crates/hxy"

  install -Dm755 "target/release/hxy" "$pkgdir/usr/bin/hxy"
  install -Dm644 "$srcdir/hxy/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "$srcdir/hxy/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}

