# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=clisp-git
pkgver=clisp.2.49.60.2017.06.25.r576.g129eaf3f1
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
  sed -i 's/clhs.el//g' src/makemake.in
  ./configure --prefix=/usr --with-readline --with-ffcall --with-module=asdf --with-dynamic-ffi --with-threads=POSIX_THREADS --with-debug --config build
  cd build
  make
}

check() {
  cd $pkgname/build
  make check || :
}

package() {
  cd $pkgname/build
  make DESTDIR=$pkgdir install
}
