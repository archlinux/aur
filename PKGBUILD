# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=shpool
pkgver=0.9.5
pkgrel=1
pkgdesc='Think tmux, then aim... lower'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/shell-pool/shpool'
license=(Apache-2.0)
depends=('glibc' 'libgcc')
makedepends=('cargo')
checkdepends=('fish' 'less' 'zsh' 'procps-ng')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('eb2aa3d49c3eeac39a05503ea508e063772318ae693e2a8f0a03e8603bdf0fa334fa9b4abd5e2bbdb601826c2e6c2fd953b4b3aa1fae78f50ac3708c0a6d5ce5')

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
