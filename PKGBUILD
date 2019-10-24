# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rav1e-git
pkgver=r2010.1618f98b
pkgrel=1
pkgdesc="The fastest and safest AV1 encoder"
arch=('i686' 'x86_64')
url="https://github.com/xiph/rav1e"
license=('custom' 'BSD')
depends=('gcc-libs')
makedepends=('git' 'rust'
  # aom dependency
  'cmake' 'perl' 'nasm')
# aom dependency
checkdepends=('python')
provides=('rav1e')
conflicts=('rav1e')
source=("git+https://github.com/xiph/rav1e.git")
sha256sums=('SKIP')


prepare() {
  cd "rav1e"

  git submodule update --init #--depth 1
}

pkgver() {
  cd "rav1e"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "rav1e"

  cargo build --release
}

check() {
  cd "rav1e"

  cargo test --release
}

package() {
  cd "rav1e"

  cargo install --root "$pkgdir/usr" --path "$srcdir/rav1e"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/rav1e/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/rav1e/LICENSE"
  install -Dm644 "PATENTS" "$pkgdir/usr/share/licenses/rav1e/PATENTS"

  rm "$pkgdir/usr/.crates.toml"
}
