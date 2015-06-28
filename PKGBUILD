# Maintainer: mickele
pkgname=opensees
pkgver=2.4.5
pkgrel=1
pkgdesc="OpenSees, a software framework for developing applications to simulate the performance of structural and geotechnical systems subjected to earthquakes"
arch=("i686" "x86_64")
url="http://opensees.berkeley.edu/"
depends=('tk>=8.6' 'openssl' 'libpng' 'mesa' 'lapack')
makedepends=('svn')
options=('')
license=("custom")

# This release is available only through svn
# http://opensees.berkeley.edu/OpenSees/changeLog.php
# source=("http://opensees.berkeley.edu/OpenSees/code/OpenSees${pkgver}.tar.gz" "Makefile.def")
source=("Makefile.def")

_svntrunk="svn://opensees.berkeley.edu/usr/local/svn/OpenSees/trunk"
_svnrel="5855"
_svnmod="OpenSees"
_installdir="/usr"

prepare() {
  cd "${srcdir}"

  msg "Starting SVN checkout..."
  if [ -d ${_svnmod}/.svn ]; then
      (cd ${_svnmod} && svn up -r ${_svnrel})
    else
      svn co ${_svntrunk} --config-dir ./ -r ${_svnrel} ${_svnmod}
  fi
  msg "SVN checkout done or server timeout"

  cd "${srcdir}/${_svnmod}"

  msg "Configuring..."
  cp "${srcdir}/Makefile.def" ./ || return 1
  sed -e "s|\$(INSTALLDIR)|${srcdir}|" \
      -e "s|\$(SRCDIR)|${srcdir}|" \
      -i Makefile.def
      
  msg "Patching..."
  # Missing header
  # error: ‘Z_BEST_COMPRESSION’ was not declared in this scope
  sed -e "s|#include <png.h>|#include <png.h>\n#include <zlib.h>|" \
      -i SRC/renderer/OpenGlDevice.cpp
}

build() {
  cd "${srcdir}/${_svnmod}"
  
  msg "Building..."
  mkdir -p "${srcdir}/lib"
  mkdir -p "${srcdir}/bin"
  make
}

package(){
  msg "Istalling binary..."
  install -d -m755 "${pkgdir}${_installdir}/bin"
  install "${srcdir}/bin/OpenSees" "${pkgdir}${_installdir}/bin"

  msg "Istalling licence..."
  install -D -m644 "${srcdir}/OpenSees/COPYRIGHT" \
	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('51bd92d2ef7acf6777c4ad48c8fa7cb3')
