# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-unit-test
_pkgname="${pkgname#cl-}"
pkgver=r1.g266afaf
pkgrel=1
pkgdesc='Unit testing framework for Common Lisp'
arch=('any')
url='https://github.com/hanshuebner/unit-test'
license=('custom')
depends=('common-lisp' 'cl-asdf')
makedepends=('git')
checkdepends=('sbcl')
_commit='266afaf4ac091fe0e8803bac2ae72d238144e735'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'run-tests.lisp'
)
b2sums=('SKIP'
        '54e93e82e4ac6c3a2bc62132c22f4eef4a28f8625e3f571e2170d3dd80a21c5e196a146283d42c2204035bedec5c6cd8cb360e12fe22aea09d6ae06a10bab934')

pkgver() {
  cd "$pkgname"

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"

  sed -n '/;; Copyright/,/;; of any kind/p' "$_pkgname.lisp" > LICENSE
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

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE  
}
