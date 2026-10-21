# Maintainer: Chomiam <axel.valens@ik.me>
pkgname=noos-package-manager
pkgver=0.1.3
pkgrel=1
pkgdesc="Gestionnaire de paquets GTK4/Libadwaita (Pacman, AUR, Flatpak et AppImages)"
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
  'flatpak'
  'polkit'
  'hicolor-icon-theme'
)
makedepends=(
  'cargo'
  'git'
)
optdepends=(
  'yay: Assistant AUR pour installer et mettre a jour les paquets AUR'
  'paru: Assistant AUR alternatif pour installer et mettre a jour les paquets AUR'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Chomiam/noos-package-manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8566e527ec7f47ba2f9db3a73b6a3b5b0ce9cca577812dc0661bbe3f42d30799')

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
  install -Dm644 "assets/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "assets/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
