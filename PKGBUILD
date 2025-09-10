# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=ripcalc
_binary=ripcalc
pkgver=0.2.7
pkgrel=1
pkgdesc="ripcalc, an IP network address tool"
url="https://gitlab.com/edneville/ripcalc"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${_binary}/-/archive/v${pkgver}/${_binary}-v${pkgver}.tar.gz")
sha512sums=('78446fcbb25233c26d8030674e7e8dea196d21c97f3af27964d3866392f1e1683603e524636711c4b517fed261567d27d5d2888e257eaadc83b477f25d4968cc')

prepare() {
  cd ${pkgname}-v${pkgver}
  cargo fetch --target x86_64-unknown-linux-gnu
}

build() {
  cd ${pkgname}-v${pkgver}
  cargo build --release --frozen --all-targets
}

check() {
  cd ${pkgname}-v${pkgver}
  # test_expand* fails; needs nightly rust
  cargo test --release --frozen || :
}

package() {
  cd ${pkgname}-v${pkgver}
  install -Dt "$pkgdir/usr/bin" -m0755 target/release/${_binary}
  install -Dt "$pkgdir/usr/share/man/man1" -m0644 ${_binary}.1
}

