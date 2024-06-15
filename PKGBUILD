# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=emoji-selector-applet-for-cosmic-git
_app_id=dev.dominiccgeh.CosmicAppletEmojiSelector
pkgver=0.1.4.r3.ge6a3ea3
pkgrel=1
pkgdesc="Emoji Selector for COSMIC™️ DE"
arch=('x86_64')
url="https://github.com/leb-kuchen/emoji-selector-applet-for-cosmic_tm"
license=('MPL-2.0')
depends=('cosmic-applets' 'noto-fonts-emoji')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'cosmic-applet-emoji-selector-git')
source=('git+https://github.com/leb-kuchen/emoji-selector-applet-for-cosmic.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --all-features
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 target/release/cosmic-applet-emoji-selector -t "$pkgdir/usr/bin/"
  install -Dm644 "data/${_app_id}.desktop" -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 data/icons/scalable/apps/*.svg -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
}
