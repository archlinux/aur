# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-md5
_pkgname="${pkgname#cl-}"
pkgver=2.0.5
pkgrel=1
pkgdesc='MD5 Implementation for Common Lisp'
arch=('any')
url='https://github.com/pmai/md5'
license=('custom:Public' 'custom:CC0-1.0')
depends=('common-lisp' 'cl-asdf' 'cl-flexi-streams')
makedepends=('git')
checkdepends=('sbcl')
_commit='906593fa6f4c3bb351cd02dbb6509062aacdaaf6'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'run-tests.lisp'
)
b2sums=('SKIP'
        '43c2f7f1cec316e29178b618aeb307904af4482bbb487f2c6abddd90962e8acbc148e2a5a44ff8c901f7d4606dbcc14eb50bfcf355096fd924623f91b24fbaa8')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^release-//'
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
  ln -s "../source/$_pkgname"/*.asd .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md NEWS

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
