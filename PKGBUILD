# Maintainer: SteinGaming <steingaming.online at gmail dot com>

pkgname="gotatun-git"
pkgver=0.1.0.r28.g6753265
pkgdesc="A boringtun (WireGuard® implementation in Rust) fork by Mulvad"
pkgrel=1

url="https://github.com/mullvad/gotatun"
arch=('x86_64')
license=("BSD-3-Clause")
source=("$pkgname::git+https://github.com/mullvad/gotatun.git")
sha256sums=('SKIP')

makedepends=('cargo' 'git')
conflicts=('gotatun')
provides=('gotatun')

options=(!lto)

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname"
  export CARGO_TARGET_DIR=target
  cargo build --release --bin gotatun --frozen
}

package() {
  cd "$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/gotatun"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
