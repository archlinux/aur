# Maintainer: Pieter Joost van de Sande <pj@born2code.net>
pkgname=fsrx
pkgver=0.2.1
pkgrel=1
pkgdesc=" flow state reading in the terminal"
arch=('x86_64')
url="https://github.com/coloradocolby/fsrx"
license=()
depends=()
makedepends=('cargo' 'jq') 
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('0b300a81759dc9468be4a7685f645a866b5e1cc9719fe4dad803bff4bbf7c78da95f2f29cdb459f4574779612e705b440f15a11bd2039ee4d02572c05ec751b3')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked --message-format=json-render-diagnostics |
  jq -r 'select(.out_dir) | select(.package_id | startswith("ripgrep ")) | .out_dir' > out_dir
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  local OUT_DIR=$(<out_dir)

  install -Dm755 "target/release/fsrx" "$pkgdir/usr/bin/fsrx"
}
