# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-trivial-features
_pkgname="${pkgname#cl-}"
pkgver=1.0.r3.g35c5eeb
pkgrel=1
pkgdesc='Ensure consistent features across multiple Common Lisp implementations'
arch=('any')
url='https://github.com/trivial-features/trivial-features'
license=('MIT')
depends=('common-lisp' 'cl-asdf')
makedepends=('git' 'sbcl')
#checkdepends=('cl-rt' 'cl-cffi' 'cl-alexandria')
_commit='35c5eeb21a51671ffbfcb591f84498e782478a32'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

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
    src tests \
    ./*.{lisp,asd} \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname"/*.asd .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYRIGHT
}
