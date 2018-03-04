# Maintainer: goetzc
# Contributor: Gaetan Bisson <bisson@archlinux.org

pkgname=squishyball
pkgver=19643
pkgrel=1
pkgdesc='Perform ABX audio sample comparison testing on the command line'
url='https://svn.xiph.org/trunk/squishyball/'
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('subversion')
depends=('opusfile' 'ncurses' 'libvorbis' 'flac' 'libao')
source=("svn+https://svn.xiph.org/trunk/squishyball/")
sha1sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  # Fix compile, from Debian bug tracker #860334
  sed -i '/#define _FILE_OFFSET_BITS/a#define NCURSES_INTERNALS' mincurses.c
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  svn info | awk '/Revision/{print $2}'
}

build() {
  cd "${srcdir}/${pkgname}"
  sed -i 's:@MANDIR@:/usr/share/man:' Makefile.am
  ./autogen.sh --prefix='/usr'
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
