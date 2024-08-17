# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=apps-menu-applet-for-cosmic-git
_app_id=dev.dominiccgeh.CosmicAppletAppsMenu
pkgver=0.1.6.r15.g21c3063
pkgrel=1
pkgdesc="Category based menu for apps for COSMIC™️ DE"
arch=('x86_64')
url="https://github.com/leb-kuchen/apps-menu-applet-for-cosmic"
license=('GPL-3.0-or-later')
depends=('cosmic-applets')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'cosmic-applet-apps-menu-git' 'apps-menu-applet-for-cosmic_tm-git')
source=('git+https://github.com/leb-kuchen/apps-menu-applet-for-cosmic.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 target/release/cosmic-applet-apps-menu \
    "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "data/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 data/icons/scalable/apps/${_app_id}.svg -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
}
