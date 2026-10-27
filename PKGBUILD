# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Árni Dagur <arnidg@protonmail.ch>
# Contributor: Ahmet Arda Kavakcı <ahmetardakavakci@gmail.com>

pkgname='xcp'
pkgver='0.24.9'
pkgrel=1
pkgdesc="An extended 'cp'"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/tarka/xcp'
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-v$pkgver.tar.gz")
sha512sums=('ed31d590c445db0c38da45a564ae8d391252b28f697752a6c848a511d1ad5fa626e1f8fb016c98ad2f333292054f379f5a6922a91de2dd4509fe97149c5763f9')

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

  # acl test relies on the `mail` user being present
  # https://github.com/tarka/xcp/blob/d408d13c9453e0223bcc0162943ca02272b0ad5b/libfs/src/linux.rs#L810
  if id mail &>/dev/null; then
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
