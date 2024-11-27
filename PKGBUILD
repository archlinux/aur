# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=virtiofsd
pkgver=1.13.0
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
sha512sums=('b20ff017afa08b8a98eda8b29456f645288fe14ca57c86ef9328bb20da144c9ac250c5c31a0d35c154c1722f41fe4a7639233dd0a82d3148dbd09d9bcf7ccdca')
b2sums=('91be610abcadcfa9b04b3bfba4e379cdf174e09209f0ac8358d700fc5eee794faec154dae4602592ce2b7e01e05ce6e510afdb73b7a96e149b520cb57bfedc35')

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
