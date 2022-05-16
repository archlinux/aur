# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-hu-dwim-stefil
_pkgname='hu.dwim.stefil'
pkgver=r257.g7a17248
pkgrel=1
pkgdesc='A simple test framework in Common Lisp'
arch=('any')
url='https://github.com/hu-dwim/hu.dwim.stefil'
license=('MIT')
depends=('common-lisp' 'cl-asdf' 'cl-alexandria')
makedepends=('git')
checkdepends=('sbcl')
_commit='7a172486ea51c5d38836e5b209d7135014506d19'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'run-tests.lisp'
)
b2sums=('SKIP'
        'f2db21db5957adcdf6ecf9c015795bcd03d982d961a2ea4ff7c4e53c8086d29c4fcaaa822358c4a1e9bebf5e3698d020afb1177715ed1f521ba772861ffc9b3e')

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
  cp -vr integration source test ./*.asd "$pkgdir/usr/share/common-lisp/source/$_pkgname"

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname"/*.asd .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE
}
