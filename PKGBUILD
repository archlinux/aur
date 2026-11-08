# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libshout-git
pkgver=2.4.6.r0.gd8592a0
pkgrel=1
pkgdesc="Library for accessing a shoutcast/icecast server"
arch=('i686' 'x86_64')
url="https://libshout.freedesktop.org/wiki/"
license=('GPL-2.0-or-later')
depends=('glibc' 'openssl' 'libtheora' lib{ogg,speex,vorbis}.so)
makedepends=('git' 'libogg' 'libvorbis' 'speex')
provides=("libshout=$pkgver" 'libshout.so')
conflicts=('libshout')
options=('staticlibs')
source=("git+https://gitlab.xiph.org/xiph/icecast-libshout.git")
sha256sums=('SKIP')


prepare() {
  cd "icecast-libshout"

  sed -i 's|url = \.\.|url = https://gitlab.xiph.org/xiph|' ".gitmodules"
  git submodule sync
  git submodule update --init --recursive
}

pkgver() {
  cd "icecast-libshout"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "icecast-libshout"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "icecast-libshout"

  make DESTDIR="$pkgdir" install

  rm "$pkgdir/usr/share/doc/libshout/COPYING"
}
