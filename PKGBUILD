# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: quininer

pkgname=ruffle-git
pkgver=0.1.0.r7525.g84533e278
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=(x86_64)
url="https://ruffle.rs/"
license=(Apache MIT)
depends=(alsa-lib libxcb  gtk3)
makedepends=(git cargo python jdk-openjdk at-spi2-core)
provides=(ruffle)
conflicts=(ruffle)
source=("git+https://github.com/ruffle-rs/ruffle.git")
sha256sums=('SKIP')
options=(!lto)

pkgver() {
  cd "ruffle/desktop"
  printf "%s.r%s.g%s" $(awk '/^version/ {gsub(/"/, ""); print $3}' Cargo.toml) "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "ruffle/desktop"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build(){
  cd "ruffle/desktop"
  cargo build --frozen --release --all-features
}

package() {
  cd ruffle
  install -D -m755 "target/release/ruffle_desktop" "$pkgdir/usr/bin/ruffle"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
