# Maintainer: eggfriedrice <eggfriedricew.g.o@gmail.com>

pkgname=frameit
pkgver=0.2.0
pkgrel=1
pkgdesc='Temporary selection rectangle overlay for Wayland and Hyprland screen shares'
arch=('x86_64')
url='https://github.com/eggfriedrice24/frameit'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
optdepends=('hyprland: register the trigger with frameit bind')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('48cbedc1a772318d55fb816878f1d801300d26ce74c1f3350cde72993c1a0891ed33099384f725d752c7bb006ad5fa0fd6074689d1b90fd9a49e1c6e3c82b40c')

# Keep debug info in the binary so makepkg can split it into the -debug package.
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
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
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/man/man1/" "doc/$pkgname.1"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples/" examples/config.toml
}
