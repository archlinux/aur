# Maintainer: Keivan-sf <keyvan0082@gmail.com>

pkgname=bushuray-git
pkgdesc="Xray TUI client (builds bushuray, bushuray-core and v2parser)"
pkgver=0.0.0.r0.g0000000
pkgrel=1
arch=("x86_64")
url="https://github.com/Keivan-sf/Bushuray-tui"
license=("MIT") 
depends=("xray-bin" "tun2socks-bin")
makedepends=("go" "cargo" "git")
source=(
  "bushuray-tui::git+https://github.com/Keivan-sf/Bushuray-tui.git"
  "bushuray-core::git+https://github.com/Keivan-sf/Bushuray-core.git"
  "v2parser::git+https://github.com/Keivan-sf/v2-uri-parser"
)
sha256sums=("SKIP" "SKIP" "SKIP")

pkgver() {
  cd "$srcdir/bushuray-tui"
  git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$srcdir/bushuray-tui"
  go mod tidy

  cd "$srcdir/bushuray-core/core"
  go mod tidy

  cd "$srcdir/v2parser"
  cargo fetch --locked
}

build() {
  cd "$srcdir/bushuray-tui"
  go build -o bushuray .

  cd "$srcdir/bushuray-core/core"
  go build -o bushuray-core .

  cd "$srcdir/v2parser"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/bushuray-tui/bushuray" "$pkgdir/usr/bin/bushuray"
  install -Dm755 "$srcdir/bushuray-core/core/bushuray-core" "$pkgdir/usr/bin/bushuray-core"
  install -Dm755 "$srcdir/v2parser/target/release/v2parser" "$pkgdir/usr/bin/v2parser"
}
