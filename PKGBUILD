# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ezstream-git
pkgver=1.0.2.r17.g47757b6
pkgrel=1
pkgdesc="A streaming source client for Icecast"
arch=('i686' 'x86_64')
url="https://www.icecast.org/ezstream/"
license=('GPL-2.0-or-later')
depends=('glibc' lib{shout,xml2}.so 'taglib')
makedepends=('git' 'check' 'libshout' 'libxml2')
provides=("ezstream=$pkgver")
conflicts=('ezstream')
source=("git+https://gitlab.xiph.org/xiph/ezstream.git")
sha256sums=('SKIP')


pkgver() {
  cd "ezstream"

  _tag=$(git tag -l --sort -v:refname | grep -E '^release_[0-9_]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^release_//;s/_/./g'
}

build() {
  cd "ezstream"

  autoreconf -fi
  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "ezstream"

  #make check
}

package() {
  cd "ezstream"

  make DESTDIR="$pkgdir" install
}
