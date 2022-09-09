# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libxml2-git
pkgver=2.10.2.r137.gf2392dc4
pkgrel=1
pkgdesc="The XML C parser and toolkit of Gnome"
arch=('i686' 'x86_64')
url="http://xmlsoft.org/"
license=('custom')
depends=('glibc' 'icu' 'sh' 'xz' 'zlib')
makedepends=('git' 'python')
provides=("libxml2=$pkgver")
conflicts=('libxml2')
options=('staticlibs')
source=("git+https://gitlab.gnome.org/GNOME/libxml2.git")
sha256sums=('SKIP')


pkgver() {
  cd "libxml2"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libxml2"

  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --enable-static \
    --with-history \
    --with-icu
  make
}

check() {
  cd "libxml2"

  make check
}

package() {
  cd "libxml2"

  make DESTDIR="$pkgdir" install
  install -Dm644 "Copyright" -t "$pkgdir/usr/share/licenses/libxml2"
}
