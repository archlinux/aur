# Maintainer: Tarn W. Burton <twburton@gmail.com>
pkgname=cando-git
pkgver=2.1.0_1_g271276dbe_ga01a9a5a
pkgrel=1
pkgdesc="Bringing Common Lisp and C++ Together, including Cando"
arch=('x86_64')
url="https://github.com/clasp-developers/clasp"
license=('LGPL')
options+=(!strip)
depends=('boost' 'expat' 'fmt' 'gmp' 'libbsd' 'libedit' 'clang' 'zeromq'
         'libelf' 'libffi' 'llvm' 'netcdf' 'ninja' 'ncurses' 'zlib')
makedepends=('git' 'sbcl' 'pkg-config')
provides=('cclasp-boehm' 'common-lisp' 'clasp-cl' 'cando')
conflicts=('cando' 'clasp-cl' 'clasp-cl-git')
source=('git+https://github.com/clasp-developers/clasp.git')
sha512sums=('SKIP')

prepare() {
  cd clasp
  ./koga --reproducible-build --broken-stdlib --package-path=$pkgdir --extensions=cando,seqan-clasp --bin-path=/usr/bin/ --share-path=/usr/share/clasp/ --lib-path=/usr/lib/clasp/
  ./koga --skip-sync --extensions=cando,seqan-clasp --update-version
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
