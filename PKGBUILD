# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=shpool
pkgver=0.9.3
pkgrel=1
pkgdesc='Think tmux, then aim... lower'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/shell-pool/shpool'
license=(Apache-2.0)
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
checkdepends=('fish' 'less' 'zsh' 'procps-ng')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('682be1fac269f61dcefad8748111e4848956290ff8db65fd31fe0f88cf4b70158bf4c177fa02f4ddce0cd45cbe2e2ba0710284e4b70baddbaffb197af8f7466a')

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

  # prompt_prefix_fish does not work 'in CI'; commented as such
  cargo test --locked -- --skip=prompt_prefix_fish
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
