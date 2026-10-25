# Maintainer: Chomiam <axel.valens@ik.me>
pkgname=noos-package-manager
pkgver=0.1.16
pkgrel=1
pkgdesc="Gestionnaire de paquets GTK4/libAdapta et outil CLI (noos-up) pour Arch Linux (Pacman, AUR via Yay, Flatpak et AppImages)"
arch=('x86_64' 'aarch64')
url="https://github.com/Chomiam/noos-package-manager"
license=('GPL-3.0-or-later')
options=(!lto !debug)
depends=(
  'gtk4'
  'libadapta'
  'glibc'
  'gcc-libs'
  'pacman'
  'pacman-contrib'
  'sudo'
  'yay'
  'flatpak'
  'polkit'
  'hicolor-icon-theme'
  'needrestart'
  'reflector'
  'git'
)
makedepends=(
  'cargo'
  'cargo-auditable'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Chomiam/noos-package-manager/archive/refs/tags/v$pkgver.tar.gz")
# Rempli après la création du tag (somme BLAKE2b du tarball source).
b2sums=('e333fd3cc877ab5416a394a15e0d8324e12f5e1ca83c88e730a75a7d285bb69e2ebb5510a85afa6d1a8e37abf0f0e6676949377a8ab65de8829859357072e519')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Durcissement explicite : RELRO complet, NX, liaison « as-needed ».
  # Les CFLAGS de makepkg apportent déjà PIE, stack protector et FORTIFY_SOURCE
  # aux dépendances C.
  export RUSTFLAGS="${RUSTFLAGS:-} -C relro-level=full \
    -C link-arg=-Wl,-O1 -C link-arg=-Wl,--as-needed \
    -C link-arg=-Wl,-z,noexecstack"
  # cargo-auditable embarque la liste des dépendances Rust dans le binaire,
  # ce qui permet `cargo audit bin` et l'analyse par Syft/Trivy.
  cargo auditable build --frozen --release --all-features
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
