# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=shpool
pkgver=0.11.5
pkgrel=1
pkgdesc='Think tmux, then aim... lower'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/shell-pool/shpool'
license=(Apache-2.0)
depends=('glibc' 'libgcc')
makedepends=('cargo')
checkdepends=('fish' 'less' 'zsh' 'procps-ng')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f17faedac656e1d37d0ce0b4cfa5a9c95c3b7a9985c9236424c368c8e65e9f28b323096142ae45abead3ecc657f2a41412c155df0e929f67ce7064c2eeba7e3b')

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

  cargo test --locked -- --skip=high_byte_input_does_not_kill_session --skip=forward_env_live_reload_fish
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
