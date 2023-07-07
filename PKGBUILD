# Maintainer:  <edgar [ no ] openmail [d] cc>
_base=tvm
# pkgname="${_base}"-git
pkgname="${_base}"
pkgver=0.13.dev0.5.ge8184e66c4
pkgrel=2
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
  "blas-openblas"
  "openmp"
  # https://tvm.apache.org/docs/install/from_source.html,
  "python-numpy"
  "python-decorator"
  "python-attrs"
  # https://github.com/apache/tvm/issues/8577
  "python38"
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
install=tvm.install
# changelog=

source=("git+https://github.com/apache/tvm"
        # Submodules not in AUR
        "git+https://github.com/NVIDIA/cutlass.git"
        "git+https://github.com/dmlc/dlpack.git"
        "git+https://github.com/dmlc/dmlc-core.git"
        "git+https://github.com/agauniyal/rang.git"
        "vta-hw::git+https://github.com/apache/tvm-vta.git"
        "enable_features.diff"
        "cblas_compilation.diff")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            "ec62e2a15ca5d47f1bc804d12902d21d5f228e73cb458f6c4e5f9e9ce5118c117b8274814e36fde94a1efa0b25b8dc7d59ad79556e34484a1e8fb5d7926c1729"
            "7499c01fce2facb76ebeb43799435f13b178dd0b2cf29ff0e09dd880ba2951a2e52a487a1fbb8dd392e6d3e8c5d0ac9a8d511034b176ebe395106ca0c4f3682a")

# # For tar-ball
# source=("https://dlcdn.apache.org/tvm/tvm-v${pkgver}/apache-tvm-src-v${pkgver}.tar.gz"
#        "enable_features.diff")
# sha512sums=("328b3d5d851ac82f12a0d1402094e608dbfa5a4f6fb8d942a95b41695dc069f1cfcbe915294b3ae71bf2433e792d9e00809c63392d12d20d2f8c27476375d1dc"
#             "8750d292086f030a1e70f201b86538a7e92444b238573c01424d9f933deb5032c1b82f4b74e45289b87b64eb4267765b162eeadd69732eebea659e856f1e247c")
# noextract=()

pkgver() {
  cd "${srcdir}"/"${_base}"
  git describe --tags --match '*.*' | tr '-' '.' | sed 's-^v--'
}

prepare() {
  # # for tar-ball
  # rm "${srcdir}"/apache-"${_base}"-src-v"${pkgver}"*.tar.gz
  # mv "${srcdir}"/apache-"${_base}"-src-v"${pkgver}"* "${srcdir}/${_base}"

  cd "${srcdir}/${_base}"

  # * Update submodules
  # git submodule update --init --recursive

  # ** Remove submodules for which there are packages
  #    (names from .gitmodules)
  for submod in cnpy OpenCL-Headers libbacktrace; do
    # https://stackoverflow.com/a/1260982
    git rm 3rdparty/"$submod"
  done
  git commit -m "Removed submodules"

  # ** Update submodules
  #    (from AUR VCS guidelines)
  git submodule init
  for submod in cutlass dlpack dmlc-core rang vta-hw; do
    git config \
        submodule.3rdparty/"$submod".url "${srcdir}/$submod"
  done
  git -c protocol.file.allow=always submodule update

  # https://tvm.apache.org/docs/install/from_source.html
  _build="${srcdir}"/build
  [ ! -d "${_build}" ] && mkdir "${_build}"
  patch --forward -i "${srcdir}/enable_features.diff" \
        -o "${_build}"/config.cmake \
        -d "${srcdir}/${_base}/cmake"
  patch --forward -i "${srcdir}/cblas_compilation.diff" \
        "${srcdir}/${_base}/CMakeLists.txt"

  cd "${_build}"
  python3.8 -m venv env
  source env/bin/activate
  # From gen_requirements.py
  pip install setuptools numpy decorator attrs\
      cloudpickle psutil tornado scipy synr
  deactivate
}

build() {
  _build="${srcdir}"/build

  CONFOPTS=( -DCMAKE_INSTALL_PREFIX=/usr )

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
  python setup.py install -O1 --prefix=/usr --root="${pkgdir}"
  deactivate
}
