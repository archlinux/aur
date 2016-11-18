# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Filippo Squillace <sqoox85@gmail.com>

pkgname=visit-build
_pkgname=visit
pkgver=2.12.0
_pkgver=${pkgver//./_}
pkgrel=2
pkgdesc="Interactive parallel visualization and graphical analysis tool (built with build_visit)."
arch=('i686' 'x86_64')
url="https://wci.llnl.gov/simulation/computer-codes/visit"
license=('BSD' 'custom')
makedepends=('cmake' 'svn' 'java-runtime' 'gcc-fortran' 'wget')
depends=('qt5-webkit' 'qt5-svg' 'qt5-tools'  'python2-numpy' 'openmpi' 'glu' 'java-environment')
conflicts=('visit' 'visit-bin')
provides=('visit')
source=("https://portal.nersc.gov/svn/${_pkgname}/trunk/releases/${pkgver}/build_${_pkgname}${_pkgver}"
        "https://portal.nersc.gov/svn/${_pkgname}/trunk/releases/${pkgver}/${_pkgname}${pkgver}.tar.gz"
        "visit.sh"
        'no_install_qt5.patch'
        'no_extract_visit.patch'
        "vtk_gcc6.patch"
        "xdmf_stdc++.patch"
        'qt5-qpa.patch')
sha256sums=('8338f8512abe559e6cece231160b873a221c0d24c0fcc6a0a962cc6071cd6515'
            '5b4e1b9d5a0e7edaa64c53bab300c9c1e3a1a13494180156a4f25a9c6d078dd4'
            'd07a11e67ad646579fbc341f30e1eb63ebd38a5fbdd4f3ea36e8f460419028da'
            '8ec6767c3943c3b93c9817ef0d051799c5ebfac75e73e58175befd08bfd320e0'
            '6dfdf3fdf6e64437106fc4f9facc79e80ab204de12bb480c6209c6b3fc5b4e07'
            '77b1f762b05c660c2cb5f2b071533768fb6f905a2b7b14f4b4db29e0ada380bc'
            'a4633d62cb927d2860d2814fd1f8f965fdedd1479aeba8ae32810f1ff96e0068'
            'a523dd42c61ccd6743f23d35e63518c4dd33a465fa024e4431f002932464f26b')

options=(!emptydirs)

prepare(){
  cd "${srcdir}"

  # Fix to use python2 in the build script
  sed -i -e 's/python-config/python2-config/g' \
    -e 's/PYTHON_COMMAND="python"/PYTHON_COMMAND="python2"/g' \
    "${srcdir}/build_${_pkgname}${_pkgver}"

  # Build directory
  #rm -rf -- "${srcdir}/build"
  mkdir -p "${srcdir}/build"

  # Thirdparty libs
  #rm -rf -- "${srcdir}/thirdparty"
  mkdir -p "${srcdir}/thirdparty"

  # Do not re-extract the visit source code
  patch "${srcdir}/build_${_pkgname}${_pkgver}" no_extract_visit.patch

  # Do not install qt5
  patch "${srcdir}/build_${_pkgname}${_pkgver}" no_install_qt5.patch

  # Patch build_visit to apply patch that permits to build vtk with gcc6
  patch "${srcdir}/build_${_pkgname}${_pkgver}" vtk_gcc6.patch

  # Change standard to build xdmf
  patch "${srcdir}/build_${_pkgname}${_pkgver}" xdmf_stdc++.patch

  # Fix to use python2 in every scripts
  sed -i 's/exec\ python/exec\ python2/' \
    "${srcdir}/${_pkgname}${pkgver}/src/bin/frontendlauncher"
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
    -i $(find "${srcdir}/${_pkgname}${pkgver}/" -name '*.py')

  # Fix Qt5 path
  patch "${srcdir}/${_pkgname}${pkgver}/src/bin/frontendlauncher" qt5-qpa.patch

  # Download all files with '--download-only' option
  _build_command "${srcdir}" --download-only
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

  # Now build everything
  _build_command "${srcdir}" "--makeflags ${MAKEFLAGS}"

}

package(){
  cd "${srcdir}/${_pkgname}${pkgver}/src"

  # The prefix could not be set in the build_visit script,
  # because it will install it in the build() function of the PKGBUILD,
  # so set it now.
  sed -i 's:/usr/local:/opt/visit:g' cmake_install.cmake

  make install DESTDIR="${pkgdir}"

  # License
  install -Dm644 "${srcdir}/${_pkgname}${pkgver}/src/COPYRIGHT" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install script to set path
  install -Dm755 "${srcdir}/visit.sh" "${pkgdir}/etc/profile.d/visit.sh"
}

_build_command(){
  dir=${1}
  opt=${2}

  echo yes | bash build_${_pkgname}${_pkgver} --console \
    --installation-build-dir "${dir}/build" \
    --thirdparty-path "${dir}/thirdparty" \
    --tarball "${dir}/${_pkgname}${pkgver}.tar.gz" \
    --system-cmake --system-qt --system-python \
    --parallel-build --parallel \
    --cc gcc --cxx g++ --fortran \
    --cflag "${CFLAGS}" --cxxflag "${CXXFLAGS}" \
    --build-mode Release \
    --hdf4 \
    --hdf5 \
    --icet \
    --java \
    --netcdf \
    --openssl \
    --silo \
    --szip \
    --xdmf \
    --zlib \
    ${opt}
}

# vim:set ts=2 sw=2 et:
