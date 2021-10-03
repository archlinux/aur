# Maintainer: Mario Oenning <mo-son[at]mailbox[dot]org>
# Author: codic12 <https://github.com/codic12>

_pkgbase='worm'
pkgname='worm-git'
pkgdesc="A floating, tag-based window manager written in Rust"
pkgver=0.1.0.23.g1e61b62
pkgrel=1
arch=('x86_64')
url="https://github.com/codic12/worm"
license=('MIT')
makedepends=('cargo' 'git')
depends=('xorg-server')
source=("$_pkgbase::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgbase"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build(){
  cd "$_pkgbase"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgbase"

  # bin
  install -D -m755 "target/release/worm" "$pkgdir/usr/bin/worm"
  install -D -m755 "target/release/wormc" "$pkgdir/usr/bin/wormc"

  # license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
