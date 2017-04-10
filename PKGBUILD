# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=tkhtml3-git
pkgver=16.r173.g5749c02
pkgrel=1
pkgdesc="Tk widget to render html documents."
arch=('i686' 'x86_64')
url="http://tkhtml.tcl.tk/"
license=('LGPL2.1')
provides=('tkhtml3')
makedepends=('git')
depends=('tk' 'tcl')
source=("${pkgname}::git+https://github.com/olebole/tkhtml3.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags| sed 's/^Alpha.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  # Generate some source files
  tclsh src/cssprop.tcl
  tclsh src/tokenlist.txt
  tclsh src/mkdefaultstyle.tcl > htmldefaultstyle.c

  # copy these generated files to src
  mv *.c src
  mv *.h src
  chmod 755 configure
  ./configure --prefix=/usr --with-tcl=/usr/lib --with-tk=/usr/lib --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="${pkgdir}" install
}
