# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-colorize
_pkgname="${pkgname#cl-}"
pkgver=0.9.r9.gea676b5
pkgrel=1
pkgdesc='A syntax highlighting library'
arch=('any')
url='https://github.com/kingcons/colorize'
license=('MIT')
depends=('common-lisp' 'cl-asdf' 'cl-alexandria' 'cl-html-encode' 'cl-split-sequence')
makedepends=('git')
_commit='ea676b584e0899cec82f21a9e6871172fe3c0eb5'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # first known commit to receive latest version
  local _pkgcommit='dd6783a77d3ba9ab1b4f26368e79f9660bab9957'
  local _pkgver=0.9

  git tag "$_pkgver" "$_pkgcommit"

  git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./g'
}

prepare() {
  cd "$pkgname"

  # license generation
  echo "MIT\n\nBrian Mastenbrook\nBrit Butler <redline6561@gmail.com>" > LICENSE
}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  install -vDm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" ./*.{lisp,asd,txt,lisp-expr}

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md docs/colorize.html

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
