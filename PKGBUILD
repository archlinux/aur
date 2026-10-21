# Maintainer: Chomiam <axel.valens@ik.me>
pkgname=noos-firewall
pkgver=0.1.0
pkgrel=1
pkgdesc="Gestion graphique native et moderne du pare-feu UFW en Rust (GTK4 / Libadwaita)"
arch=('x86_64' 'aarch64')
url="https://github.com/Chomiam/noos-firewall"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'glibc'
  'gcc-libs'
  'ufw'
  'polkit'
  'systemd'
  'iproute2'
  'hicolor-icon-theme'
)
makedepends=(
  'cargo'
  'git'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Chomiam/noos-firewall/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8a1138642139e91e511fb9fdb023e93e4a2e3f880381e0a3e9fb01773af78861')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "resources/org.noos.Firewall.desktop" "$pkgdir/usr/share/applications/org.noos.Firewall.desktop"
  install -Dm644 "resources/icons/scalable/apps/org.noos.Firewall.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.noos.Firewall.svg"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
