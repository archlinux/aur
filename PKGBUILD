# Maintainer: David Seus <forenkram@gmx.de>

pkgname=guile-2.2
string_components=(${pkgname/-/ })
_pkgname=${string_components[0]}
_pkgmainversion=${string_components[1]}
pkgver=2.2.7
pkgrel=1
pkgdesc='Portable, embeddable Scheme implementation written in C. Legacy version.'
url='https://www.gnu.org/software/guile/'
arch=(x86_64)
license=(GPL)
depends=(gmp libltdl ncurses texinfo libunistring gc libffi)
source=(https://ftp.gnu.org/pub/gnu/$_pkgname/$_pkgname-$pkgver.tar.xz{,.sig})
validpgpkeys=('3CE464558A84FDC69DB40CFB090B11993D9AEBB5' # Ludovic Courtès <ludo@gnu.org>
              ) 
sha256sums=('cdf776ea5f29430b1258209630555beea6d2be5481f9da4d64986b077ff37504'
            'SKIP')

build() {
  import_verification_key
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr \
    --disable-static \
	--program-suffix=$_pkgmainversion
  make
}

import_verification_key(){
  gpg --keyserver pgp.mit.edu --recv-keys ${validpgpkeys[0]} 
}

package() {
  make -C $_pkgname-$pkgver DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/lib/libguile-2.?.so.*-gdb.scm
  mv "$pkgdir"/usr/share/aclocal/{guile,guile-$_pkgmainversion}.m4
  rm -rf "$pkgdir"/usr/share/info
}
