# Maintainer:  <edgar@localhost>
_base=tvm
# pkgname="${_base}"-git
pkgname="${_base}"
pkgver=0.8.0
pkgrel=1
# epoch=
pkgdesc=""
arch=('x86_64')
url="https://tvm.apache.org/"
license=('Apache 2.0')
groups=()
depends=(
  # OpenCL (opencl-driver)
  "ocl-icd"
  "openmp"
  "llvm>=4.0"
  "mesa"
  "openblas"
  "openmp"
  # https://tvm.apache.org/docs/install/from_source.html
  "python38"
  "python-numpy"
  "python-decorator"
  "python-attrs"
  # ${_base}/python/gen_requirements.py
  "python-cloudpickle"
  "python-scipy"
  "python-psutil"
  "python-tornado"
  # Submodules
  "opencl-headers"
  # Submodules in AUR
  "cnpy" # cnpy-git
  "libbacktrace" # libbacktrace-git
)
makedepends=("gcc" "cmake>=3.18" "python-pip")
checkdepends=("gtest")
optdepends=(
  # See also "${_base}"/python/gen_requirements.py
  "python-typing_extensions: for tvmc (TVM command line driver)"
  "python-tornado: for RPC Tracker, auto-tuning module"
  "python-cloudpickle: auto-tuning module"
  "python-psutil: auto-tuning module"
  "xgboost>=1.1.0: auto-tuning module"
)
# provides=()
conflicts=(tvm-git)
# replaces=()
# backup=()
options=(!staticlibs)
# install=
# changelog=

# # cutlass (https://github.com/NVIDIA/cutlass.git)
# dlpack (https://github.com/dmlc/dlpack.git)
# dmlc-core (https://github.com/dmlc/dmlc-core.git)
# rang (https://github.com/agauniyal/rang.git)
# vta-hw (https://github.com/apache/tvm-vta.git)
# source=("git+https://github.com/apache/tvm"
#         # Submodules not in AUR
#         "git+https://github.com/NVIDIA/cutlass.git"
#         "git+https://github.com/dmlc/dlpack.git"
#         "git+https://github.com/dmlc/dmlc-core.git"
#         "git+https://github.com/agauniyal/rang.git"
#         "vta-hw::git+https://github.com/apache/tvm-vta.git")
# sha512sums=('SKIP'
#             'SKIP'
#             'SKIP'
#             'SKIP'
#             'SKIP'
#             'SKIP')
source=("https://www.apache.org/dyn/closer.lua/tvm/tvm-v${pkgver}/apache-tvm-src-v${pkgver}.tar.gz")
sha512sums=("328b3d5d851ac82f12a0d1402094e608dbfa5a4f6fb8d942a95b41695dc069f1cfcbe915294b3ae71bf2433e792d9e00809c63392d12d20d2f8c27476375d1dc")
# noextract=()

# pkgver() {
#   cd "${srcdir}"/"${_base}"
#   git describe --tags --match '*.*' | tr '-' '.' | sed 's-^v--'
# }

prepare() {
  rm "${srcdir}"/apache-"${_base}"-src-v"${pkgver}"*.tar.gz
  mv "${srcdir}"/apache-"${_base}"-src-v"${pkgver}"* "${srcdir}/${_base}"
  cd "${srcdir}/${_base}"

  # # * Update submodules
  # # git submodule update --init --recursive
  #
  # # ** Remove submodules for which there are packages
  # #    (names from .gitmodules)
  # for submod in cnpy OpenCL-Headers libbacktrace; do
  #   # https://stackoverflow.com/a/1260982
  #   git rm 3rdparty/"$submod"
  # done
  # git commit -m "Removed submodules"
  #
  # # ** Update submodules
  # #    (from AUR VCS guidelines)
  # git submodule init
  # for submod in cutlass dlpack dmlc-core rang vta-hw; do
  #   git config \
  #       submodule.3rdparty/"$submod".url "${srcdir}/$submod"
  # done
  # git -c protocol.file.allow=always submodule update

  # https://tvm.apache.org/docs/install/from_source.html
  _build="${srcdir}"/build
  [ ! -d "${_build}" ] && mkdir "${_build}"
  cp cmake/config.cmake "${_build}"

  cd "${_build}"
  python3.8 -m venv env
  source env/bin/activate
  # gen_requirements.py
  pip install setuptools numpy decorator attrs\
      cloudpickle psutil tornado scipy
  deactivate
}

build() {
  _build="${srcdir}"/build

  CONFOPTS=(
    -DUSE_OPENCL=ON
    -DUSE_TARGET_ONNX=ON
    -DUSE_GRAPH_EXECUTOR=ON
    -DUSE_PROFILE=ON
    -DUSE_RELAY_DEBUG=ON
    -DUSE_LLVM=ON
    -DUSE_CCACHE=AUTO
    -DUSE_PIPELINE_EXECUTOR=ON
    -DUSE_BLAS:STRING="openblas"
    -DUSE_OPENMP:STRING="gnu"
    -DPYTHON:FILEPATH=/usr/bin/python3.8
    -DCMAKE_INSTALL_PREFIX=/usr
  )
  cd "${_build}"
  source env/bin/activate
  export TVM_LOG_DEBUG="ir/transform.cc=1,relay/ir/transform.cc=1"
  export TVM_BUILD_PATH="${_build}"
  cmake -B "${_build}" -S "${srcdir}/${_base}" ${CONFOPTS[@]}
  cmake --build "${_build}"
  deactivate
}

check() {
  # cd "${srcdir}/${_base}"
  # _build="${srcdir}"/build
  # cd tests/scripts
  # ./task_cpp_unittest.sh "${_build}"

  # This fails
  _build="${srcdir}"/build
  cd "${_build}"
  source env/bin/activate
  TVM_BUILD_PATH="${_build}" make -C "${_build}" cpptest
  deactivate
}

package() {
  # cd "$srcdir/${_base}"

  _build="${srcdir}"/build
  cd ${_build}
  source "${_build}"/env/bin/activate
  export TVM_BUILD_PATH="${_build}"
  # DESTDIR="${pkgdir}" ninja -C "${_build}" install
  # make -C "${_build}" DESTDIR="${pkgdir}" install
  DESTDIR="${pkgdir}" cmake --install "${_build}"

  cd "${srcdir}/${_base}"/python
  # python "$srcdir/${_base}"/python/setup.py build -g --dry-run
  export TVM_LIBRARY_PATH="${pkgdir}/usr/lib"
  python setup.py install -O2 --prefix=/usr --root="${pkgdir}"
  deactivate

  # # To use, do:
  # # (from python-x-wr-timezone)
  # python3.8 -m venv --clear --system-site-packages env
  # source env/bin/activate
  # pip install numpy decorator attrs cloudpickle psutil tornado scipy
  # python
  # >>> import tvm
  # >>> from tvm import te
}
