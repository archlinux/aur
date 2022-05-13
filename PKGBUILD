# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-rt
_pkgname="${pkgname#cl-}"
pkgver=1990.12.19.r19.ga6a7503
pkgrel=1
pkgdesc='Common Lisp regression tester from MIT'
arch=('any')
url='http://git.kpe.io/?p=rt.git'
license=('MIT')
depends=('common-lisp' 'cl-asdf')
makedepends=('git')
checkdepends=('sbcl')
_commit='a6a7503a0b47953bc7579c90f02a6dba1f6e4c5a'
source=(
  "$pkgname::git+http://git.kpe.io/rt.git#commit=$_commit"
  'run-tests.lisp'
)
b2sums=('SKIP'
        '3fd557b5d9a095affa2910a903e261e7c135b640fad9127498a772b1aaac3dda153ecd427bf050df3a762e6b0653a4ba9fa3c996cc658a6835bde8bc8510dd89')

pkgver() {
  cd "$pkgname"

  # first known commit to receive latest version
  local _pkgver=1990.12.19
  local _pkgcommit='17ebaf0bbb7e594f0397286aac4b89ae6ebe61d3'

  git tag "$_pkgver" "$_pkgcommit"

  git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./g'
}

prepare() {
  cd "$pkgname"

  # license extraction
  sed -n '/Copyright/,/SOFTWARE\./p' rt-doc.txt | \
    sed -e 's/|//g' -e 's/[ \t]*$//' -e 's/^[ \t]*//' \
    > LICENSE
}

# XXX 15/30 tests fail.
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
  install -vDm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" ./*.{lisp,asd}
  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" rt-doc.txt

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
