# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-json
pkgver=0.6.0
pkgrel=1
pkgdesc='JSON encoder/decoder for Common Lisp'
arch=('any')
url='https://cl-json.common-lisp.dev/cl-json.html'
license=('MIT')
depends=('common-lisp' 'cl-asdf')
makedepends=('git')
checkdepends=('sbcl' 'cl-fiveam')
_commit='994dd38c94344383f39f95d75987f6dc47a0cca1'
source=(
  "$pkgname::git+https://github.com/sharplispers/cl-json#commit=$_commit"
  'run-tests.lisp'
)
b2sums=('SKIP'
        'd727167c38c4ab5f9e648ba5e2061c44928860689efaad3659837acfa627c1f40d82a0aa90ee308048207bed1ef0c115907802855db84a5ad6c7453192816c8c')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

check() {
  cd "$pkgname"

  sbcl --script ../run-tests.lisp
}

package() {
  cd "$pkgname"

  # create directories
  install -vd \
    "$pkgdir/usr/share/common-lisp/source/$pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  cp -vr src t "$pkgname.asd" "$pkgdir/usr/share/common-lisp/source/$pkgname"

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$pkgname/$pkgname.asd" .
  popd

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md doc/*

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
