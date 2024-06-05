# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-applet-apps-menu-git
pkgver=0.1.6.r8.g2e220d6
pkgrel=1
pkgdesc="Category based menu for apps on COSMIC DE"
arch=('x86_64')
url="https://github.com/leb-kuchen/apps-menu-applet-for-cosmic_tm"
license=('GPL-3.0-or-later')
depends=('cosmic-applets')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/leb-kuchen/apps-menu-applet-for-cosmic_tm.git')
sha256sums=('SKIP')

pkgver() {
  cd apps-menu-applet-for-cosmic_tm
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd apps-menu-applet-for-cosmic_tm
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd apps-menu-applet-for-cosmic_tm
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd apps-menu-applet-for-cosmic_tm
  install -Dm755 target/release/${pkgname%-git} -t "$pkgdir/usr/bin/"
  install -Dm644 data/dev.dominiccgeh.CosmicAppletAppsMenu.desktop -t \
    "$pkgdir/usr/share/applications/"
}
