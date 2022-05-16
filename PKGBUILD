# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-try
_pkgname="${pkgname#cl-}"
pkgver=0.0.1.r23.ga1fffad
pkgrel=1
pkgdesc='A test framework for Common Lisp'
arch=('any')
url='https://melisgl.github.io/try'
license=('MIT')
depends=(
  'common-lisp'
  'cl-asdf'
  'cl-alexandria'
  'cl-closer-mop'
  'cl-ieee-floats'
  'cl-mgl-pax'
  'cl-trivial-gray-streams'
)
makedepends=('git')
checkdepends=('sbcl')
_commit='a1fffad2ca328b3855f629b633ab1daaeec929c2'
source=("$pkgname::git+https://github.com/melisgl/try#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # first known commit to receive latest version
  local _pkgcommit='a37c61f8b81d4bdf38f559bca54eef3868bb87a1'
  local _pkgver=0.0.1

  git tag "$_pkgver" "$_pkgcommit"

  git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./g'
}

#check() {
#  cd "$pkgname"
#
#  sbcl --script ../run-tests.lisp 
#}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  cp -vr \
    src test \
    ./*.asd \
    "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname"/*.asd .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README*

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
