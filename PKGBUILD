# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-ieee-floats
_pkgname="${pkgname#cl-}"
pkgver=1
pkgrel=1
pkgdesc='IEEE-754 implementation for Common Lisp'
arch=('any')
url='https://ieee-floats.common-lisp.dev'
license=('MIT')
depends=('common-lisp' 'cl-asdf')
makedepends=('git')
checkdepends=('sbcl' 'cl-fiveam')
_commit='9566ce8adfb299faef803d95736c780413a1373c'
source=(
  "$pkgname::git+https://github.com/marijnh/ieee-floats#commit=$_commit"
  'run-tests.lisp'
)
b2sums=('SKIP'
        '378cac3f5ff6fee4981f5d16ef105a258aa6ea53b4e442bd8288bb12aec0c329d3d70b21113298ba9539f9d54e3d5b55a89ab10058ee6bf49081c0b4425f1885')

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
  install -vDm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" ./*.{lisp,asd}
  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" doc/*

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
