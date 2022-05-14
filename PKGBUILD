# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cl-split-sequence
_pkgname="${pkgname#cl-}"
pkgver=2.0.1
pkgrel=1
pkgdesc='Splits a sequence into a list of subsequences'
arch=('any')
url='https://github.com/sharplispers/split-sequence'
license=('MIT')
depends=('common-lisp' 'cl-asdf')
makedepends=('git')
checkdepends=('sbcl' 'cl-fiveam')
_commit='e1b91281e13e7e1490fdcaf7e8aeda04759ec3b7'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'run-tests.lisp'
)
b2sums=('SKIP'
        '93e14dac945dfd1331f3ec12a8489c2361544f59e0fc76157ce0223955dc53e722655fee9e606197251251ba499bc602d6492691477a8bbe3dd78d42418e3cc9')

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
    "$pkgdir/usr/share/common-lisp/source/$_pkgname" \
    "$pkgdir/usr/share/common-lisp/systems"

  # library
  install -vDm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" ./*.{lisp,asd}

  pushd "$pkgdir/usr/share/common-lisp/systems"
  ln -s "../source/$_pkgname/$_pkgname.asd" .
  popd
  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md original-message.txt

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
