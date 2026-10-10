# Maintainer: objz <me@objz.dev>
pkgname=rmcl
pkgver=0.6.2
pkgrel=1
pkgdesc="Minecraft launcher TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/objz/rmcl"
license=('GPL-3.0-only')
depends=('libxcb')
makedepends=('rust' 'cargo' 'jdk-openjdk')
provides=('rmcl')
conflicts=('rmcl-bin' 'rmcl-git' 'mcl-launcher' 'mcl-launcher-bin' 'mcl-launcher-git')
replaces=('mcl-launcher' 'mcl-launcher-bin' 'mcl-launcher-git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f5d7b53cb51c51199dee7fffedf08d949d2a739f438093a22450394169136d8c')

build() {
  export CARGO_TARGET_DIR="$srcdir/target"
  rm -rf "$CARGO_TARGET_DIR"
  cd "$srcdir/rmcl-${pkgver}"
  cargo build --release --locked
}

check() {
  export CARGO_TARGET_DIR="$srcdir/target"
  export XDG_CONFIG_HOME="$srcdir/xdg-config"
  mkdir -p "$XDG_CONFIG_HOME"
  cd "$srcdir/rmcl-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "$srcdir/rmcl-${pkgver}"
  install -Dm755 "$srcdir/target/release/rmcl" "$pkgdir/usr/bin/rmcl"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
