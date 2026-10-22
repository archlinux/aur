# Maintainer: Chomiam <axel.valens@ik.me>
pkgname=noos-package-manager
pkgver=0.1.6
pkgrel=1
pkgdesc="Gestionnaire de paquets GTK4/Libadwaita et outil CLI (noos-up) pour Arch Linux (Pacman, AUR via Yay, Flatpak et AppImages)"
arch=('x86_64' 'aarch64')
url="https://github.com/Chomiam/noos-package-manager"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'glibc'
  'gcc-libs'
  'pacman'
  'pacman-contrib'
  'yay'
  'flatpak'
  'polkit'
  'hicolor-icon-theme'
)
makedepends=(
  'cargo'
  'git'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Chomiam/noos-package-manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('96543497880e0d0b829d7bd2f3a674e4905a517fda0922c85fcf6e9ce3f8d6d3')

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
  install -Dm755 "target/release/noos-up" "$pkgdir/usr/bin/noos-up"
  install -Dm644 "assets/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "assets/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
