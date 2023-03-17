# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=virtiofsd
pkgver=1.5.1
pkgrel=2
pkgdesc="Vhost-user virtio-fs device backend written in Rust"
arch=(x86_64)
url="https://gitlab.com/virtio-fs/virtiofsd"
license=(Apache BSD)
depends=(gcc-libs glibc libcap-ng libseccomp)
makedepends=(cargo)
provides=(virtiofsd-provider)
conflicts=(virtiofsd-provider)
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('a50b3fac6d5eafc691ef4fc8808acb4dc03261f01623f6675a234d457231f96181e9cf6c8ac68b4fe1b1c97257faf56bc6d0c2776142c9dbfe82b4e9bde0e34a')
b2sums=('52c86ab9d4842ecd496aed3f09a98be96d7ee0eda43a2519eb066be1f648963b155386f9eac1a1c878c12fd05d928f88700c6a7a840c0f34dfa6f86caab15fec')

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
