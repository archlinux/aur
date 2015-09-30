# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Filippo Squillace <sqoox85@gmail.com>

pkgname=visit-build
_pkgname=visit
pkgver=2.9.2
_pkgver=2_9_2
pkgrel=2
pkgdesc="Interactive parallel visualization and graphical analysis tool (built with build_visit)."
arch=('i686' 'x86_64')
url="https://wci.llnl.gov/simulation/computer-codes/visit"
license=('BSD' 'custom')
makedepends=('qtchooser' 'cmake' 'svn' 'java-runtime' 'gcc-fortran')
depends=('qtwebkit' 'python2-numpy' 'openmpi' 'glu' 'java-environment')
conflicts=('visit' 'visit-bin')
provides=('visit')
source=("https://portal.nersc.gov/svn/${_pkgname}/trunk/releases/${pkgver}/build_${_pkgname}${_pkgver}"
        "https://portal.nersc.gov/svn/${_pkgname}/trunk/releases/${pkgver}/${_pkgname}${pkgver}.tar.gz"
        "visit.sh"
        'no_extract_visit.patch')
sha256sums=('4b1d396b41923b3b2c1b2da2524cb424f0166d9898d04f367f52a0426ae7a688'
            '97d19e2609fbba655772feb055919b925214ab68c95ff46481572bd7e9c9ea31'
            'd07a11e67ad646579fbc341f30e1eb63ebd38a5fbdd4f3ea36e8f460419028da'
            '13f14a8b61cf4b59155c2f1d22fc59e670615343b8b9d78dfbfd9c2e321f6cc7')

prepare(){
  cd "${srcdir}"

  # Fix to use python2 in the build script
  sed -i -e 's/python-config/python2-config/g' -e 's/PYTHON_COMMAND="python"/PYTHON_COMMAND="python2"/g'\
    "${srcdir}/build_${_pkgname}${_pkgver}"

  # Build directory
  #rm -rf -- "${srcdir}/build-${pkgver}"
  #mkdir -p "${srcdir}/build-${pkgver}"

  # Do not re-extract the visit source code
  patch < no_extract_visit.patch

  # Fix to use python2 in every scripts
  sed -i 's/exec\ python/exec\ python2/' \
    "${srcdir}/${_pkgname}${pkgver}/src/bin/frontendlauncher"
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
    -i $(find "${srcdir}/${_pkgname}${pkgver}/" -name '*.py')

  # Thirdparty libs
  #rm -rf -- "${srcdir}/thirdparty-${pkgver}"
  #mkdir -p "${srcdir}/thirdparty-${pkgver}"

  # Download all files with '--download-only' option
  _build_command ${srcdir} --download-only
}
build() {
  cd "${srcdir}"

  export PAR_COMPILER=/usr/bin/mpicxx
  export PAR_INCLUDE=-I/usr/include
  export SILO_EXTRA_OPTIONS="LIBS='-lstdc++'"
  export FC_COMPILER=gfortran
  export FCFLAGS="-O2"

  # Fix in case the ${MAKEFLAGS} variable is empty
  if [ -z "${MAKEFLAGS}" ]; then
    MAKEFLAGS="-j1"
  fi

  _build_command ${srcdir} "--makeflags ${MAKEFLAGS}"

}

package(){
  cd "${srcdir}/${_pkgname}${pkgver}/src"

  # The prefix could not be set in the build_visit script,
  # because it will install it in the build() function of the PKGBUILD,
  # so set it now.
  sed -i 's:/usr/local:/opt/visit:g' cmake_install.cmake

  make install DESTDIR="${pkgdir}"

  # License
  install -Dm644 "${srcdir}/build-${pkgver}/${_pkgname}${pkgver}/src/COPYRIGHT" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # Install script to set path
  install -Dm755 "${srcdir}/visit.sh" "${pkgdir}/etc/profile.d/visit.sh"
}

_build_command(){
  dir=${1}
  opt=${2}

  # To avoid some incompatibilities with Qt5
  export QT_SELECT=4

  echo yes | bash build_${_pkgname}${_pkgver} --console \
    --installation-build-dir "${dir}/build-${pkgver}" \
    --thirdparty-path "${dir}/thirdparty-${pkgver}" \
    --tarball "${dir}/${_pkgname}${pkgver}.tar.gz" \
    --system-cmake --system-qt --system-python \
    --parallel-build --parallel \
    --cc gcc --cxx g++ --fortran \
    --build-mode Release \
    --hdf4 \
    --hdf5 \
    --java \
    --netcdf \
    --silo \
    --szip \
    --xdmf \
    --zlib \
    ${opt}
}

# vim:set ts=2 sw=2 et:
