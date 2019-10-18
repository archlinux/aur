# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname=maxima-jupyter-git
pkgver=r356.d9121c1
pkgrel=1
pkgdesc="A Maxima kernel for Jupyter, based on CL-Jupyter (Common Lisp kernel)"
arch=("any")
url="https://github.com/robert-dodier/maxima-jupyter"
license=('BSD')
depends=("maxima")
source=(
  "$pkgname::git+https://github.com/robert-dodier/maxima-jupyter.git"
  "https://beta.quicklisp.org/quicklisp.lisp"
  "load.lisp")
sha256sums=('SKIP'
            '4a7a5c2aebe0716417047854267397e24a44d0cce096127411e9ce9ccfeb2c17'
            'e7063f56f8308a9cc728f1f51964a4f0bcc762b6ffe69b8c57c6b021e2fafe73')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  tmpdir=$(mktemp -d -t $pkgname-XXXXXXXXXX)
  HOME=$tmpdir maxima --preload-lisp=load.lisp --batch-string="jupyter_system_install(false,\"$pkgdir\");"
  rm $pkgdir/usr/share/maxima-jupyter/bundle-info.sexp
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -rf $tmpdir
}
