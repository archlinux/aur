# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-clipboard-manager-git
_app_id=com.wiiznokes.CosmicClipboardManager
pkgver=r46.d68c7d1
pkgrel=1
pkgdesc="Clipboard manager for COSMIC"
arch=('x86_64')
url="https://github.com/wiiznokes/cosmic-clipboard-manager"
license=('MIT')
depends=('cosmic-applets')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/wiiznokes/cosmic-clipboard-manager.git')
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
  install -Dm644 "resources/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 resources/icons/assignment24.svg -t "$pkgdir/usr/share/${_app_id}/icons/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
