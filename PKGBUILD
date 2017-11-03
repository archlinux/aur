# Maintainer: Xavier Peng <png.inside@gmail.com>

pkgname=chez-scheme
pkgver=9.5
pkgrel=2
pkgdesc="Chez Scheme is a compiler and run-time system for the language of the Revised^6 Report on Scheme (R6RS), with numerous extensions."
arch=(i686 x86_64)
url="https://github.com/cisco/ChezScheme"
depends=()
license=('APL')
makedepends=('binutils' 'make' 'ncurses' 'libx11' 'xproto')
conflicts=('petite-chez-scheme' 'chez-scheme-git')
replaces=('petite-chez-scheme' 'chez-scheme-git')
source=("https://github.com/cisco/ChezScheme/releases/download/v9.5/csv9.5.tar.gz")
sha1sums=('fcbda13bb61643209fd5d825e393d2064dc6c5be')
_archivename=csv$pkgver

prepare() {
  cd "$srcdir/${_archivename}" || exit
  # copy from Jonathon Fernyhough, glibc=2.26 dropped xlocale.h, this is a hacky workaround
  cp /usr/include/locale.h zlib/xlocale.h
}

build() {
  cd "$srcdir/${_archivename}" || exit
  unset CHEZSCHEMELIBDIRS
  LDFLAGS="-ltinfo" ./configure --installprefix=/usr --temproot=$pkgdir
  make
}

package() {
  cd "${srcdir}/${_archivename}" || exit
  make install DESTDIR="$pkgdir"
}
