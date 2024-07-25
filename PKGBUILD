# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=places-status-indicator-applet-for-cosmic-git
_app_id=dev.dominiccgeh.CosmicAppletPlacesStatusIndicator
pkgver=r19.a341006
pkgrel=1
pkgdesc="Menu for quickly navigating places in the sysem for COSMIC™️ DE."
arch=('x86_64')
url="https://github.com/leb-kuchen/places-status-indicator-applet-for-cosmic"
license=('GPL-3.0-or-later')
depends=('cosmic-applets')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'cosmic-applet-places-status-indicator-git')
source=('git+https://github.com/leb-kuchen/places-status-indicator-applet-for-cosmic.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 target/release/cosmic-applet-places-status-indicator -t "$pkgdir/usr/bin/"
  install -Dm644 "data/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
}
