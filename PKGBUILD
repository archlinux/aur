# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rav1e-git
pkgver=0.7.1.r63.g38879ab5
pkgrel=1
pkgdesc="The fastest and safest AV1 encoder"
arch=('i686' 'x86_64')
url="https://github.com/xiph/rav1e"
license=('BSD-2-Clause' 'LicenseRef-custom')
depends=('gcc-libs')
makedepends=('git' 'cargo' 'cargo-c' 'libgit2' 'nasm')
provides=("rav1e=$pkgver" 'librav1e.so')
conflicts=('rav1e')
options=('staticlibs')
source=("git+https://github.com/xiph/rav1e.git")
sha256sums=('SKIP')


prepare() {
  cd "rav1e"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "rav1e"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//;s/-/./g'
}

check() {
  cd "rav1e"

  #cargo test \
  #  --frozen
}

package() {
  cd "rav1e"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path .
  # for librav1e
  cargo cinstall \
    --locked \
    --destdir "$pkgdir" \
    --prefix "/usr"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/rav1e"
  install -Dm644 {LICENSE,PATENTS} -t "$pkgdir/usr/share/licenses/rav1e"
}
