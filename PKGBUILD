# Maintainer: h0lylag <h0lylag@gravemind.sh>

pkgname=eve-preview-manager-beta
pkgver=1.9.0beta1
pkgrel=1
_upstream_version=1.9.0-beta.1
pkgdesc="EVE Online window preview manager (beta)"
arch=('x86_64')
url="https://github.com/h0lylag/EVE-Preview-Manager"
license=('MIT')
options=('!debug')
depends=('dbus' 'fontconfig' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libglvnd'
         'libx11' 'libxcb' 'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11'
         'libxrandr')
makedepends=('rust>=1:1.97.1')
provides=("eve-preview-manager=$pkgver")
conflicts=('eve-preview-manager')
source=("${pkgname}-${_upstream_version}.tar.gz::https://github.com/h0lylag/EVE-Preview-Manager/archive/refs/tags/v${_upstream_version}.tar.gz")
sha256sums=('f9f7b074ecf91dde332ca932894911ccfff68314434b2cc9b1eccd23d28ab10a')

prepare() {
  cd "EVE-Preview-Manager-${_upstream_version}"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  sed -i 's/^Icon=.*/Icon=eve-preview-manager/' assets/com.evepreview.manager.desktop
}

build() {
  cd "EVE-Preview-Manager-${_upstream_version}"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "EVE-Preview-Manager-${_upstream_version}"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-features
}

package() {
  cd "EVE-Preview-Manager-${_upstream_version}"
  install -Dm755 "target/release/eve-preview-manager" "$pkgdir/usr/bin/eve-preview-manager"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 assets/com.evepreview.manager.desktop "$pkgdir/usr/share/applications/eve-preview-manager.desktop"
  install -Dm644 assets/com.evepreview.manager.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/eve-preview-manager.svg"
}
