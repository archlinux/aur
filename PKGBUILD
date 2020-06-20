# Maintainer: Kenneth G. Strawn <kstrawn0@saddleback.edu>

_pkgname=rust
pkgname=rust-nightly-osdev
pkgver=$(curl -s "https://api.github.com/repos/rust-lang/rust/tags" | grep -v "release-0" | grep "name" | head -n1 | sed -E 's/.*"([^"]+)".*/\1/')
pkgrel=1
pkgdesc="Nightly build of the Rust programming language along with the rustup utility and phil-opp's OS kernel development tools"
arch=(x86_64)
url='https://rustup.rs'
license=(MIT)
depends=('sudo' 'git' 'curl')
makedepends=()
optdepends=()
conflicts=('rust-bin' 'rust-git' 'rust-nightly' 'rust-nightly-bin' 'rust-nightly-src' 'rust-src' 'rust-src-git' 'rust-nightly-rustup')
sha256sums=('SKIP')
source=("https://sh.rustup.rs")

prepare() {
  mv $srcdir/sh.rustup.rs $srcdir/rustup-init.sh
  chmod a+x $srcdir/rustup-init.sh
}

package() {
  mkdir -p $pkgdir/opt/rust
  chmod -R a+rw $pkgdir/opt/rust # script can't install anything to $pkgdir otherwise
  export RUSTUP_HOME=$pkgdir/opt/rust
  export CARGO_HOME=$pkgdir/opt/rust
  $srcdir/rustup-init.sh --default-toolchain nightly --profile complete --no-modify-path -y
  $pkgdir/opt/rust/bin/cargo install racer rustsym ripgrep cargo-xbuild bootimage
  
  mkdir -p $pkgdir/usr/bin
  for i in $(ls $pkgdir/opt/rust/bin); do
    ln -s /opt/rust/bin/$i $pkgdir/usr/bin/$i
  done
  chmod -R a+rw $pkgdir/opt/rust # rustup and cargo won't run as an ordinary user otherwise
}
