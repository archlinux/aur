# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: mocihan <ly50247@126.com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=just-git
pkgver=0.9.4.r322.g9f03441e
pkgrel=2
pkgdesc="Just a command runner"
arch=('i686' 'x86_64')
url="https://just.systems/"
license=('custom')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("just=$pkgver")
conflicts=('just')
source=("git+https://github.com/casey/just.git")
sha256sums=('SKIP')


prepare() {
  cd "just"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "just"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

check() {
  cd "just"

  cargo test \
    --frozen
}

package() {
  cd "just"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "man/just.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 {README,GRAMMAR}.md -t "${pkgdir}/usr/share/doc/just"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/just"
}
