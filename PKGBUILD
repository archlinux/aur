# Maintainer:  Tristan Webb <tristan@fpcomplete.com>
pkgname=haskell-stack-git
_pkgname=stack
pkgver=1.0.2.r2.gdca69c6
pkgrel=1
pkgdesc="The Haskell Tool Stack"
arch=('i686' 'x86_64')
url="https://www.github.com/commercialhaskell/stack"
license=('BSD3')
depends=('libtinfo')
makedepends=('gcc' 'stack')
optdepends=('docker: Use Docker images to build your project in a temporary container')
provides=('stack')
conflicts=('stack')
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
  BASH_COMPLETION_DIR=etc/bash_completion.d
  mkdir -p $pkgdir/$BASH_COMPLETION_DIR
  $BIN_DIR/stack --bash-completion-script /usr/bin/stack >$pkgdir/$BASH_COMPLETION_DIR/stack
}

pkgver() {
cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# vim:set ts=2 sw=2 et:
