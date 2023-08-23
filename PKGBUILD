# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=virtiofsd
pkgver=1.7.2
pkgrel=1
pkgdesc="Vhost-user virtio-fs device backend written in Rust"
arch=(x86_64)
url="https://gitlab.com/virtio-fs/virtiofsd"
license=(
  Apache-2.0
  BSD-3-Clause
)
depends=(
  gcc-libs
  glibc
  libcap-ng
  libseccomp
)
makedepends=(cargo)
replaces=(qemu-virtiofsd)
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('7a1ac0871ba383e0bdd9f7cc287bc7850ef78df34b475986bcdda471774aacfcf23b80b4b7feb5d1d75a5e2d3bd174cd0137444f8d43733b7476e1db8a266061')
b2sums=('25df3149e5b17b6e8709a3d8212bad5dcc4a6df8f4cefaffb749d6952ec599db5ba35abb9e778d4ab1489644a39abc5fefd0ff410ade8979eca58b6273c31117')

prepare() {
  cd $pkgname-v$pkgver
  # use /usr/lib instead of /usr/libexec: https://gitlab.com/virtio-fs/virtiofsd/-/issues/86
  sed 's/libexec/lib/' -i 50-qemu-$pkgname.json

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-v$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname-v$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd $pkgname-v$pkgver
  install -vDm 755 target/release/$pkgname -t "$pkgdir/usr/lib/"
  install -vDm 644 50-qemu-$pkgname.json -t "$pkgdir/usr/share/qemu/vhost-user/"
  install -vDm 644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md doc/*.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
