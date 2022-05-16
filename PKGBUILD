# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-parenscript
_pkgname="${pkgname#cl-}"
pkgver=2.7.1.r21.g1fd720b
pkgrel=1
pkgdesc='Lisp to Javascript transpiler'
arch=('any')
url='https://gitlab.common-lisp.net/parenscript/parenscript'
license=('BSD' 'custom:GFDL-1.3')
depends=('common-lisp' 'cl-asdf' 'cl-ppcre' 'cl-anaphora' 'cl-named-readtables')
makedepends=('git')
checkdepends=('sbcl' 'cl-fiveam' 'cl-javascript')
_commit='1fd720bc4e2bc5ed92064391b730b9d4db35462a'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'run-tests.lisp'
)
b2sums=('SKIP'
        'c1074b6d201562663020b7b2100ba16d8b96677c15e4786dccfbfe41b91cc4ecdda79741b3c0f69e24a2b1dce300caa2a554e981b55ac56daea6f81aebf96cbf')

pkgver() {
  cd "$pkgname"

  # first known commit to receive latest version (sourced from NEWS)
  local _pkgver='2.7.1'
  local _pkgcommit='b8dd346d482b730a052902be1af724b16c6f2979'

  git tag "$_pkgver" "$_pkgcommit"

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
  cp -vr extras runtime src tests ./*.asd "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname"/*.asd .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" NEWS README ChangeLog
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
