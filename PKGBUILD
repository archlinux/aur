# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=rmux
pkgver=0.2.0
pkgrel=2
pkgdesc='Universal Rust multiplexer with a typed SDK'
arch=('x86_64' 'aarch64')
options=(!lto)
url=https://github.com/Helvesec/rmux
license=('MIT')
depends=(glibc gcc-libs)
makedepends=(cargo)
conflicts=("$pkgname-bin")

source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('4482db6d87d8fcaeae9027e9afbad7ef58507c81a3773da4a2840696ebf01c52')

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin rmux
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
