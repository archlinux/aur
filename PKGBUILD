# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=cl-alexandria
_pkgname="${pkgname#cl-}"
pkgver=1.4.r16.g72882fc
pkgrel=1
pkgdesc='A set of Common Lisp Utilities'
arch=('any')
url='https://alexandria.common-lisp.dev'
license=('MIT')
depends=('cl-asdf' 'common-lisp')
makedepends=('git' 'sbcl' 'texlive-core')
_commit='72882fc73e1818c51490a22c4670f35af545d868'
source=("$pkgname::git+https://gitlab.common-lisp.net/alexandria/alexandria.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./g'
}

build() {
  cd "$pkgname"

  make -C doc html info
}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  cp -vr "$_pkgname.asd" alexandria-{1,2} "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" doc/alexandria.html
  install -vDm644  doc/alexandria.info "$pkgdir/usr/share/info/$pkgname.info"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE
}
