# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libshout-git
pkgver=2.4.3.r0.g0496602
pkgrel=1
pkgdesc="Library for accessing a shoutcast/icecast server"
arch=('i686' 'x86_64')
url="https://libshout.freedesktop.org/wiki/"
license=('GPL2')
depends=('glibc' 'openssl' 'libtheora' 'libvorbis' 'speex' )
makedepends=('git')
provides=('libshout')
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

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
