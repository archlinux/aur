# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Dacoda Strack <dacoda.strack@gmail.com>

pkgname=cl-bordeaux-threads
_pkgname="${pkgname#cl-}"
pkgver=0.8.8
pkgrel=4
pkgdesc='Portable shared-state concurrency for Common Lisp'
arch=('any')
url='https://sionescu.github.io/bordeaux-threads/'
license=('MIT')
depends=(
  'common-lisp'
  'cl-asdf'
  'cl-alexandria'
  'cl-global-vars'
  'cl-trivial-features'
  'cl-trivial-garbage'
)
makedepends=('git' 'sbcl')
checkdepends=('cl-fiveam')
_commit='076fe2380abbc59b06e495dc7a35aea8eb26ba3b'
source=("$pkgname::git+https://github.com/sionescu/bordeaux-threads#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./g'
}

check() {
  cd "$pkgname"

  sbcl \
    --eval '(require "asdf")' \
    --eval '(push (uiop/os:getcwd) asdf:*central-registry*)' \
    --eval '(asdf:load-system "bordeaux-threads/test")' \
    --eval '(asdf:load-system "fiveam")' \
    --eval '(unless (fiveam:run :bordeaux-threads) (uiop:quit 1))' \
    --quit
}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  cp -vr src test version.sexp "$_pkgname.asd" "$pkgdir/usr/share/common-lisp/source/$_pkgname"
  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README site/*

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
