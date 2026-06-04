

pkgname=uutils-grep-git
pkgver=0.1.0.r39.f4798cb
pkgver() {
  cd uutils-grep
  printf 0.1.0."r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
pkgrel=1
pkgdesc="Rust implementation of grep"
arch=('x86_64')
url="https://github.com/uutils/grep"
license=('MIT')
depends=(gcc-libs)
makedepends=(rust git)
optdepends=("rust-src: optimize with RUSTC_BOOTSTRAP=1")
conflicts=(tar)
provides=(tar)
source=("uutils-grep::git+${url}.git")
b2sums=('SKIP')

build(){
  cd uutils-grep
  test $RUSTC_BOOTSTRAP = 1 && _cargoflags='-Zbuild-std=std,panic_abort --config=profile.release.panic="immediate-abort" -Zpanic-immediate-abort'
  cargo build --profile=release $_cargoflags
}

package() {
  unset optdepends
  cd uutils-grep
  install -Dm755 target/release/grep -t "$pkgdir"/usr/bin
  echo -e echo -e '#!/bin/sh\nexec grep -E "$@"' | install -Dm755 /dev/stdin "$pkgdir"/usr/bin/egrep
  echo -e echo -e '#!/bin/sh\nexec grep -F "$@"' | install -Dm755 /dev/stdin "$pkgdir"/usr/bin/fgrep
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/uutils-grep
}
