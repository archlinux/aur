# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-lift
_name="${pkgname#cl-}"
pkgver=1.7.1.r47.ge08e84e
pkgrel=1
pkgdesc='The LIsp Framework for Testing'
arch=('any')
url='https://lift.common-lisp.dev'
license=('MIT')
depends=('common-lisp' 'cl-asdf')
makedepends=('git')
checkdepends=('sbcl')
_commit='e08e84e5800b5d62b048b0b96e7298d6b0917987'
source=("$pkgname::git+https://github.com/gwkkwg/lift#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # first known commit to receive latest version
  local _pkgver=1.7.1
  local _pkgcommit='46dc0f2d46e9877725253c466df199fd990c529d'

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
    compare data dev docs examples make resources test timeout website \
    ./*.asd lift-standard.config \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname"
  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname"/*.asd .
  popd

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
