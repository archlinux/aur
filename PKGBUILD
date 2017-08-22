# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libshout-git
pkgver=2.4.1.r22.g2dd6cfb
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
source=("git+https://git.xiph.org/icecast-libshout.git"
        "0001-Fix-build-with-newer-openssl.patch")
sha256sums=('SKIP'
            '742f1954c21ed5f8344dc1514507c981f445be0a7d4bdd2adaa73b0464f37a75')


prepare() {
  cd "icecast-libshout"

  sed -i 's|url = \.\.|url = https://git.xiph.org|' ".gitmodules"
  git submodule sync
  git submodule update --init --recursive

  patch -Np1 -i "$srcdir/0001-Fix-build-with-newer-openssl.patch"
}

pkgver() {
  cd "icecast-libshout"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "icecast-libshout"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "icecast-libshout"

  make DESTDIR="$pkgdir" install

  rm "$pkgdir/usr/share/doc/libshout/COPYING"
}
