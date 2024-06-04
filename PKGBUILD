pkgname=cosmic-applet-ollama-git
pkgver=r61.3e43fd3
pkgrel=1
pkgdesc="Menu for quickly navigating places in the system on COSMIC DE"
arch=('x86_64')
url="https://github.com/elevenhsoft/cosmic-applet-ollama"
license=('GPL-3.0-or-later')
depends=('cosmic-applets')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/elevenhsoft/cosmic-applet-ollama')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 target/release/${pkgname%-git} -t "$pkgdir/usr/bin/"
  install -Dm644 data/io.github.elevenhsoft.CosmicAppletOllama.desktop -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 data/icons/scalable/apps/io.github.elevenhsoft.CosmicAppletOllama-symbolic.svg -t \
    "$pkgdir/usr/share/icons/Cosmic/scalable/apps/"
}

