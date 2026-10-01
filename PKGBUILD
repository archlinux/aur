# Maintainer: eggfriedrice <eggfriedricew.g.o@gmail.com>

pkgname=frameit
pkgver=0.1.0
pkgrel=1
pkgdesc='Temporary selection rectangle overlay for Wayland and Hyprland screen shares'
arch=('x86_64')
url='https://github.com/eggfriedrice24/frameit'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
optdepends=('hyprland: register the trigger with frameit bind')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('5effc94c8c1f41f3552a936005090ec45f570e625c9a03d781d621ada2b43a5993ff5a9899d584c842579946561d30fa481c437263647bb5934fb73612fde2ab')

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
