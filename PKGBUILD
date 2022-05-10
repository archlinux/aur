# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-flexi-streams
_pkgname="${pkgname#cl-}"
pkgver=1.0.19.r4.g74a1027
pkgrel=1
pkgdesc='Flexible bivalent streams for Common Lisp'
arch=('any')
url='https://edicl.github.io/flexi-streams/'
license=('BSD')
depends=('common-lisp' 'cl-asdf' 'cl-trivial-gray-streams')
makedepends=('git' 'sbcl')
_commit='74a1027311371a57258eba1bc908e050f5702277'
source=("$pkgname::git+https://github.com/edicl/flexi-streams#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./g'
}

prepare() {
  cd "$pkgname"

  sed -n '/;;; Copyright/,/;;; SOFTWARE/p' flexi-streams.asd \
    | sed 's/;;; //' \
    > LICENSE
}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  cp -vr test ./*.{lisp,asd} "$pkgdir/usr/share/common-lisp/source/$_pkgname"
  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  ln -s "../source/$_pkgname/$_pkgname-test.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md docs/index.html

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
