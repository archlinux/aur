# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=bytehound
pkgver=0.8.0
pkgrel=1
pkgdesc="A memory profiler for Linux"
arch=('x86_64')
url="https://github.com/koute/bytehound"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rustup' 'yarn' 'node-gyp')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('7b424ec01be958998f326ef09741ad3d1c5e01089891f22ded5b8d1c46dbded40adf57e7b45285b8f8fb1c13bfc92d0ee97cc2254cf37349fe020d2056e12aa9')
b2sums=('3b8b41fdefa6144acd2256c29b82fc6c8418edf5bdc235d27fea04bec666dcdbbd3d21c54e5d391a21cc0eea5fd49542d8d9e583e55d2e17f2f87f92f1d2869b')

prepare() {
  cd "$pkgname-$pkgver"

  # setup toolchain with a pinned nightly version
  echo "nightly-2021-11-16" > rust-toolchain

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build \
    --frozen \
    --release \
    --all-features \
    --package bytehound-preload \
    --package bytehound-cli
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # shared lib
  install -vDm755 -t "$pkgdir/usr/lib" "target/release/lib$pkgname.so"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

# vim:set ts=2 sw=2 et:
