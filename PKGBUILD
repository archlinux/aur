# Maintainer: typebrook <claude at topo dot tw>
# Contributor: J. B. Rainsberger <me at jbrains dot ca>

pkgname=textifyopendocument
pkgver=0.1.2
pkgrel=1
pkgdesc="Fast OpenDocument (odt/ods/odp) to plain text converter for previews"
arch=('x86_64' 'aarch64')
url="https://github.com/jbrains/textifyopendocument"
license=('GPL-2.0-only')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('08f0a2a4eea97272e6b3da922f5910106b5f938b435b6136dd4f2586b7343ec9ef2775f3501fc229319e335cb81d84dcaaa51239f3a7e7e388b0d055cbc1545e')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
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
  cargo test --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
