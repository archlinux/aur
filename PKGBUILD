# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-utilities
pkgver=r39.gdce2d2f
pkgrel=1
pkgdesc='A collection of semi-standard utilities for Common Lisp'
arch=('any')
url='https://cl-utilities.common-lisp.dev/'
license=('custom:Public')
depends=('common-lisp' 'cl-asdf')
makedepends=('git')
checkdepends=('sbcl' 'cl-fiveam')
_commit='dce2d2f6387091ea90357a130fa6d13a6776884b'
source=(
  "$pkgname::git+https://gitlab.common-lisp.net/cl-utilities/cl-utilities.git#commit=$_commit"
  'run-tests.lisp'
)
b2sums=('SKIP'
        'd3253ddb6fae17ecb91d894d08dc04b902f6d1f6b4e5fd79963d71fed9e9543897d9016ae115ae6d11fd5b5fcb0d7cce3ebaa5d8bd711407e2064fb40e335dc2')

pkgver() {
  cd "$pkgname"

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"

  # license extraction
  sed -n '/License/,/with it/p' README > LICENSE
}

check() {
  cd "$pkgname"

  sbcl --script ../run-tests.lisp  
}

package() {
  cd "$pkgname"

  # library
  install -vDm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" ./*.{lisp,asd}

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README
  cp -vr doc "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
