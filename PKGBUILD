# Maintainer:  <edgar [ no ] openmail [d] cc>
_base=tvm
# pkgname="${_base}"-git
pkgname="${_base}"
pkgver=0.11.1
pkgrel=1
# epoch=
pkgdesc="Apache TVM, a deep learning compiler that enables access to high-performance machine learning anywhere for everyone"
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
source=("https://dlcdn.apache.org/tvm/tvm-v${pkgver}/apache-tvm-src-v${pkgver}.tar.gz"
       "enable_features.diff")
sha512sums=("47f70a6a3679f2c7316c6ea8bb0da133b6a2d2c3b40ab175f8cd6c5dfdad3c5300fb4454bcf3f4a173f37b2fff58eef01b423840ad2c523696698f7d0d8b0a97"
            "25e22842072314aedc0d988f445dfbc2046ba193176b671dffae7920c20fed6aea677ea421f95e5a5c8f17af08cbdbbc6e9e34d8a72716be05febf322f3dcd9f")
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
  patch --forward -i "${srcdir}/enable_features.diff" \
        -o "${_build}"/config.cmake \
        -d "${srcdir}/${_base}/cmake"

  cd "${_build}"
  python3.8 -m venv env
  source env/bin/activate
  # gen_requirements.py
  pip install setuptools numpy decorator attrs\
      cloudpickle psutil tornado scipy synr
  deactivate
}

build() {
  _build="${srcdir}"/build


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
