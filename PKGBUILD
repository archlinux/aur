# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=virtiofsd
pkgver=1.13.3
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
sha512sums=('b11b244ff98d1e96dcf1a960e33d5f0c08514946df1fc96de37fc76b3958daea7f1bc560adcce771841dc5e6447773f2764b36184d29ccb831ec9b86ec2fd8fc')
b2sums=('6d8ba4da210086d5a53cf02d9980ec56dd8edc0ef0b2421e3a69fc7ea348b5bcf96044f78fd71e011308e79e555ee0bf03cf84f63f048f3f0211759d0249be12')

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
