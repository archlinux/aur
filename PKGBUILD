# Contributor: perlawk
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=siod
pkgver=3.2
pkgrel=2
pkgdesc="Scheme in one day"
arch=('i686' 'x86_64')
url="http://people.delphiforums.com/gjc/siod.html"
license=('LGPL')
depends=('gcc')
source=("http://ftp.muni.cz/pub/linux/ftp.ibiblio.org/devel/lang/lisp/siod-3.2.tar.gz")
md5sums=('ba909ed12ae8b0c8bbad09845053e35b')

prepare() {
  sed -i 's/lchmod/lpchmod/g;' slibu.c
  sed -i '632s/$/ || defined(linux)/' slibu.c
  #sed -i '1s/$/\r/#include <math.h>/' tar.c
  sed -i 's!usr/local!usr!' cp-build
  sed -i 's!usr/local!usr!' csiod
  sed -i 's!usr/local!usr!' ftp-cp
  sed -i 's!usr/local!usr!' ftp-put
  sed -i 's!usr/local!usr!' http-get
}

build() {
  cflags="-fpic -shared "
  gcc -c -fpic siod.c slib.c sliba.c trace.c slibu.c md5.c tar.c  regex.c acct.c \
      gd.c ndbm.c parser_pratt.c ss.c
  gcc -shared -o libsiod.so slib.o sliba.o trace.o slibu.o md5.o -lm -lcrypt
  gcc -o siod -L . -lsiod -ldl siod.o
  gcc ${cflags} -o tar.so tar.o 
  gcc ${cflags} -o ss.so ss.o $lib
  gcc ${cflags} -o acct.so acct.o $lib
  gcc ${cflags} -o regex.so regex.o $lib
  gcc ${cflags} -o gd.so gd.o $lib
  gcc ${cflags} -o ndbm.so ndbm.o $lib
  gcc ${cflags} -o parser_pratt.so parser_pratt.o $lib
}

package() {
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/include
  install -d "$pkgdir"/usr/share/man/man1
  install -d "$pkgdir"/usr/lib/siod
  
  cp siod ftp-cp ftp-put http-get csiod cp-build  "$pkgdir"/usr/bin
  cp libsiod.so "$pkgdir"/usr/lib
  cp tar.so acct.so regex.so ndbm.so parser_pratt.so ss.so gd.so "$pkgdir"/usr/lib/siod
  cp *scm "$pkgdir"/usr/lib/siod
  rm -rf "$pkgdir"/usr/lib/siod/sql*scm
  cp *1 "$pkgdir"/usr/share/man/man1
  cp siod.h "$pkgdir"/usr/include
}

