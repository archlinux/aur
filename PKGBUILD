

pkgname=uutils-tar-git
pkgver=0.0.1.r421.11c10da
pkgver() {
  cd uutils-tar
  printf 0.0.1."r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
pkgrel=1
pkgdesc="Rust implementation of tar"
arch=('x86_64')
url="https://github.com/uutils/tar"
license=('MIT')
depends=(gcc-libs)
makedepends=(rust git)
optdepends=("rust-src: optimize with RUSTC_BOOTSTRAP=1")
conflicts=(uutils-tar)
provides=(uutils-tar)
source=("uutils-tar::git+${url}.git")
b2sums=('SKIP')

build(){
  cd uutils-tar
  test $RUSTC_BOOTSTRAP = 1 && _cargoflags='-Zbuild-std=std,panic_abort --config=profile.release.panic="immediate-abort" -Zpanic-immediate-abort'
  cargo build --profile=release-fast $_cargoflags
}

package() {
  unset optdepends
  cd uutils-tar
  install -Dm755 target/release-fast/tarapp "$pkgdir"/usr/bin/uu-tar
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/uutils-tar
}
