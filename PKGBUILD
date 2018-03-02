# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname=maxima-jupyter-git
pkgver=r175.b121c57
pkgrel=1
pkgdesc="A Maxima kernel for Jupyter, based on CL-Jupyter (Common Lisp kernel)"
arch=("x86_64")
url="https://github.com/robert-dodier/maxima-jupyter"
license=('BSD')
depends=("maxima")
conflicts=('maxima-ecl')
options=('!strip')
source=(
  "$pkgname::git+https://github.com/robert-dodier/maxima-jupyter"
  'https://beta.quicklisp.org/quicklisp.lisp'
  'kernel.json')
sha256sums=('SKIP'
            '4a7a5c2aebe0716417047854267397e24a44d0cce096127411e9ce9ccfeb2c17'
            'a637eae8a7c50e0253c1ec29c26e3eda23b15b68cdf893bde67cf67cd658f2f1')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  rm -rf quicklisp bin
  mkdir -p quicklisp bin
  maxima <<END
parse_string("1");
:lisp (load "quicklisp.lisp")
:lisp (quicklisp-quickstart:install :path "quicklisp")
:lisp (ql:quickload "cffi")
:lisp (ql:quickload "trivial-dump-core")
:lisp (load "maxima-jupyter-git/load-maxima-jupyter.lisp")
:lisp (trivial-dump-core:save-executable "bin/maxima-jupyter" #'cl-jupyter:kernel-start)
quit();
END
}

package() {
  install -Dm755 bin/maxima-jupyter "$pkgdir/usr/bin/maxima-jupyter"
  install -Dm644 kernel.json "$pkgdir/usr/share/jupyter/kernels/maxima/kernel.json"
  install -Dm644 maxima-jupyter-git/LICENSE "$pkgdir/usr/share/licenses/maxima-jupyter-git/LICENSE" 
}
