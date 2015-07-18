# Maintainer:  Tristan Webb <tristan@fpcomplete.com>
pkgname=haskell-stack-git
_pkgname=stack
pkgver=20150718.b939373
pkgrel=1
pkgdesc="The Haskell Tool Stack"
arch=('i686' 'x86_64')
url="https://www.github.com/commercialhaskell/stack"
license=('BSD3')
depends=('libtinfo')
makedepends=('ghc' 'haskell-stack')
optdepends=('docker: Use Docker images to build your project in a temporary container')
provides=('haskell-stack')
conflicts=('haskell-stack')
# install=
source=("${_pkgname}::git+https://github.com/commercialhaskell/stack.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/${_pkgname}"
  stack setup --reinstall
  stack build
}

check() {
  cd "$srcdir/${_pkgname}"
  stack test
}

package() {
  cd "$srcdir/${_pkgname}"
  BIN_DIR=`stack path | grep "local-install-root" | cut -d ' ' -f2`/bin
  STACK_BIN=$BIN_DIR/stack
  install -Dm755 $STACK_BIN "$pkgdir/usr/bin/stack" 
  STACK_MAN_DIR=./man/man1
  gzip -k $STACK_MAN_DIR/stack.1
  install -Dm755 $STACK_MAN_DIR/stack.1.gz "$pkgdir/$STACK_MAN_DIR/stack.1.gz" 
}

pkgver() {
cd "${srcdir}/${_pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

# vim:set ts=2 sw=2 et:
