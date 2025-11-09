

pkgname=jaq-git
pkgver=3.0.0.r9.g98ba723
pkgver() {
  cd jaq
  git describe --long --tags | sed -e "s/v//" -e 's/-alpha-/.r/' -e 's/\-/\./g'
}
pkgrel=1
pkgdesc='A jq clone'
url=https://github.com/01mf02/jaq
arch=('x86_64')
license=(MIT)
depends=(gcc-libs glibc)
makedepends=(rust)
optdepends=("rust-src: optimize with RUSTC_BOOTSTRAP=1")
conflicts=(jaq jq)
provides=(jaq jq)
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
  cd jaq
  test $RUSTC_BOOTSTRAP = 1 && _cargoflags="-Zbuild-std=std,panic_abort -Zbuild-std-features=panic_immediate_abort"
  RUSTFLAGS+=" -Cpanic=abort"
  cargo build --release $_cargoflags
}

package() {
  unset optdepends
  cd jaq
  install -Dm 755 target/release/jaq -t "$pkgdir"/usr/bin
  ln -sf jaq "$pkgdir"/usr/bin/jq
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
