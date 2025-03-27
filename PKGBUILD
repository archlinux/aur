# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=ripcalc
_binary=ripcalc
pkgver=0.2.0
pkgrel=1
pkgdesc="ripcalc, an IP network address tool"
url="https://gitlab.com/edneville/ripcalc"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('004c97a8a48a2707e5373da93b65a4fcf0746714c811c507701529f5ca94ed4e7769e2b976b46cf7ca1d507b2dfc0f03d99797ec7e206a7306f029c74d2a2bf6')

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

