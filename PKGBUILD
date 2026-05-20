pkgname=openmm
pkgver=8.5.1
pkgrel=1
pkgdesc="Toolkit for molecular simulation using high performance GPU code"
arch=('x86_64')
url="http://openmm.org/"
license=('MIT' 'LGPL')
depends=('fftw')
makedepends=('cmake' 'swig' 'doxygen' 'cython')
optdepends=('cuda: NVIDIA GPU support'
            'hip-runtime-amd: AMD GPU support'
            'rocm-cmake: AMD GPU support')
source=("https://github.com/pandegroup/openmm/archive/${pkgver}.tar.gz")
sha256sums=('16b2c2a4ce959be223ba4cc00dcb22a5d84ae3fb8c3948643632f6bda1ce6944')

#export CC=gcc-14
#export CXX=g++-14
#export FC=gfortran-14

build() {
  cd "${srcdir}"
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOPENMM_GENERATE_API_DOCS=ON \
    ../openmm-${pkgver}
  make
}

#check () {
#  msg2 "Testing openmm"
#  cd "${srcdir}"/build
#  #make test
#}

#check() {
#  msg2 "Testing openmm"
#  cd "${srcdir}/build"
#
#  env \
#    LD_LIBRARY_PATH="${PWD}" \
#    OPENMM_PLUGIN_DIR="${PWD}" \
#    ctest --output-on-failure
#}

check() {
  if [[ "${OPENMM_SKIP_TESTS:-0}" == "1" ]]; then
    warning "Skipping OpenMM tests because OPENMM_SKIP_TESTS=1"
    return 0
  fi

  msg2 "Testing openmm (It can take 2-3 hours)"
  cd "${srcdir}/build"

  env \
    LD_LIBRARY_PATH="${PWD}" \
    OPENMM_PLUGIN_DIR="${PWD}" \
    ctest --output-on-failure 2>&1 | tee test.log

  status=${PIPESTATUS[0]}

  # Ignore failures in stochastic tests 
  if (( status != 0 )); then
    failed=$(grep -c '\*\*\*Failed' test.log || true)
    stochastic=$(grep -c 'This test is stochastic and may occasionally fail' test.log || true)

    if (( failed > 0 && failed == stochastic )); then
      warning "Ignoring ${failed} stochastic OpenMM test failure(s)"
    else
      return "$status"
    fi
  fi
}

package() {
  cd "${srcdir}"/build
  msg2 "Installing openmm"
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}

  msg2 "Installing openmm python bindings"
  # Fix to install python wrapper
  sed -i 's:ENV{OPENMM_LIB_PATH} ":ENV{OPENMM_LIB_PATH} "$ENV{DESTDIR}:g' wrappers/python/pysetupinstall.cmake
  make DESTDIR="${pkgdir}" PythonInstall
  mv "${pkgdir}"/usr/licenses/*.txt "${pkgdir}"/usr/share/licenses/${pkgname}
  rm -rf "${pkgdir}"/usr/{bin,docs,examples,licenses}
}
