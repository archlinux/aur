# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=shpool
pkgver=0.6.3
pkgrel=1
pkgdesc='Think tmux, then aim... lower'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/shell-pool/shpool'
license=(Apache-2.0)
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
checkdepends=('fish' 'less' 'zsh')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c52af96e8a5723e265e0948cac5a6b5fcb409d6d7cad0fdfdacc8c6711136648abbafa18f17a3f8789f90e471b5ce478188dbb42ae6cf418b87b612df9fd463c')

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-$PWD/test-run}"

  cd $pkgname-$pkgver
  cargo test --locked
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 "target/release/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"

  install -Dm644 README.md -t \
    "$pkgdir/usr/share/doc/$pkgname/"

  install -Dm644 systemd/shpool.{service,socket} -t \
    "$pkgdir/usr/lib/systemd/user/"
}
