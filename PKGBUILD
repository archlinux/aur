# Maintainer: Svätopluk Hanzel <svatoplukhanzel@pm.me>
pkgname=kraken-cli
pkgver=0.5.1
pkgrel=1
pkgdesc='Kraken exchange CLI, interactive shell, and MCP server'
arch=('x86_64' 'aarch64')
url='https://github.com/krakenfx/kraken-cli'
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('cargo' 'cmake')
conflicts=('kraken-cli-bin')
# Rust's linker cannot consume GCC LTO objects from bundled DuckDB.
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/source.tar.gz")
sha256sums=('48082c89d48b0126a7cc9befb55447d159b120bb7a3f8981b47098631e8a399a')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | awk '/^host:/ {print $2}')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --package kraken-cli --bins --features record-duckdb
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/kraken{,-mcp,-shell} -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md CHANGELOG.md DISCLAIMER.md SECURITY.md -t "$pkgdir/usr/share/doc/$pkgname"
}
