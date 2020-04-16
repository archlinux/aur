# Maintainer: mickele
#Contributor: nema.arpit
pkgname=opensees
pkgver=3.2.0
pkgrel=1
pkgdesc="OpenSees, a software framework for developing applications to simulate the performance of structural and geotechnical systems subjected to earthquakes"
arch=("i686" "x86_64")
url="https://github.com/OpenSees/OpenSees"
depends=('tcl>=8.6' 'openssl' 'libpng' 'mesa' 'lapack' 'mumps' 'glu' 'openmpi' 'python')
makedepends=('git' 'gcc-fortran' 'gcc')
options=()
license=("custom")

# source=("https://github.com/OpenSees/OpenSees/archive/v${pkgver}.tar.gz" "Makefile.def")
source=("Makefile.def" "MPMakeFile.patch")

# _svntrunk="svn://opensees.berkeley.edu/usr/local/svn/OpenSees/trunk"
_gitrepo="https://github.com/OpenSees/OpenSees.git"
_gitrel="fb2159f0ea91a0b1703ec4bd8abebb49ad158fa2"
_gitmod="OpenSees"
_installdir="/usr"

prepare() {
  cd "${srcdir}"

  msg "Starting GIT checkout..."
  msg "${srcdir}"
  if [ -d ${srcdir}/${_gitmod}/.git ]; then
    (echo 'Copy of repository exists')
  else
    (git clone ${_gitrepo})
  fi
  cd OpenSees
  git checkout ${_gitrel}
  git checkout -- .

  msg "SVN checkout done or server timeout"

  cd "${srcdir}/${_gitmod}"

  msg "Configuring..."
  cp "${srcdir}/Makefile.def" ./ || return 1
  sed -e "s|\$(INSTALLDIR)|${srcdir}|" \
      -e "s|\$(SRCDIR)|${srcdir}|" \
      -i Makefile.def

  msg "Patching..."
  git apply "${srcdir}/MPMakeFile.patch"
  # Missing header
  # error: ‘Z_BEST_COMPRESSION’ was not declared in this scope
#  svn patch "${srcdir}/png-miss-header.patch"
  
  # Patch DistributedSuperLu.cpp to avoid min max macro conflict
  # between f2c.h and stl_algobase.h in gcc6
#  svn patch "${srcdir}/min-max-conflict.patch"
  
  # Fix STEELDR.f, potential bug in ShellMITC4.cpp
#  svn patch "${srcdir}/steeldr.f-bug.patch"
}

build() {
  cd "${srcdir}/${_gitmod}"

  msg "Building OpenSees..."
  mkdir -p "${srcdir}/lib"
  mkdir -p "${srcdir}/bin"
  make wipe
  make clean
  make
  
  msg "Building OpenSees Python Module"
  
  cd "${srcdir}/${_gitmod}/SRC/interpreter"
  make pythonmodule
  cp opensees.so "${srcdir}/bin"
  
  cd "${srcdir}/${_gitmod}"
  
  msg "Building OpenSeesMP..."
  make wipe
  make clean
  make "OpenSees_PROGRAM = ${srcdir}/bin/OpenSeesMP" "PROGRAMMING_MODE = PARALLEL_INTERPRETERS"
  
  msg "Building OpenSeesSP..."
  make wipe
  make clean
  make "OpenSees_PROGRAM = ${srcdir}/bin/OpenSeesSP" "PROGRAMMING_MODE = PARALLEL"
}

package(){
  msg "Installing binaries..."
  _pylibdir=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
  
  install -d -m755 "${pkgdir}${_installdir}/bin"
  install "${srcdir}/bin/OpenSees" "${pkgdir}${_installdir}/bin"
  install "${srcdir}/bin/OpenSeesMP" "${pkgdir}${_installdir}/bin"
  install "${srcdir}/bin/OpenSeesSP" "${pkgdir}${_installdir}/bin"
  
  install -d -m755 "${pkgdir}${_pylibdir}"
  install "${srcdir}/bin/opensees.so" "${pkgdir}${_pylibdir}"

  msg "Installing license..."
  install -D -m644 "${srcdir}/OpenSees/COPYRIGHT" \
	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('bcf43c4fcac86daf72659b723d88eb63'
         '6193c6e9f12912d04497b7b2a9c412ab')
