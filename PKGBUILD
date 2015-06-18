# Maintainer: Benjamin Chrétien <chretien at lirmm dot fr>
pkgname=arrayfire-git
pkgdesc="High performance software library for parallel computing with an easy-to-use API."
url='https://github.com/arrayfire/arrayfire'
pkgver=3.0.1
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake' 'git' 'subversion')
depends=('cblas' 'fftw')

optdepends=('openblas: faster blas support'
            'cuda: Required for building CUDA backend'
            'libclc: Required for building OpenCL backend'
            'opencl-headers: Required for building OpenCL backend'
            'boost: Required for CUDA and OpenCL backends'
            'freeimage: Required to build image support')
_dir=arrayfire
source=("$_dir"::'git://github.com/arrayfire/arrayfire.git'#branch=master)
md5sums=('SKIP')
provides=('arrayfire')
conficts=('arrayfire')

# CMake options
_cmake_options=(
  -DCMAKE_INSTALL_PREFIX="/usr"
  -DBUILD_CPU=ON
  -DCMAKE_BUILD_TYPE=Release
  -DBUILD_EXAMPLES=OFF
  -DBUILD_TESTS=ON
)

pkgver() {
  cd ${srcdir}/${_dir}
  _version_major=$(sed -ne "s/.*AF_VERSION_MAJOR \"\([0-9\.]\+\)\".*/\1/p" ${srcdir}/${_dir}/CMakeModules/Version.cmake)
  _version_minor=$(sed -ne "s/.*AF_VERSION_MINOR \"\([0-9\.]\+\)\".*/\1/p" ${srcdir}/${_dir}/CMakeModules/Version.cmake)
  _version_patch=$(sed -ne "s/.*AF_VERSION_PATCH \"\([0-9\.]\+\)\".*/\1/p" ${srcdir}/${_dir}/CMakeModules/Version.cmake)
  echo "${_version_major}.${_version_minor}.${_version_patch}"
}

check_optdepends() {
  # Check if CUDA and related dependencies are installed
  if (pacman -Qqs cuda >/dev/null &&
      pacman -Qqs boost >/dev/null) ; then
    msg "Enabling CUDA support"
    _cmake_options=(${_cmake_options[@]} \
      -DBUILD_CUDA=ON -DCUDA_TOOLKIT_ROOT_DIR="/opt/cuda" \
      -DLIBNVVM_HOME="/opt/cuda/nvvm")
  else
    msg "Disabling CUDA support"
    _cmake_options=(${_cmake_options[@]} -DBUILD_CUDA=OFF)
  fi

  if (pacman -Qqs libclc >/dev/null &&
      pacman -Qqs opencl-headers >/dev/null &&
      pacman -Qqs boost >/dev/null); then
    msg "Enabling OpenCL support"
    _cmake_options=(${_cmake_options[@]} \
      -DBUILD_OPENCL=ON -DOPENCL_INCLUDE_DIRS="/usr/include/CL")
  fi
}

check() {
  cd "${srcdir}/build"

  # Run tests
  # make test
}

build() {
  # Check optional dependencies
  check_optdepends

  # Download Git submodules
  cd "${srcdir}/${_dir}"
  git submodule init
  git submodule update

  # Make build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Run CMake configuration
  cmake "${srcdir}/${_dir}" ${_cmake_options[@]}

  # Build
  make -j2
}

package() {
  cd "${srcdir}/build"

  # Install
  make DESTDIR="${pkgdir}/" install
}
