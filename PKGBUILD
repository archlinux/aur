# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=sc64deployer
pkgver=2.20.2
pkgrel=2
pkgdesc='SummerCart64 loader and control software'
arch=(x86_64)
url='https://summercart64.dev/'
license=(GPL-3.0-or-later)
depends=(
  glibc
  libgcc
  libudev.so
  libusb
  libftdi
)
makedepends=(
  git
  rust
  clang
)
options=(!lto !debug)
source=(
  "$pkgname::git+https://github.com/Polprzewodnikowy/SummerCart64#tag=v$pkgver"
  devendor-libs.patch
)
sha512sums=('0cb190734b4cdf0e4b08f21b630d0398ef0fa7f9a35b8d6d12d1eb72a15b5e3633ef9dc6ce59d1de74b8739c8ae90c172a9899878ecfc1ec514ea9948ca94d65'
            'c6dc777afeda82918201e2c95553c1868acfc862af97b67f0b86f2f178653e500d2beab0835d7a2ed282852f15a620be785618a51e71c3bf053009fc6b261f74')
b2sums=('98f08462c396336c50aefcef8db780b44db93cbe91cbd96a5063ea3f5fe06e50e9418691f53d8b969ebbaf62d7df8e2a62408d55cfdc748edeedbd431a26d71a'
        '1cac64e0bdc1ffe74566ca9700d0f9b46efbc46d4f629bc4e7f18e19a800285a0eedcc5af35603733d749e8de756470f7c13fdb6b5fadb9590bc726eff41a3d7')

prepare() {
  cd "$pkgname"

  # use system libraries
  patch -p1 -i "$srcdir/devendor-libs.patch"

  cd sw/deployer

  # download dependencies
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname/sw/deployer"

  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname/sw/deployer"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
