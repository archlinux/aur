# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rav1e-git
pkgver=0.3.1.r83.g91658bd7
pkgrel=1
pkgdesc="The fastest and safest AV1 encoder"
arch=('i686' 'x86_64')
url="https://github.com/xiph/rav1e"
license=('BSD' 'custom')
depends=('gcc-libs')
makedepends=('git' 'rust' 'nasm' 'cargo-c')
provides=('rav1e')
conflicts=('rav1e')
options=('staticlibs')
source=("git+https://github.com/xiph/rav1e.git")
sha256sums=('SKIP')


pkgver() {
  cd "rav1e"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/v//'
}

check() {
  cd "rav1e"

  #cargo test --release
}

package() {
  cd "rav1e"

  cargo install --root "$pkgdir/usr" --path "$srcdir/rav1e"
  # for librav1e
  cargo cinstall --release --destdir "$pkgdir" --prefix "/usr"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/rav1e"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/rav1e"
  install -Dm644 "PATENTS" -t "$pkgdir/usr/share/licenses/rav1e"

  rm -f "$pkgdir/usr"/.crates*
}
