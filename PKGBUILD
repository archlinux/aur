

pkgname=brush-git
pkgver=brush.clap.adapter.v0.1.0.0.gc10a423
pkgver() {
  cd brush
  git describe --long --abbrev=7 | sed -e 's/brush-v//' -e 's/\-/\./g'
}
pkgrel=1
pkgdesc="Bash compatible shell implemented in Rust"
arch=('x86_64')
url=https://github.com/reubeno/brush
license=(MIT)
depends=(gcc-libs)
makedepends=(rust)
conflicts=(brush)
provides=(brush)
source=("git+${url}.git")
b2sums=('SKIP')

build() {
  cd brush
  export RUSTFLAGS="${RUSTFLAGS} -C force-unwind-tables=no"
  test $RUSTC_BOOTSTRAP = 1 && _cargoflags='-Zbuild-std=std,panic_abort --config=profile.release.panic="immediate-abort" -Zpanic-immediate-abort'
  cargo build --release $_cargoflags
}

package() {
  cd brush
  install -Dm755 target/release/brush -t "$pkgdir"/usr/bin
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  #cd "$pkgdir"/usr/bin
  #ln -sf brush bash
  #ln -sf brush rbash
  #ln -sf brush sh
}
