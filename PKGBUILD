# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=clisp-git
pkgver=clisp.2.49.60.2017.06.25.r570.ga9aeb8030
pkgrel=1
pkgdesc="ANSI Common Lisp interpreter, compiler and debugger"
arch=('x86_64')
license=('GPL')
url="https://clisp.sourceforge.io/"
depends=('readline' 'libsigsegv' 'ffcall')
provides=('common-lisp')
conflicts=('clisp' 'clisp-new-clx')
makedepends=('git')
options=('!makeflags' '!emptydirs')
source=($pkgname::git+https://gitlab.com/gnu-clisp/clisp.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --with-readline --with-ffcall --with-module=asdf --with-dynamic-ffi src

  cd src
  ./makemake --prefix=/usr --with-readline --with-ffcall --with-module=asdf --with-dynamic-ffi > Makefile
  make
}

check() {
  cd $pkgname
  make check || :
}

package() {
  cd $pkgname/src
  make DESTDIR=$pkgdir install
}
