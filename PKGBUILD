

pkgname=brush-git
pkgver=0.2.23.32.g9351ecb
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
optdepends=("rust-src: optimization with RUSTC_BOOTSTRAP=1")
conflicts=(brush)
provides=(brush)
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
  cd brush
  if [ $RUSTC_BOOTSTRAP = 1 ];then
    echo Building with build-std...
    _cargoflags="-Zbuild-std=std,panic_abort -Zbuild-std-features=panic_immediate_abort"
  fi
  cargo build --release $_cargoflags
}

package() {
  cd brush
  install -Dm 755 target/release/brush "$pkgdir"/usr/bin/brush
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
