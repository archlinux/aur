# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname=common-lisp-jupyter-git
pkgver=r584.4e4d1f4
pkgrel=1
pkgdesc="A Common Lisp kernel for Jupyter."
arch=("any")
url="https://github.com/robert-dodier/maxima-jupyter"
license=('MIT')
depends=("sbcl")
source=(
  "$pkgname::git+https://github.com/yitzchak/common-lisp-jupyter.git"
  "https://beta.quicklisp.org/quicklisp.lisp"
  "load.lisp")
sha256sums=('SKIP'
            '4a7a5c2aebe0716417047854267397e24a44d0cce096127411e9ce9ccfeb2c17'
            'b114d91b4089941ea037e60249c0c50696e8510f75403c651f49113ed71c33ca')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  tmpdir=$(mktemp -d -t $pkgname-XXXXXXXXXX)
  HOME=$tmpdir sbcl --load load.lisp --eval "(cl-jupyter:install :system t :prefix \"$pkgdir\")" --quit
  rm $pkgdir/usr/share/common-lisp-jupyter/bundle-info.sexp
  install -Dm644 $pkgname/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  rm -rf $tmpdir
}
