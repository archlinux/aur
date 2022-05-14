# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-anaphora
_pkgname="${pkgname#cl-}"
pkgver=0.9.8
pkgrel=1
pkgdesc='The Anaphoric Macro Package from Hell'
arch=('any')
url='https://anaphora.common-lisp.dev'
license=('MIT')
depends=('common-lisp' 'cl-asdf')
makedepends=('git')
checkdepends=('sbcl' 'cl-rt')
_commit='bcf0f7485eec39415be1b2ec6ca31cf04a8ab5c5'
source=(
  "$pkgname::git+https://github.com/spwhitton/anaphora#commit=$_commit"
  'run-tests.lisp'
)
b2sums=('SKIP'
        'ed127d57e783c1f0a478e88369e1f9cc80ac5a54961d4f1fd887c574097b9b958401978ea413ccf5147360c92ff0abb030019d38d5d93d439cbe18f3de5a0837')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//'
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
  install -vDm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" ./*.{lisp,asd}
  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
