# Maintainer: h0lylag <h0lylag@gravemind.sh>

pkgname=eve-preview-manager
pkgver=1.9.0
pkgrel=1
pkgdesc="EVE Online window preview manager"
arch=('x86_64')
url="https://github.com/h0lylag/EVE-Preview-Manager"
license=('MIT')
options=('!debug')
depends=('dbus' 'fontconfig' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libglvnd'
         'libx11' 'libxcb' 'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11'
         'libxrandr')
makedepends=('rust>=1:1.97.1' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/h0lylag/EVE-Preview-Manager/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9728be3787660a03d613469b727b8e66b821df267d1393ccde26868b83f60c92')

prepare() {
  cd "EVE-Preview-Manager-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  sed -i "s/^Icon=.*/Icon=$pkgname/" assets/com.evepreview.manager.desktop
}

build() {
  cd "EVE-Preview-Manager-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "EVE-Preview-Manager-${pkgver}"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-features
}

package() {
  cd "EVE-Preview-Manager-${pkgver}"
  install -Dm755 "target/release/eve-preview-manager" "$pkgdir/usr/bin/eve-preview-manager"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 assets/com.evepreview.manager.desktop "$pkgdir/usr/share/applications/eve-preview-manager.desktop"
  install -Dm644 assets/com.evepreview.manager.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/eve-preview-manager.svg"
}
