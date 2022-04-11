# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hck-git
pkgver=0.7.1.r1.ge6850b6
pkgrel=1
pkgdesc="A close to drop in replacement for cut(1) that can use a regex delimiter instead of a fixed string"
arch=('i686' 'x86_64')
url="https://github.com/sstadick/hck"
license=('MIT' 'custom:Unlicense')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=('hck')
conflicts=('hck')
source=("git+https://github.com/sstadick/hck.git")
sha256sums=('SKIP')


pkgver() {
  cd "hck"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "hck"

  cargo test \
    --locked \
    --release
}

package() {
  cd "hck"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/hck"
  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/hck"
}
