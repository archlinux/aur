# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-applet-emoji-selector-git
pkgver=0.1.1.r0.ge830bc9
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
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  install -Dm644 data/icons/scalable/apps/*.svg -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
}
