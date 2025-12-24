# Maintainer: compiledkernel-idk <berkkapla82@proton.me>
# Contributor: pacboost contributors

pkgname=pacboost
pkgver=1.4.3
pkgrel=1
pkgdesc="High-performance package manager frontend for Arch Linux with integrated AUR support, system diagnostics, and intelligent automation"
arch=('x86_64')
url="https://github.com/compiledkernel-idk/pacboost"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'pacman' 'git' 'base-devel')
makedepends=('cargo' 'rust')
optdepends=(
  'sudo: for privilege escalation during AUR package building'
  'asp: for advanced source package management'
)
provides=('pacboost')
conflicts=('pacboost-bin' 'pacboost-git')
backup=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/compiledkernel-idk/pacboost/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Update this with actual checksum after first release

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
  
  # Install binary
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm644 CONTRIBUTING.md "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING.md"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install logo/icon
  install -Dm644 assets/logo.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
