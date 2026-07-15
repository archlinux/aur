# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=xgrep-search
pkgver=0.7.0
pkgrel=1
pkgdesc="Ultra-fast indexed code search engine with MCP server for AI coding tools"
arch=('x86_64' 'aarch64')
url="https://github.com/momokun7/xgrep"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
optdepends=('git: git-aware searches with --changed and --since')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/momokun7/xgrep/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('53e51672b46f7058e9db6e44935fdb88611832422eaeb828e1a10b4ff69332b9')

prepare() {
  cd "xgrep-$pkgver"
  cargo fetch --locked --manifest-path rust/Cargo.toml
}

build() {
  cd "xgrep-$pkgver"
  cargo build --frozen --release --manifest-path rust/Cargo.toml
}

check() {
  cd "xgrep-$pkgver"
  git init -q .
  cargo test --frozen --manifest-path rust/Cargo.toml
}

package() {
  cd "xgrep-$pkgver"
  install -Dm755 rust/target/release/xg "$pkgdir/usr/bin/xg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

latestver() {
  curl -fsSLI -o /dev/null -w '%{url_effective}\n' \
    'https://github.com/momokun7/xgrep/releases/latest' |
    sed -nE 's|.*/tag/v([0-9]+(\.[0-9]+)*)$|\1|p'
}
