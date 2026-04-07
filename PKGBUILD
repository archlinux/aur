# Maintainer: Clemens Schmid <clemens [ a t ] nevrome [-d-o-t-] de>

pkgname=kics2
pkgver=3.4.0
pkgrel=1
pkgdesc="KiCS2 is an implementation of the multi-paradigm declarative language Curry which compiles Curry programs into Haskell programs."
arch=('x86_64')
url="https://www.curry-lang.org/kics2"
license=('custom:KiCS2')
depends=('glibc' 'gmp')
makedepends=('base-devel' 'stack' 'ghc' 'make' 'gcc' 'python' 'pakcs')
source=("https://www.curry-lang.org/kics2/download/kics2-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('f5360525d09240d21d710018e3d9627d15fa605b892d7b8b6ffaa783365d3285')
provides=('curry-compiler')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-x86_64-linux"
  # force using the system ghc version
  # sed -i 's|STACK = $(STACKBIN)|STACK = $(STACKBIN) --system-ghc --no-install-ghc|' Makefile
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-x86_64-linux"

  # make sure that system stack is found first
  export PATH=/usr/bin:$PATH
  # make sure that the compiler environment is sane
  export CC=gcc
  export CXX=g++
  export LD=ld

  export KICS2INSTALLDIR=/usr/lib/kics2
  export STACK_ROOT="${srcdir}/stack-root"
  msg2 "Building KiCS2 (can take more than 10min)..."
  make CURRY=pakcs all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-x86_64-linux"

  # readme
  install -Dm644 README.md "${pkgdir}/usr/share/doc/kics2/README.md"

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/kics2/LICENSE"

  # main installation tree
  _installdir="${pkgdir}/usr/lib/kics2"
  install -d "${_installdir}"
  cp -a \
    bin \
    include \
    lib \
    runtime \
    utils \
    scripts \
    currytools \
    frontend \
    "${_installdir}/"

  # link binaries to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s ../lib/kics2/bin/kics2 "${pkgdir}/usr/bin/kics2"
  ln -s kics2 "${pkgdir}/usr/bin/curry-kics2"
}
