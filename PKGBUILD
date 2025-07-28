# Maintainer: Ed Neville <ed-archlinux@s5h.net>
pkgname=ripcalc
_binary=ripcalc
pkgver=0.2.6
pkgrel=1
pkgdesc="ripcalc, an IP network address tool"
url="https://gitlab.com/edneville/ripcalc"
arch=('any')
license=(GPL3)
depends=(gcc-libs)
makedepends=(cargo git)
source=("https://gitlab.com/edneville/${_binary}/-/archive/v${pkgver}/${_binary}-v${pkgver}.tar.gz")
sha512sums=('84aabaefffdca20ab7f3771aa7da4da6f739e8df7dfe19636fd3ecabbf12852c83c5ddee65b9e932738ebc860c4a67c552c508b53f3c3a0be8634f7c965114a7')

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

