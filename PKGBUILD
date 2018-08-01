# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT CoM>
# Contributor: Kibeom Kim <kkb110@gmail.com>

pkgname=getfem++
_pkgname=getfem
pkgver=5.3
pkgrel=1
pkgdesc="Generic C++ finite element library."
arch=('i686' 'x86_64')
url="http://getfem.org/"
license=('LGPL3')
depends=('python2-numpy' 'python2-scipy'
         'boost' 'qhull' 'qd'
         'muparser' 'metis4')
checkdepends=('perl')
makedepends=('gcc-fortran')
conflicts=('gmm')
provides=('getfem++' 'gmm')
source=("http://download-mirror.savannah.gnu.org/releases/getfem/stable/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('9d10a1379fca69b769c610c0ee93f97d3dcb236d25af9ae4cadd38adf2361749')

prepare(){
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Use metis4
  sed -i 's/-lmetis/-lmetis-4/g' configure

  # Fix qhull include
  sed -i 's/qhull\/qhull.h/libqhull\/qhull_a.h/g' configure
  sed -i 's/qhull\/qhull.h/libqhull\/qhull_a.h/g' src/getfem_mesher.cc
  sed -i 's/<qhull/<libqhull/g' src/getfem_mesher.cc

  # Use python2
  sed -i 's/env\ python/env\ python2/g' bin/extract_doc
  sed -i 's/env\ python/env\ python2/g' interface/tests/python/*.py
  sed -i 's/LOG_COMPILER\ =\ python/LOG_COMPILER\ =\ python2/g' interface/tests/python/Makefile.in
  sed -i 's/python\ setup.py/python2\ setup.py/g' interface/src/python/Makefile.in

  # Use shared library for qd
  sed -i 's/libqd.a/libqd.so/g' configure
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export PYTHON=python2
  export PYTHON_VERSION=2.7

  ./configure --prefix=/usr \
    --enable-shared --disable-static \
    --with-pic \
    --enable-qhull \
    --disable-mumps \
    --enable-superlu \
    --enable-muparser \
    --enable-metis \
    --enable-python \
    --disable-matlab \
    --disable-scilab

  make
}

#check() {
  #cd "${srcdir}/${_pkgname}-${pkgver}"

  #make check
#}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"

  rm -r "${pkgdir}/usr/getfem_toolbox"
}
