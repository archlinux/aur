# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-babel
_pkgname="${pkgname#cl-}"
pkgver=0.5.0.r20.gf892d05
pkgrel=1
pkgdesc='A charset encoding/decoding library for Common Lisp'
arch=('any')
url='https://babel.common-lisp.dev/'
license=('MIT')
depends=('common-lisp' 'cl-asdf' 'cl-alexandria' 'cl-trivial-features' 'cl-trivial-gray-streams')
makedepends=('git')
checkdepends=('sbcl' 'cl-hu-dwim-stefil')
_commit='f892d0587c7f3a1e6c0899425921b48008c29ee3'
source=(
  "$pkgname::git+https://github.com/cl-babel/babel#commit=$_commit"
  'run-tests.lisp'
)
b2sums=('SKIP'
        '7bec12f2bb118ff91c879a854134556e4bca5a01764bdba1c04ba3d4edcb25e8f33b2c9d8c7d574e41f526f68b9219c658135126e153691f12968c114a9c622e')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./g'
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
  cp -vr src tests ./*.asd "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname"/*.asd .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYRIGHT
}
