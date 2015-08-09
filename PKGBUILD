# Maintainer: Abakus <java5@arcor.de>
pkgname=nasm-git
pkgver=20150726
pkgrel=1
pkgdesc="80x86 assembler designed for portability and modularity"
arch=('i686' 'x86_64')
url="http://nasm.sourceforge.net/"
depends=('glibc')
makedepends=('git' 'asciidoc')
license=('GPL')
replaces=('nasm')
provides=('nasm')
source=('git://repo.or.cz/nasm.git')
md5sums=('SKIP')

_gitname="nasm"

pkgver() {
  cd "$srcdir/$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$srcdir/$_gitname"

  #autoheader
  #autoconf
  ./autogen.sh
  ./configure --prefix=/usr

  # asciidoc/xmlto bugs out (report upstream)
  sed -i 's/manpages rdf/rdf/' Makefile
  sed -i 's/^.*\.1/#&/' Makefile

  make
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/"{bin,man/man1}
  make prefix="$pkgdir/usr" install
}
          
