# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-usocket
_pkgname="${pkgname#cl-}"
pkgver=0.8.4
pkgrel=1
pkgdesc='Universal socket library for Common Lisp'
arch=('any')
url='https://usocket.common-lisp.dev/'
license=('MIT')
depends=(
  'common-lisp'
  'cl-asdf'
  'cl-split-sequence'
  'cl-bordeaux-threads'
)
makedepends=('git')
checkdepends=('cl-rt')
_commit='57d7d00ed42d45803c0b3e4041413477fcec441a'
source=("$pkgname::git+https://github.com/usocket/usocket#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  cp -vr \
    backend tests vendor \
    ./*.{asd,lisp,sexp,system} \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname"/*.asd .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md notes/*

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
