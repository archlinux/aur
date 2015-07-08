# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Michael S. Walker <barrucadu@localhost>
pkgname=scm
pkgver=5f2
pkgrel=1
pkgdesc="An R5RS Scheme (IEEE P1178).  Written in C and runs under many OSes."
url="http://people.csail.mit.edu/jaffer/SCM"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('slib')
optdepends=('rlwrap: for a decent repl')
provides=('gnu-scm')
source=("http://groups.csail.mit.edu/mac/ftpdir/scm/$pkgname-$pkgver.zip")
md5sums=('ff83b43844b4fc2efeaa102d8eed8a4a')
install=scm.install
options=('!makeflags')

build() {
  export SCHEME_LIBRARY_PATH=/usr/share/slib/
  cd "$srcdir/$pkgname"

  echo '(define (library-vicinity) "/usr/share/slib/")' > requires.scm
  make clean
  ./configure --quiet --prefix="$pkgdir/usr/"
 
  # perlawk changes strings.h to string.h
  # seems to not do anything useful
  #find ./ -type f | xargs -n 1 sed -i 's|<strings.h>|<string.h>|'
 
  make scmlit
  make scm5
  make dlls
  make gdbscm
  #make all
  make

  #./build > buildscript
  #chmod +x buildscript
  #./buildscript
}

package() {
  export SCHEME_LIBRARY_PATH=/usr/share/slib/
  cd "$srcdir/$pkgname"

  sed -i 's/scm-$(VERSION).info/scm.info/g;' Makefile
  make install
}

