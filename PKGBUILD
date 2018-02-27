# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname=maxima-jupyter-git
pkgver=r157.155a290
pkgrel=1
pkgdesc="A Maxima kernel for Jupyter, based on CL-Jupyter (Common Lisp kernel)"
arch=("x86_64")
url="https://github.com/robert-dodier/maxima-jupyter"
license=('BSD')
depends=("maxima")
source=(
  "$pkgname::git+https://github.com/robert-dodier/maxima-jupyter"
  'https://beta.quicklisp.org/quicklisp.lisp'
  'kernel.json')
sha256sums=('SKIP'
            '4a7a5c2aebe0716417047854267397e24a44d0cce096127411e9ce9ccfeb2c17'
            'f322412b5d9ec8907f35000d87c26767bb014b73bff8399ac90371c6adae5697')
options=('!strip')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  rm -rf quicklisp bin
  mkdir -p quicklisp bin
  maxima --lisp=sbcl <<END
parse_string("1");
:lisp (load "quicklisp.lisp")
:lisp (quicklisp-quickstart:install :path "quicklisp")
:lisp (ql:quickload "cffi")
:lisp (load "maxima-jupyter-git/load-maxima-jupyter.lisp")
:lisp (sb-ext:save-lisp-and-die "bin/maxima-jupyter" :toplevel 'cl-jupyter:kernel-start :executable t)
END
}

package() {
  install -Dm755 bin/maxima-jupyter "$pkgdir/usr/share/jupyter/kernels/maxima/maxima-jupyter"
  install -Dm644 kernel.json "$pkgdir/usr/share/jupyter/kernels/maxima/kernel.json"
}
