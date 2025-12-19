

pkgname=brush-git
pkgver=brush.v0.3.0.68.g9066950
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
conflicts=(brush bash sh)
provides=(brush bash sh)
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
  cd brush
  export RUSTFLAGS="${RUSTFLAGS} -C force-unwind-tables=no"
  [ $RUSTC_BOOTSTRAP = 1 ] && _cargoflags='-Zbuild-std=std,panic_abort --config=profile.release.panic="immediate-abort" -Zpanic-immediate-abort'
  cargo build --release $_cargoflags
}

package() {
  unset optdepends
  cd brush
  install -Dm 755 target/release/brush "$pkgdir"/usr/bin/brush
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  cd "$pkgdir"/usr/bin
  ln -sf brush bash
  ln -sf brush rbash
  ln -sf brush sh
}
