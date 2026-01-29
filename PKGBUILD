# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Árni Dagur <arnidg@protonmail.ch>

pkgname='xcp'
pkgver='0.24.3'
pkgrel=1
pkgdesc="An extended 'cp'"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/tarka/xcp'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-v$pkgver.tar.gz")
sha512sums=('926824a4d9d1e24206189a7747ebfcdeb56fb1c5ca146a1ec92068e167f6d7d8dbad0951cc12947a675dfdb25d82fe09d3a32812cfbad2e7c1bbf6070c2b7614')

_src=$pkgname-$pkgname-v$pkgver

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd $_src
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd $_src
  cargo build --release --frozen
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd $_src

  if grep --quiet '^mail:' /etc/passwd; then
    ./tests/scripts/test-linux.sh
  else
    ./tests/scripts/test-linux.sh test_no_acl
  fi
}

package() {
  cd $_src

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "completions/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "completions/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm644 "completions/$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
