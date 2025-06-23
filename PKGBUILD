pkgname=cosmic-ext-applet-ollama-git
pkgver=r140.3f83ad0
pkgrel=1
pkgdesc="Ollama applet for COSMIC Desktop"
arch=('x86_64')
url="https://github.com/cosmic-utils/cosmic-ext-applet-ollama"
license=('GPL-3.0-or-later')
depends=('cosmic-applets')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}" "cosmic-applet-ollama")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/cosmic-utils/cosmic-ext-applet-ollama')
sha256sums=('SKIP')
options=(!lto)

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
  install -Dm644 data/*.desktop -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 data/icons/scalable/apps/*.svg -t \
    "$pkgdir/usr/share/icons/Cosmic/scalable/apps/"
}

