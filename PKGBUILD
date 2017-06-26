# Maintainer: Frank Fishburn <frankthefishburn@gmail.com>
#_MATLAB_DIR=/opt/matlab/R2016b

pkgname=spm12
pkgver=6906
pkgrel=1
pkgdesc="A MATLAB toolbox for the analysis of brain imaging data sequences"
arch=('i686' 'x86_64')
url="http://www.fil.ion.ucl.ac.uk/spm/"
license=('GPL2')
makedepends=(make)
source=("http://www.fil.ion.ucl.ac.uk/spm/download/restricted/eldorado/spm12.zip")
sha1sums=('5f6016292557593378e0d396c401594e242b4307')

prepare() {

  cd "${srcdir}/spm12"

  if [ -z "${_MATLAB_DIR}" ]; then
    _MEX=$(which mex)
  else
    _MEX=${_MATLAB_DIR}/bin/mex
  fi

  if [ -f "${_MEX}" ]; then
    sed -i "/MEXBIN         = mex/c MEXBIN         = ${_MEX}" src/Makefile.var
    sed -i "s^largeArrayDims$^& CFLAGS=\"${CFLAGS} -fPIC\" CXXFLAGS=\"${CXXFLAGS} -fPIC\" LDFLAGS=\"${LDFLAGS}\"^g" src/Makefile.var
    find . -type f -name \*.mex\* -delete
  fi

}

build() {

  cd "${srcdir}/spm12/src"
  make clean
  make all
  make install

  cd "${srcdir}/spm12/external"
  make clean
  make all
  make install

}

package() {

  find "${srcdir}/spm12" -type d -name src -prune -exec rm -rv "{}" \;
  find "${srcdir}/spm12" -type f -name Makefile\* -delete

  mkdir "${pkgdir}/opt"
  mv "${srcdir}/spm12" "${pkgdir}/opt/"

}
