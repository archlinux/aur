# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-iterate
_pkgname="${pkgname#cl-}"
pkgver=1.5.3.r12.gea90d81
pkgrel=1
pkgdesc='An iteration construct for Common Lisp'
arch=('any')
url='https://iterate.common-lisp.dev'
license=('MIT')
depends=('common-lisp' 'cl-asdf')
makedepends=('git')
checkdepends=('sbcl' 'cl-rt')
_commit='ea90d8188703cd4c66123a39d4d604f2bb03e96d'
source=(
  "$pkgname::git+https://gitlab.common-lisp.net/iterate/iterate.git#commit=$_commit"
  'run-tests.lisp'
)
b2sums=('SKIP'
        '19e7e1dae5906b3f9a2fa1ca4a5ca8f2c678bf2a681a07910f1cd9340628886a4de05c44f0d5b1a12436cae39a7fe1b11a64e4d83ea3c0ea62532fa58a67db13')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./g'
}

prepare() {
  cd "$pkgname"

  sed -n '/;;; Copyright/,/;; SOFTWARE/p' iterate-test.lisp | \
    sed -r 's/^:::?//' > LICENSE-TESTS

  sed -n '/ITERATE, An Iteration Macro/,/;;; SOFTWARE/p' iterate.lisp | \
    sed -r 's/^:::?//' > LICENSE
}

check() {
  cd "$pkgname"

  sbcl --script ../run-tests.lisp
}

package() {
  cd "$pkgname"
  
  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  install -vDm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" ./*.{lisp,asd}

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*
}
