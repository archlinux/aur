# Maintainer: Tarn W. Burton <twburton@gmail.com>
_srcname=clasp
pkgname=clasp-cl
pkgname=clasp-cl-git
pkgver=0.4.2.r4358.g19fef908c
pkgrel=1
pkgdesc="Bringing Common Lisp and C++ Together"
arch=('x86_64')
url="https://github.com/clasp-developers/clasp"
license=('LGPL')
depends=('boost' 'expat' 'gmp' 'libbsd' 'libedit'
         'libelf' 'libffi' 'llvm13' 'netcdf' 'ncurses' 'zlib')
makedepends=('git' 'python' 'sbcl')
provides=('cclasp-boehm' 'common-lisp' 'clasp-cl' 'cando')
source=('git://github.com/clasp-developers/clasp.git'
        'wscript.config')
sha512sums=('SKIP'
            'd58f230bdd46e814d807fccb8cfc84c742b77f08bad219159d2dc70a6b867d90ff0d33fcb9d4bfbbfed58a4aaef77d815e9274f12d55b1ff041910dc788b28a0')

pkgver() {
  cd "$_srcname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname/"
  cp ../wscript.config .
  if [ ! -e "extensions/cando" ]; then
    git clone https://github.com/cando-developers/cando extensions/cando
  else
    cd extensions/cando && git fetch && git pull && cd ../..
  fi
  if [ ! -e "extensions/seqan-clasp" ]; then
    git clone https://github.com/clasp-developers/seqan-clasp.git extensions/seqan-clasp
  else
    cd extensions/seqan-clasp && git fetch && git pull && cd ../..
  fi
  sed -i s/\"--link-static\",//g wscript
  sed -i s/stlib/lib/g extensions/cando/wscript
  sed -i s/STLIB/LIB/g extensions/cando/wscript
  ./waf configure --enable-jupyter
  ./waf build_dboehmprecise
}

package() {
  cd "$_srcname/"
  ./waf install_dboehmprecise --destdir "$pkgdir"
}
