# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-rt
_pkgname="${pkgname#cl-}"
pkgver=r20.ga6a7503
pkgrel=1
pkgdesc='Common Lisp regression tester from MIT'
arch=('any')
url='http://git.kpe.io/?p=rt.git'
license=('MIT')
depends=('common-lisp' 'cl-asdf')
makedepends=('git' 'sbcl')
_commit='a6a7503a0b47953bc7579c90f02a6dba1f6e4c5a'
source=("$pkgname::git+http://git.kpe.io/rt.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"

  # license extraction
  sed -n '/Copyright/,/SOFTWARE\./p' rt-doc.txt | sed -e 's/|//g' -e 's/[ \t]*$//' -e 's/^[ \t]*//' > LICENSE
}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  install -vDm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" ./*.{lisp,asd}
  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" rt-doc.txt

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
