# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=zim-tools-git
pkgver=3.1.2.r5.g56c3604
pkgrel=1
pkgdesc="Various ZIM command line tools"
arch=('i686' 'x86_64')
url="https://github.com/openzim/zim-tools"
license=('GPL')
depends=('glibc' 'docopt' 'file' 'gumbo-parser' 'libzim')
makedepends=('git' 'meson' 'mustache')
provides=("zim-tools=$pkgver")
conflicts=('zim-tools')
source=("git+https://github.com/openzim/zim-tools.git")
sha256sums=('SKIP')


pkgver() {
  cd "zim-tools"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "zim-tools"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "zim-tools"

  #meson test -C "_build"
}

package() {
  cd "zim-tools"

  meson install -C "_build" --destdir "$pkgdir"
}
