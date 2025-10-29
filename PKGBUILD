

pkgname=uutils-tar-git
pkgver=0.0.1.r150.1578d39
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
makedepends=(rust tar git)
optdepends=("rust-src: optimize with RUSTC_BOOTSTRAP=1")
source=("uutils-tar::git+${url}.git")
sha256sums=('SKIP')

build(){
  cd uutils-tar
  test $RUSTC_BOOTSTRAP = 1 && _cargoflags="-Zbuild-std=std,panic_abort -Zbuild-std-features=panic_immediate_abort"
  cargo build --profile=release-fast $_cargoflags
}

package() {
  unset optdepends
  install -Dm755 /usr/bin/{backup,restore} -t "$pkgdir"/usr/bin
  install -Dm755 /usr/lib/tar/{backup.sh,dump-remind} -t "$pkgdir"/usr/lib/tar
  conflicts=(tar)
  provides=(tar)
  cd uutils-tar
  install -Dm755 target/release-fast/tarapp "$pkgdir"/usr/bin/tar
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/uutils-tar
}
