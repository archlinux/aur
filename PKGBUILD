# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-applet-places-status-indicator-git
pkgver=r3.7e931c3
pkgrel=1
pkgdesc="Menu for quickly navigating places in the system on COSMIC DE"
arch=('x86_64')
url="https://github.com/leb-kuchen/cosmic-applet-places-status-indicator"
license=('GPL-3.0-or-later')
depends=('cosmic-applets')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/leb-kuchen/cosmic-applet-places-status-indicator.git')
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
  install -Dm644 data/dev.dominiccgeh.CosmicAppletPlacesStatusIndicator.desktop -t \
    "$pkgdir/usr/share/applications/"
}
