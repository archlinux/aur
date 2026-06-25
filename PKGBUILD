

pkgname=jotdown-git
pkgver=0.10.0.8.gd46dab4
pkgver() {
  cd jotdown
  git describe --long --tags | sed -e "s/v//" -e 's/-alpha-/.r/' -e 's/\-/\./g'
}
pkgrel=1
pkgdesc='A Djot parser'
url=https://github.com/hellux/jotdown
arch=('x86_64')
license=(MIT)
depends=(gcc-libs glibc)
makedepends=(rust)
optdepends=("rust-src: optimize with RUSTC_BOOTSTRAP=1")
source=("git+${url}.git")
b2sums=('SKIP')

build() {
  cd jotdown
  test $RUSTC_BOOTSTRAP = 1 && _cargoflags="-Zbuild-std=std,panic_abort"
  RUSTFLAGS+=" -Cpanic=abort -Ccodegen-units=1"
  cargo build --release --features cli $_cargoflags
}

package() {
  unset optdepends
  cd jotdown
  install -Dm 755 target/release/jotdown -t "$pkgdir"/usr/bin
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
