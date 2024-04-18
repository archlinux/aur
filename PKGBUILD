# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-applet-emoji-selector-git
pkgver=r12.a20bf7e
pkgrel=1
pkgdesc="Emoji Selector for COSMIC DE"
arch=('x86_64')
url="https://github.com/leb-kuchen/cosmic-applet-emoji-selector"
license=('MPL-2.0')
depends=('cosmic-applets' 'noto-fonts-emoji')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/leb-kuchen/cosmic-applet-emoji-selector.git')
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
  install -Dm755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin/"
  install -Dm644 data/dev.dominiccgeh.CosmicAppletEmojiSelector.desktop -t \
    "$pkgdir/usr/share/applications/"
}
