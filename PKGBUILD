# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-cffi
_pkgname="${pkgname#cl-}"
pkgver=0.24.1.r19.g3c76afe
pkgrel=1
pkgdesc='Common Foreign Function Interface for Common Lisp'
arch=('any')
url='https://cffi.common-lisp.dev/'
license=('MIT')
depends=(
  'common-lisp'
  'cl-asdf'
  'cl-babel'
  'cl-alexandria'
  'cl-trivial-features'
  'cl-ppcre'
  'cl-json'
  'libffi'
)
makedepends=('git')
checkdepends=('sbcl' 'cl-bordeaux-threads' 'cl-rt')
_commit='3c76afe7ba03ce015e0df99ac9ddcd61320a44a4'
source=("$pkgname::git+https://github.com/cffi/cffi#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./g'
}

prepare() {
  cd "$pkgname"

  # add local dir so asdf can pick up library
  sed \
    -i tests/run-tests.lisp \
    -e '/(require "asdf")/a (push (uiop/os:getcwd) asdf:*central-registry*)'
}

check() {
  cd "$pkgname"

  sbcl --script tests/run-tests.lisp 

  make clean
}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  cp -vr \
    examples grovel libffi src tests toolchain uffi-compat \
    ./*.asd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname"/*.asd .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYRIGHT
}
