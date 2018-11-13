# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=libcmb
pkgver=1.3.1
pkgrel=1
pkgdesc="combinatorics library"
url="https://fraubsd.org/libcmb"
arch=('x86_64')
license=('BSD')
makedepends=('awk')
depends=('openssl')
source=("git+https://github.com/FrauBSD/pkgcenter")
sha256sums=('SKIP')

pkgver() {
  cd pkgcenter/depend/libcmb
  awk 'match($$0, /\$Version: [^$]* \$/) {
         print substr($0, RSTART + 10, RLENGTH - 12);
         exit found=1;
       } END { exit !found }' cmb.c | cut -d' ' -f2
}

prepare() {
  cd pkgcenter/depend/libcmb
  ./configure --prefix /usr
}

build() {
  cd pkgcenter/depend/libcmb
  make
}

package() {
  cd pkgcenter/depend/libcmb

  # Disabled for now because DESTDIR isn't respected
  #DESTDIR="$pkgdir" make install

  install -dm755 "$pkgdir"/usr/lib
  install -m755 libcmb.so.* "$pkgdir"/usr/lib/
  ln -s libcmb.so.* "$pkgdir"/usr/lib/libcmb.so

  install -dm755 "$pkgdir"/usr/include
  install -m444 cmb.h "$pkgdir"/usr/include/

  install -dm755 "$pkgdir"/usr/share/man/man3
  install -m444 cmb.3.gz "$pkgdir"/usr/share/man/man3/
}
