# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-trivial-with-current-source-form
_pkgname="${pkgname#cl-}"
pkgver=0.1.0.r8.g3898e09
pkgrel=1
pkgdesc='A library to help macro writers produce better errors for macro users'
arch=('any')
url='https://github.com/scymtym/trivial-with-current-source-form'
license=('LGPL3')
depends=('common-lisp' 'cl-asdf' 'cl-alexandria')
makedepends=('git')
_commit='3898e09f8047ef89113df265574ae8de8afa31ac'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # first known commit to receive latest version
  local _pkgver='0.1.0'
  local _pkgcommit='021b16cac6e6ba6a70a24884d6fc93a30e2359a5'

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
    code \
    version-string.sexp ./*.asd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname"/*.asd .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.org
  cp -vr pictures "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
