

pkgname=uutils-awk-git
pkgver=0.1.0.r18.9ce8327
pkgver() {
  cd uutils-awk
  printf 0.1.0."r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
pkgrel=1
pkgdesc="Rust implementation of gawk"
arch=('x86_64')
url="https://github.com/uutils/awk"
license=('MIT')
depends=(gcc-libs)
makedepends=(rust git)
optdepends=("rust-src: optimize with RUSTC_BOOTSTRAP=1")
source=("uutils-awk::git+${url}.git")
b2sums=('SKIP')

build(){
  cd uutils-awk
  test $RUSTC_BOOTSTRAP = 1 && _cargoflags='-Zbuild-std=std,panic_abort --config=profile.release.panic="immediate-abort" -Zpanic-immediate-abort'
  cargo build --release $_cargoflags
}

package() {
  unset optdepends
  cd uutils-awk
  install -Dm755 target/release/awk "$pkgdir"/usr/bin/uu-awk
  install -Dm644 LICENSE-MIT -t "$pkgdir"/usr/share/licenses/uutils-awk
}
