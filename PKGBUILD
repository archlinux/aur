# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=memex
pkgver=0.34.0
pkgrel=1
pkgdesc="Claude Code & Codex CLI transcript search for both humans & agents"
arch=('x86_64' 'aarch64')
url="https://github.com/nicosuave/memex"
license=('MIT')
depends=('gcc-libs' 'openssl' 'onnxruntime')
makedepends=('cargo')
checkdepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f6f2ea783bc5b95419bcc747aeefb792eed5a0c7496d434a6a2f4a80607a73b3')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen --no-default-features --features ort-load-dynamic
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
