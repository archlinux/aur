# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-fiasco
_pkgname="${pkgname#cl-}"
pkgver=r310.gbb47d2f
pkgrel=1
pkgdesc='A Common Lisp test framework that treasures your failures'
arch=('any')
url='https://github.com/joaotavora/fiasco'
license=('MIT')
depends=('common-lisp' 'cl-asdf' 'cl-alexandria' 'cl-trivial-gray-streams')
makedepends=('git')
checkdepends=('sbcl')
_commit='bb47d2fef4eb24cc16badc1c9a73d73c3a7e18f5'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'run-tests.lisp'
)
b2sums=('SKIP'
        '81f24fccac6aae28374f3a7cf8e3bcc0ce148bb41ae3c4831bede57dd4068103fe4e4bac4905a702a560027d4fa02434eea9bafb07441fe3e626785e3df0c169')

pkgver() {
  cd "$pkgname"

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  cp -vr src test "$_pkgname.asd" "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE
}
