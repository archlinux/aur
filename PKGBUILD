# Maintainer: mickele
#Contributor: nema.arpit
pkgname=opensees
pkgver=2.5.0
pkgrel=2
pkgdesc="OpenSees, a software framework for developing applications to simulate the performance of structural and geotechnical systems subjected to earthquakes"
arch=("i686" "x86_64")
url="http://opensees.berkeley.edu/"
depends=('tk>=8.6' 'openssl' 'libpng' 'mesa' 'lapack' 'mumps4' 'glu' 'openmpi')
makedepends=('svn' 'gcc-fortran')
options=()
license=("custom")

# source=("http://opensees.berkeley.edu/OpenSees/code/OpenSees${pkgver}.tar.gz" "Makefile.def")

# This release is available only through svn
# http://opensees.berkeley.edu/OpenSees/changeLog.php
source=("Makefile.def" "png-miss-header.patch" "min-max-conflict.patch" "steeldr.f-bug.patch")

# _svntrunk="svn://opensees.berkeley.edu/usr/local/svn/OpenSees/trunk"
_svntrunk="svn://peera.berkeley.edu/usr/local/svn/OpenSees/trunk"
_svnrel="6236"
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
  svn patch "${srcdir}/png-miss-header.patch"
  
  # Patch DistributedSuperLu.cpp to avoid min max macro conflict
  # between f2c.h and stl_algobase.h in gcc6
  svn patch "${srcdir}/min-max-conflict.patch"
  
  # Fix STEELDR.f, potential bug in ShellMITC4.cpp
  svn patch "${srcdir}/steeldr.f-bug.patch"
}

build() {
  cd "${srcdir}/${_svnmod}"

  msg "Building OpenSees..."
  mkdir -p "${srcdir}/lib"
  mkdir -p "${srcdir}/bin"
  make wipe
  make
  
  msg "Building OpenSeesMP..."
  make wipe
  make "OpenSees_PROGRAM = ${srcdir}/bin/OpenSeesMP" "PROGRAMMING_MODE = PARALLEL_INTERPRETERS"
  
  msg "Building OpenSeesSP..."
  make wipe
  make "OpenSees_PROGRAM = ${srcdir}/bin/OpenSeesSP" "PROGRAMMING_MODE = PARALLEL"
}

package(){
  msg "Istalling binary..."
  install -d -m755 "${pkgdir}${_installdir}/bin"
  install "${srcdir}/bin/OpenSees" "${pkgdir}${_installdir}/bin"
  install "${srcdir}/bin/OpenSeesMP" "${pkgdir}${_installdir}/bin"
  install "${srcdir}/bin/OpenSeesSP" "${pkgdir}${_installdir}/bin"

  msg "Istalling licence..."
  install -D -m644 "${srcdir}/OpenSees/COPYRIGHT" \
	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('cfcbd913cf332951aa326614e161fee3'
         'b8f21b0e77db6338fd6550ba3aaf8057'
         '2e451d6e144b0e1a61e4efe622ef39b0'
         'b572eee6bfd3ca03c2e541cdb1dcfcc7')
