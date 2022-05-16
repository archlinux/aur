# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-3bmd
_pkgname="${pkgname#cl-}"
pkgver=r106.g4e08d82
pkgrel=1
pkgdesc='Markdown processor in Common Lisp using Esrap parser'
arch=('any')
url='https://github.com/3b/3bmd'
license=('MIT')
depends=(
  'common-lisp'
  'cl-asdf'
  'cl-split-sequence'
  'cl-esrap'
  'cl-alexandria'
  'cl-colorize'
  'python-pygments'
)
makedepends=('git')
checkdepends=('sbcl' 'cl-fiasco')
_commit='4e08d82d7c8fb1b8fc708c87f4d9d13a1ab490cb'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'run-tests.lisp'
)
b2sums=('SKIP'
        '0438150ad0f16fa0c074e7b32e5cb411274da81ff715a3062abd6cb01f47f9fcc2ac94fe5e69837f8737977112683453e59cf0c0c1708a438095075516362d45')

pkgver() {
  cd "$pkgname"

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  install -vDm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" ./*.{lisp,asd,py}

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
