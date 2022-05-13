# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-trivial-backtrace
_pkgname="${pkgname#cl-}"
pkgver=1.1.0.r20.g6eb65bd
pkgrel=1
pkgdesc='Portable API to work with backtraces in Common Lisp'
arch=('any')
url='https://github.com/gwkkwg/trivial-backtrace'
license=('MIT')
depends=('common-lisp' 'cl-asdf')
makedepends=('git' 'sbcl')
#checkdepends=('cl-lift')
_commit='6eb65bde7229413040c81d42ea22f0e4c9c8cfc9'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # first known commit to receive latest version
  local _pkgcommit='3d39b1101e6fc59ef57c0ef049f3411d6da3e878'
  local _pkgver=1.1.0 
  git tag "$_pkgver" "$_pkgcommit"

  git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./g'
}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  cp -vr \
    dev test \
    lift-standard.config ./*.asd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname"/*.asd .
  popd

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
