# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-global-vars
_pkgname="${pkgname#cl-}"
pkgver=1.0.0.r2.gc749f32
_pkgver='1.0.0'
_pkgcommit='cdb24d3cc7128f23af8f80d0b4e0dbc9c2d9a625'
pkgrel=1
pkgdesc='Define efficient global variables in Common Lisp'
arch=('any')
url='https://github.com/lmj/global-vars'
license=('MIT')
depends=('common-lisp' 'cl-asdf')
makedepends=('git' 'sbcl')
_commit='c749f32c9b606a1457daa47d59630708ac0c266e'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf '%s.r%s.g%s'  "$_pkgver" "$(git rev-list --count ${_pkgcommit}..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"

  # extract license
  sed -n '/;;; Copyright/,/;;; DEALINGS/p' global-vars.lisp | sed -e 's/^;; //g' > LICENSE
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
  ln -s "../source/$_pkgname"/*.asd .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
