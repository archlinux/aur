# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=virtiofsd
pkgver=1.13.1
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
sha512sums=('ff9f5ef3d7715ace566a9095b16d363be489f149b6bd3b551a638a33ea47354b10f137f87801b5b43a009c855c12af7bfc71e81d43f993ca87e39a6cc7fb1fe2')
b2sums=('c12cb307970ad071c06e982de5bb641dd17efe6d26a14c703b39957273c26ce87f32efc38aef4099a4e3a54c2e7ecbb4e6c1048df16fb87cd4941a2712153839')

prepare() {
  cd $pkgname-v$pkgver
  # use /usr/lib instead of /usr/libexec: https://gitlab.com/virtio-fs/virtiofsd/-/issues/86
  sed 's/libexec/lib/' -i 50-$pkgname.json

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-v$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd $pkgname-v$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd $pkgname-v$pkgver
  install -vDm 755 target/release/$pkgname -t "$pkgdir/usr/lib/"
  install -vDm 644 50-$pkgname.json -t "$pkgdir/usr/share/qemu/vhost-user/"
  install -vDm 644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md doc/*.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
