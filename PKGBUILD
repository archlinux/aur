# Maintainer: typebrook <claude at topo dot tw>
# Contributor: J. B. Rainsberger <me at jbrains dot ca>

pkgname=textifyopendocument
pkgver=0.1.1
pkgrel=1
pkgdesc="Fast OpenDocument (odt/ods/odp) to plain text converter for previews"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/jbrains/textifyopendocument"
license=('GPL-2.0-only')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('dde9e15e3349e395c2cb3d67d6dc7ae098297f4a3b8d425adba1650925fa78122b82ac1cb7306f285dec371dd228644ea5dd445536287f315b0bdc3a7cd23e39')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --all-features
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
