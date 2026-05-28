# Maintainer: Jakov Petrina Trnski <jkv.petrina@gmail.com>
pkgname=dtsfmt
pkgver=0.8.0
pkgrel=3
pkgdesc='Auto formatter for device tree files written in Rust'
url='https://github.com/mskelton/dtsfmt'
source=("git+https://github.com/mskelton/dtsfmt#tag=v${pkgver}")
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('ISC')
makedepends=('cargo' 'git')
# TODO: Fix `note: ld.lld: error: undefined symbol: ts_tree_cursor_goto_parent`
options=('!lto')
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"

  git submodule update --init --recursive
}

build () {
  cd "$srcdir/$pkgname"

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/dtsfmt "${pkgdir}/usr/bin/dtsfmt"
}
