# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=clasp-cl-git
pkgver=1.0.0_325_gda3906a15
pkgrel=1
pkgdesc="Bringing Common Lisp and C++ Together"
arch=('x86_64')
url="https://github.com/clasp-developers/clasp"
license=('LGPL')
options+=(!strip)
depends=('boost' 'expat' 'fmt' 'gmp' 'libbsd' 'libedit' 'clang13'
         'libelf' 'libffi' 'llvm13' 'ncurses' 'zlib')
makedepends=('git' 'sbcl' 'ninja' 'pkg-config')
provides=('cclasp-boehm' 'common-lisp' 'clasp-cl')
conflicts=('cando-git')
source=('git+https://github.com/clasp-developers/clasp.git')
sha512sums=('SKIP')

prepare() {
  cd clasp
  ./koga --reproducible-build --package-path=$pkgdir --llvm-config=/usr/lib/llvm13/bin/llvm-config --bin-path=/usr/bin/ --share-path=/usr/share/clasp/ --lib-path=/usr/lib/clasp/
  ./koga --skip-sync --update-version
}

pkgver() {
  cd clasp
  sbcl --noinform --non-interactive --eval "(write-string (substitute #\_ #\- (getf (with-open-file (s \"version.sexp\") (read s)) :version)))"
}

build() {
  cd clasp
  ninja -C build
}

package() {
  cd clasp
  ninja -C build install
}

