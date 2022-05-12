# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-trivial-garbage
_pkgname="${pkgname#cl-}"
pkgver=0.21.r8.gb3af9c0
pkgrel=1
pkgdesc='Provides a portable API to finalizers, weak hash-tables & weak pointers across multiple Common Lisp implementations'
arch=('any')
url='https://trivial-garbage.common-lisp.dev/'
license=('custom:Public')
depends=('common-lisp' 'cl-asdf')
makedepends=('git' 'sbcl')
#checkdepends=('cl-rt')
_commit='b3af9c0c25d4d4c271545f1420e5ea5d1c892427'
source=("$pkgname::git+https://github.com/trivial-garbage/trivial-garbage#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./g'
}

prepare() {
  cd "$pkgname"

  # extract license
  sed -n '/^It/p' README.md > LICENSE
}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  install -vDm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" ./*.{lisp,asd} build.xcvb

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname"/*.asd .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
