# Maintainer:  Tristan Webb <tristan@fpcomplete.com>
pkgname=haskell-stack-git
_pkgname=stack
pkgver=0.1.3.1.r30.g9833f0d
pkgrel=1
pkgdesc="The Haskell Tool Stack"
arch=('i686' 'x86_64')
url="https://www.github.com/commercialhaskell/stack"
license=('BSD3')
depends=('libtinfo')
makedepends=('gcc' 'haskell-stack')
optdepends=('docker: Use Docker images to build your project in a temporary container')
provides=('haskell-stack')
conflicts=('haskell-stack')
# install=
source=("${_pkgname}::git+https://github.com/commercialhaskell/stack.git")
md5sums=('SKIP')


prepare() {
  STACK_ROOT=$srcdir
  cd "$srcdir/${_pkgname}"
  stack setup
}

build() {
  STACK_ROOT=$srcdir
  cd "$srcdir/${_pkgname}"
  pwd
  stack build --no-system-ghc
}

check() {
  STACK_ROOT=$srcdir
  cd "$srcdir/${_pkgname}"
  stack test stack:test:stack-test
}

package() {
  cd "$srcdir/${_pkgname}"
  BIN_DIR=`stack path | grep "local-install-root" | cut -d ' ' -f2`/bin
  STACK_BIN=$BIN_DIR/stack
  install -Dm755 $STACK_BIN "$pkgdir/usr/bin/stack"
  #STACK_MAN_DIR=./man/man1
  #gzip -k $STACK_MAN_DIR/stack.1
  #install -Dm644 $STACK_MAN_DIR/stack.1.gz "$pkgdir/$STACK_MAN_DIR/stack.1.gz"
  BASH_COMPLETION_DIR=etc/bash_completion.d
  mkdir -p $pkgdir/$BASH_COMPLETION_DIR
  $BIN_DIR/stack --bash-completion-script /usr/bin/stack >$pkgdir/$BASH_COMPLETION_DIR/stack
}

pkgver() {
cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# vim:set ts=2 sw=2 et:
