# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-unicode
pkgver=0.1.6.r11.g2790a6b
pkgrel=1
pkgdesc='Unicode library for Common Lisp'
arch=('any')
url='https://edicl.github.io/cl-unicode/'
license=('BSD')
depends=('common-lisp' 'cl-asdf' 'cl-ppcre')
makedepends=('git' 'sbcl' 'cl-flexi-streams')
_commit='2790a6b8912be1cb051437f463400b4a7198748a'
source=("$pkgname::git+https://github.com/edicl/cl-unicode#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./g'
}

prepare() {
  cd "$pkgname"

  sed \
    -n '/;;; Copyright/,/;;; SOFTWARE/p' "$pkgname.asd" \
    | sed -e 's/^;;; //' \
    > LICENSE
}

build() {
  cd "$pkgname"

  # cl-unicode generates parts of it's own source code automatically
  sbcl \
    --eval '(require :asdf)' \
    --eval "(progn (push \"$(pwd)/\" asdf:*central-registry*) (asdf:load-system :${pkgname}/build))" \
    --eval '(quit)'
}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  cp -vr build test ./*.lisp "$pkgname.asd" "$pkgdir/usr/share/common-lisp/source/$pkgname"

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$pkgname/$pkgname.asd"
  popd

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
