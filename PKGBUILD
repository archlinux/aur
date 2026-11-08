# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ices-git
pkgver=2.0.2.r66.g2ccd03a
pkgrel=1
pkgdesc="A source client for the Icecast streaming server"
arch=('i686' 'x86_64')
url="https://icecast.org/ices/"
license=('GPL-2.0-or-later')
depends=('glibc' lib{ogg,shout,vorbis,xml2}.so)
makedepends=('git' 'libogg' 'libshout' 'libvorbis' 'libxml2')
provides=("ices=$pkgver")
conflicts=('ices')
source=("git+https://gitlab.xiph.org/xiph/icecast-ices.git")
sha256sums=('SKIP')


prepare() {
  cd "icecast-ices"

  sed -i 's|url = \.\.|url = https://gitlab.xiph.org/xiph|' ".gitmodules"
  git submodule sync
  git submodule update --init --recursive
}

pkgver() {
  cd "icecast-ices"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "icecast-ices"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "icecast-ices"

  make DESTDIR="$pkgdir" install
}
