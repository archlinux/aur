

pkgname=brush-git
pkgver=0.2.23.35.gbd6cbc9
pkgver() {
  cd brush
  git describe --long --abbrev=7 | sed -e 's/brush-shell-v//' -e 's/\-/\./g'
}
pkgrel=1
pkgdesc="Bash compatible shell implemented in Rust"
arch=('x86_64')
url=https://github.com/reubeno/brush
license=(MIT)
depends=(gcc-libs)
makedepends=(rust)
optdepends=("rust-src: optimize with RUSTC_BOOTSTRAP=1")
conflicts=(brush)
provides=(brush)
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
  cd brush
  test $RUSTC_BOOTSTRAP = 1 && _cargoflags="-Zbuild-std=std,panic_abort -Zbuild-std-features=panic_immediate_abort"
  cargo build --release $_cargoflags
}

package() {
  unset optdepends
  cd brush
  install -Dm 755 target/release/brush "$pkgdir"/usr/bin/brush
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
