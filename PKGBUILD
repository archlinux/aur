# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Filippo Squillace <sqoox85@gmail.com>

pkgname=visit-build
_pkgname=visit
pkgver=2.9.1
_pkgver=2_9_1
pkgrel=1
pkgdesc="Interactive parallel visualization and graphical analysis tool (built with build_visit)."
arch=('i686' 'x86_64')
url="https://wci.llnl.gov/simulation/computer-codes/visit"
_url="http://portal.nersc.gov"
license=('BSD' 'custom')
makedepends=('qtchooser' 'cmake' 'svn' 'java-runtime' 'gcc-fortran')
depends=('qtwebkit' 'python2-numpy' 'openmpi' 'glu' 'java-environment')
conflicts=('visit' 'visit-bin')
provides=('visit')
source=("${_url}/svn/${_pkgname}/trunk/releases/${pkgver}/build_${_pkgname}${_pkgver}"
        "visit.sh")

sha256sums=('21d5caffe4429dfe4865b8c45ff1f0718f8bca033766a6e35e1e2b5c7b109477'
            'd07a11e67ad646579fbc341f30e1eb63ebd38a5fbdd4f3ea36e8f460419028da')

prepare(){
  cd ${srcdir}

  # Fix to use python2
  sed -i 's/python-config/python2-config/g' build_${_pkgname}${_pkgver}
  sed -i 's/PYTHON_COMMAND="python"/PYTHON_COMMAND="python2"/g' build_${_pkgname}${_pkgver}
}

build() {
  cd "${srcdir}"

  export PAR_COMPILER=/usr/bin/mpicxx
  export PAR_INCLUDE=-I/usr/include
  export SILO_EXTRA_OPTIONS="LIBS='-lstdc++'"
  export FC_COMPILER=gfortran

  # To avoid some incompatibilities with Qt5
  export QT_SELECT=4

  mkdir -p build-${pkgver}
  mkdir -p thirdparty-${pkgver}

  # Fix in case the ${MAKEFLAGS} variable is empty
  if [ -z "${MAKEFLAGS}" ]; then
    MAKEFLAGS="-j1"
  fi

  echo yes | bash build_${_pkgname}${_pkgver} --console \
    --installation-build-dir "${srcdir}/build-${pkgver}" \
    --thirdparty-path "${srcdir}/thirdparty-${pkgver}" \
    --system-cmake --system-qt --system-python \
    --parallel-build --parallel \
    --makeflags ${MAKEFLAGS} \
    --cc gcc --cxx g++ --fortran \
    --build-mode Release \
    --java \
    --pyside \
    --silo \
    --xdmf \
    --netcdf \
    --szip --zlib \
    --hdf4 --hdf5


  # Fix to use python2 in every scripts
  cd "${srcdir}/build-${pkgver}/${_pkgname}${pkgver}"
  sed -i 's/exec\ python/exec\ python2/' \
    src/bin/frontendlauncher
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
    -i $(find . -name '*.py')
}

package(){
  cd "${srcdir}/build-${pkgver}/${_pkgname}${pkgver}/src"

  # The prefix could not be set in the build_visit script,
  # because it will install it in the build function of the PKGBUILD.
  sed -i 's/\/usr\/local/\/opt\/visit/' cmake_install.cmake

  make install DESTDIR="${pkgdir}"

  # License
  install -Dm644 "${srcdir}/build-${pkgver}/${_pkgname}${pkgver}/src/COPYRIGHT" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # Install script to set path
  install -Dm755 "${srcdir}/visit.sh" "${pkgdir}/etc/profile.d/visit.sh"
}

# vim:set ts=2 sw=2 et:
