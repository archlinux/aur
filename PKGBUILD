# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-esrap
_pkgname="${pkgname#cl-}"
pkgver=0.17.r21.g7588b43
pkgrel=1
pkgdesc='A Packrat/Parsing Grammar/TDPL parser for Common Lisp'
arch=('any')
url='https://scymtym.github.io/esrap/'
license=('MIT')
depends=(
  'common-lisp'
  'cl-asdf'
  'cl-alexandria'
  'cl-trivial-with-current-source-form'
)
makedepends=('git')
checkdepends=('sbcl' 'cl-fiveam')
_commit='7588b430ad7c52f91a119b4b1c9a549d584b7064'
source=(
  "$pkgname::git+https://github.com/scymtym/esrap#commit=$_commit"
  'run-tests.lisp'
)
b2sums=('SKIP'
        '4d8734eeaf99dc51455c53381ba45ec6449bd0895092ed0d30577d86e3f2b89da2aeb49ad0000d222fb14f43d2499562307610409383ccda475d93df64877ce4')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^release-//' -e 's/-/.r/' -e 's/-/./g'
}

prepare() {
  cd "$pkgname"

  # license extraction
  sed -n '/Copyright/,/DEALINGS/p' README.org | \
    sed -r 's/^[ ]*//' \
    > LICENSE
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
  cp -vr \
    src test\
    ./*.asd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname"/*.asd .
  popd

  # documentation
  # TODO create more documentation (see doc/)
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.org
  cp -vr examples "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
