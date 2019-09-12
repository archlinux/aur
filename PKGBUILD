# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname=common-lisp-jupyter-git
pkgver=r574.322e3d6
pkgrel=1
pkgdesc="A Common Lisp kernel for Jupyter."
arch=("any")
url="https://github.com/robert-dodier/maxima-jupyter"
license=('MIT')
depends=("sbcl")
source=(
  "$pkgname::git+https://github.com/yitzchak/common-lisp-jupyter.git"
  "ziz-git::git+https://github.com/yitzchak/ziz.git"
  "https://beta.quicklisp.org/quicklisp.lisp"
  "load.lisp")
sha256sums=('SKIP'
            'SKIP'
            '4a7a5c2aebe0716417047854267397e24a44d0cce096127411e9ce9ccfeb2c17'
            'ec2135982cedf94075fa7ef5e93ee0a3a62e9ee14dc68a234c26bae2ab484078')

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
