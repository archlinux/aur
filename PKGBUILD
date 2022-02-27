# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=fribidi-git
pkgver=1.0.11.r8.gcffa304
pkgrel=1
pkgdesc="Implementation of the Unicode Bidirectional Algorithm"
arch=('i686' 'x86_64')
url="https://github.com/fribidi/fribidi/"
license=('LGPL')
depends=('glibc')
makedepends=('git' 'meson')
provides=('fribidi' 'libfribidi.so')
conflicts=('fribidi')
source=("git+https://github.com/fribidi/fribidi.git")
sha256sums=('SKIP')


pkgver() {
  cd "fribidi"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "fribidi"

  meson \
    --buildtype=plain \
    --prefix="/usr" \
    -Ddocs="false" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "fribidi"

  meson test -C "_build"
}

package() {
  cd "fribidi"

  meson install -C "_build" --destdir "$pkgdir"
}
