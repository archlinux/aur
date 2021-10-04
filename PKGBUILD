# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgbase=libopenmpt
pkgname=(libopenmpt openmpt123)
_pkgver=0.5.12+release.autotools
pkgver=${_pkgver%+*}
pkgrel=1
pkgdesc='A cross-platform C++ and C library to decode tracked music files (modules) into a raw PCM audio stream.'
arch=('i686' 'x86_64')
url='http://lib.openmpt.org/'
license=('BSD')
depends=('zlib' 'gcc-libs' 'libvorbis' 'mpg123')
makedepends=('portaudio' 'libsndfile' 'flac' 'help2man' 'libpulse')
source=("https://lib.openmpt.org/files/$pkgname/src/$pkgname-${_pkgver}.tar.gz")
sha256sums=('892aea7a599b5d21842bebf463b5aafdad5711be7008dd84401920c6234820af')

build() {
  cd $pkgbase-$_pkgver

  ./configure --prefix=/usr --enable-silent-rules
  make
}

check() {
  make -C $pkgbase-$_pkgver check
}

package_libopenmpt() {
  make -C $pkgbase-$_pkgver DESTDIR="$pkgdir" install

  # separate openmpt123
  rm -r "$pkgdir"/usr/{share/man,bin}

  # link license
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../doc/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_openmpt123() {
  pkgdesc='A cross-platform command-line or terminal based module file player.'
  depends=("libopenmpt=$pkgver" 'portaudio' 'libsndfile' 'flac' 'libpulse')

  make -C $pkgbase-$_pkgver DESTDIR="$pkgdir" install
  
  # separate libopenmpt
  rm -r "$pkgdir"/usr/{lib,include,share/doc}

  # link license
  install -d "$pkgdir"/usr/share/licenses
  ln -s $pkgbase "$pkgdir"/usr/share/licenses/$pkgname
}
