# Maintainer: Danny Waser <danny@waser.tech>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Konstantin Gizdov (kgizdov) <arch@kge.pw>
# Contributor: Adria Arrufat (archdria) <adria.arrufat+AUR@protonmail.ch>
# Contributor: Thibault Lorrain (fredszaq) <fredszaq@gmail.com>

pkgbase=python38-tensorflow
pkgname=(python38-tensorflow python38-tensorflow-opt python38-tensorflow-cuda python38-tensorflow-opt-cuda)
pkgver=2.11.0
_pkgver=2.11.0
pkgrel=1
pkgdesc="Library for computation using data flow graphs for scalable machine learning"
url="https://www.tensorflow.org/"
license=('APACHE')
arch=('x86_64')
depends=('c-ares' 'pybind11' 'openssl' 'lmdb' 'libpng' 'curl' 'giflib' 'icu' 'libjpeg-turbo' 'openmp')
makedepends=('bazel' 'python38-numpy' 'cuda' 'nvidia-utils' 'nccl' 'git' 'cudnn' 'python38-pip' 'python38-wheel'
             'python38-setuptools' 'python38-h5py' 'python38-keras-applications' 'python38-keras-preprocessing'
             'python38-cython' 'patchelf' 'python38-requests')
optdepends=('tensorboard: Tensorflow visualization toolkit')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tensorflow/tensorflow/archive/v${_pkgver}.tar.gz"
        fix-c++17-compat.patch
        fix-cusolver-version.patch)
sha512sums=('cda16db72a0ede72ac9f5e76c3a745ea9d72421fa40021303032f8fc3ac2755f64524f97a4629c18cf888f259027439b49ec921e0f5fd329a6ba060235a658d5'
            'f682368bb47b2b022a51aa77345dfa30f3b0d7911c56515d428b8326ee3751242f375f4e715a37bb723ef20a86916dad9871c3c81b1b58da85e1ca202bc4901e'
            '6f42455db1db0a5cd58ab5fe5554317e9ff648c046bb81cef9b4c61cce8380da08b681f825544b5388f02da863ff19f642efa9459691cbcf8852a21bd0dc7447')

# consolidate common dependencies to prevent mishaps
_common_py_depends=(python38-termcolor python38-astor python38-gast03 python38-numpy python38-protobuf
                    absl-py python38-h5py python38-keras python38-keras-applications python38-keras-preprocessing
                    python38-tensorflow-estimator python38-opt_einsum python38-astunparse python38-pasta
                    python38-flatbuffers python38-typing_extensions)

get_pyver () {
  python3.8 -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

check_dir() {
  # first make sure we do not break parsepkgbuild
  if ! command -v cp &> /dev/null; then
    >&2 echo "'cp' command not found. PKGBUILD is probably being checked by parsepkgbuild."
    if ! command -v install &> /dev/null; then
      >&2 echo "'install' command also not found. PKGBUILD must be getting checked by parsepkgbuild."
      >&2 echo "Cannot check if directory '${1}' exists. Ignoring."
      >&2 echo "If you are not running nacmap or parsepkgbuild, please make sure the PATH is correct and try again."
      >&2 echo "PATH should not be '/dummy': PATH=$PATH"
      return 0
    fi
  fi
  # if we are running normally, check the given path
  if [ -d "${1}" ]; then
    return 0
  else
    >&2 echo Directory "${1}" does not exist or is a file! Exiting...
    exit 1
  fi
}

prepare() {
  # Allow any bazel version
  echo "*" > tensorflow-${_pkgver}/.bazelversion

  # Get rid of hardcoded versions. Not like we ever cared about what upstream
  # thinks about which versions should be used anyway. ;) (FS#68772)
  sed -i -E "s/'([0-9a-z_-]+) .= [0-9].+[0-9]'/'\1'/" tensorflow-${_pkgver}/tensorflow/tools/pip_package/setup.py

  # manually specify cusolver .so version
  patch -Np1 -i "${srcdir}/fix-cusolver-version.patch" -d tensorflow-${_pkgver}

  cp -r tensorflow-${_pkgver} tensorflow-${_pkgver}-opt
  cp -r tensorflow-${_pkgver} tensorflow-${_pkgver}-cuda
  cp -r tensorflow-${_pkgver} tensorflow-${_pkgver}-opt-cuda

  # These environment variables influence the behavior of the configure call below.
  export PYTHON_BIN_PATH=/usr/bin/python3.8
  export USE_DEFAULT_PYTHON_LIB_PATH=1
  export TF_NEED_JEMALLOC=1
  export TF_NEED_KAFKA=1
  export TF_NEED_OPENCL_SYCL=0
  export TF_NEED_AWS=1
  export TF_NEED_GCP=1
  export TF_NEED_HDFS=1
  export TF_NEED_S3=1
  export TF_ENABLE_XLA=1
  export TF_NEED_GDR=0
  export TF_NEED_VERBS=0
  export TF_NEED_OPENCL=0
  export TF_NEED_MPI=0
  export TF_NEED_TENSORRT=0
  export TF_NEED_NGRAPH=0
  export TF_NEED_IGNITE=0
  export TF_NEED_ROCM=0
  # See https://github.com/tensorflow/tensorflow/blob/master/third_party/systemlibs/syslibs_configure.bzl
  export TF_SYSTEM_LIBS="boringssl,curl,cython,gif,icu,libjpeg_turbo,lmdb,nasm,png,pybind11,zlib"
  export TF_SET_ANDROID_WORKSPACE=0
  export TF_DOWNLOAD_CLANG=0
  export TF_NCCL_VERSION=$(pkg-config nccl --modversion | grep -Po '\d+\.\d+')
  export TF_IGNORE_MAX_BAZEL_VERSION=1
  export NCCL_INSTALL_PATH=/usr
  # Does tensorflow really need the compiler overridden in 5 places? Yes.
  export CC=gcc-11
  export CXX=g++-11
  export GCC_HOST_COMPILER_PATH=/usr/bin/${CC}
  export HOST_C_COMPILER=/usr/bin/${CC}
  export HOST_CXX_COMPILER=/usr/bin/${CXX}
  export TF_CUDA_CLANG=0  # Clang currently disabled because it's not compatible at the moment.
  export CLANG_CUDA_COMPILER_PATH=/usr/bin/clang
  export TF_CUDA_PATHS=/opt/cuda,/usr/lib,/usr
  export TF_CUDA_VERSION=$(/opt/cuda/bin/nvcc --version | sed -n 's/^.*release \(.*\),.*/\1/p')
  export TF_CUDNN_VERSION=$(sed -n 's/^#define CUDNN_MAJOR\s*\(.*\).*/\1/p' /usr/include/cudnn_version.h)
  # https://github.com/tensorflow/tensorflow/blob/1ba2eb7b313c0c5001ee1683a3ec4fbae01105fd/third_party/gpus/cuda_configure.bzl#L411-L446
  # according to the above, we should be specifying CUDA compute capabilities as 'sm_XX' or 'compute_XX' from now on
  # add latest PTX for future compatibility
  # Valid values can be discovered from nvcc --help
  export TF_CUDA_COMPUTE_CAPABILITIES=sm_52,sm_53,sm_60,sm_61,sm_62,sm_70,sm_72,sm_75,sm_80,sm_86,sm_87,sm_89,sm_90,compute_90

  export BAZEL_ARGS="--config=mkl -c opt"
}

build() {
  echo "Building without cuda and without non-x86-64 optimizations"
  cd "${srcdir}"/tensorflow-${_pkgver}
  export CC_OPT_FLAGS="-march=x86-64"
  export TF_NEED_CUDA=0
  ./configure
  bazel \
    build ${BAZEL_ARGS[@]} \
      //tensorflow:libtensorflow.so \
      //tensorflow:libtensorflow_cc.so \
      //tensorflow:install_headers \
      //tensorflow/tools/pip_package:build_pip_package
  bazel-bin/tensorflow/tools/pip_package/build_pip_package "${srcdir}"/tmp


  echo "Building without cuda and with non-x86-64 optimizations"
  cd "${srcdir}"/tensorflow-${_pkgver}-opt
  export CC_OPT_FLAGS="-march=haswell -O3"
  export TF_NEED_CUDA=0
  ./configure
  bazel \
    build --config=avx2_linux \
      ${BAZEL_ARGS[@]} \
      //tensorflow:libtensorflow.so \
      //tensorflow:libtensorflow_cc.so \
      //tensorflow:install_headers \
      //tensorflow/tools/pip_package:build_pip_package
  bazel-bin/tensorflow/tools/pip_package/build_pip_package "${srcdir}"/tmpopt


  echo "Building with cuda and without non-x86-64 optimizations"
  cd "${srcdir}"/tensorflow-${_pkgver}-cuda
  export CC_OPT_FLAGS="-march=x86-64"
  export TF_NEED_CUDA=1
  ./configure
  bazel \
    build \
      ${BAZEL_ARGS[@]} \
      //tensorflow:libtensorflow.so \
      //tensorflow:libtensorflow_cc.so \
      //tensorflow:install_headers \
      //tensorflow/tools/pip_package:build_pip_package
  bazel-bin/tensorflow/tools/pip_package/build_pip_package --gpu "${srcdir}"/tmpcuda


  echo "Building with cuda and with non-x86-64 optimizations"
  cd "${srcdir}"/tensorflow-${_pkgver}-opt-cuda
  export CC_OPT_FLAGS="-march=haswell -O3"
  export TF_NEED_CUDA=1
  ./configure
  bazel \
    build --config=avx2_linux \
      ${BAZEL_ARGS[@]} \
      //tensorflow:libtensorflow.so \
      //tensorflow:libtensorflow_cc.so \
      //tensorflow:install_headers \
      //tensorflow/tools/pip_package:build_pip_package
  bazel-bin/tensorflow/tools/pip_package/build_pip_package --gpu "${srcdir}"/tmpoptcuda
}

_package() {
  # install headers first
  install -d "${pkgdir}"/usr/include/tensorflow
  cp -r bazel-bin/tensorflow/include/* "${pkgdir}"/usr/include/tensorflow/
  # install python-version to get all extra headers
  WHEEL_PACKAGE=$(find "${srcdir}"/$1 -name "tensor*.whl")
  pip install --ignore-installed --upgrade --root "${pkgdir}"/ $WHEEL_PACKAGE --no-dependencies
  # move extra headers to correct location
  local _srch_path="${pkgdir}/usr/lib/python$(get_pyver)"/site-packages/tensorflow/include
  check_dir "${_srch_path}"  # we need to quit on broken search paths
  find "${_srch_path}" -maxdepth 1 -mindepth 1 -type d -print0 | while read -rd $'\0' _folder; do
    cp -nr "${_folder}" "${pkgdir}"/usr/include/tensorflow/
  done
  # clean up unneeded files
  rm -rf "${pkgdir}"/usr/bin
  rm -rf "${pkgdir}"/usr/lib
  rm -rf "${pkgdir}"/usr/share
  # make sure no lib objects are outside valid paths
  local _so_srch_path="${pkgdir}/usr/include"
  check_dir "${_so_srch_path}"  # we need to quit on broken search paths
  find "${_so_srch_path}" -type f,l \( -iname "*.so" -or -iname "*.so.*" \) -print0 | while read -rd $'\0' _so_file; do
    # check if file is a dynamic executable
    ldd "${_so_file}" &>/dev/null && rm -rf "${_so_file}"
  done

  # install the rest of tensorflow
  tensorflow/c/generate-pc.sh --prefix=/usr --version=${pkgver}
  sed -e 's@/include$@/include/tensorflow@' -i tensorflow.pc -i tensorflow_cc.pc
  install -Dm644 tensorflow.pc "${pkgdir}"/usr/lib/pkgconfig/tensorflow.pc
  install -Dm644 tensorflow_cc.pc "${pkgdir}"/usr/lib/pkgconfig/tensorflow_cc.pc
  install -Dm755 bazel-bin/tensorflow/libtensorflow.so "${pkgdir}"/usr/lib/libtensorflow.so.${pkgver}
  ln -s libtensorflow.so.${pkgver} "${pkgdir}"/usr/lib/libtensorflow.so.${pkgver:0:1}
  ln -s libtensorflow.so.${pkgver:0:1} "${pkgdir}"/usr/lib/libtensorflow.so
  install -Dm755 bazel-bin/tensorflow/libtensorflow_cc.so "${pkgdir}"/usr/lib/libtensorflow_cc.so.${pkgver}
  ln -s libtensorflow_cc.so.${pkgver} "${pkgdir}"/usr/lib/libtensorflow_cc.so.${pkgver:0:1}
  ln -s libtensorflow_cc.so.${pkgver:0:1} "${pkgdir}"/usr/lib/libtensorflow_cc.so
  install -Dm755 bazel-bin/tensorflow/libtensorflow_framework.so "${pkgdir}"/usr/lib/libtensorflow_framework.so.${pkgver}
  ln -s libtensorflow_framework.so.${pkgver} "${pkgdir}"/usr/lib/libtensorflow_framework.so.${pkgver:0:1}
  ln -s libtensorflow_framework.so.${pkgver:0:1} "${pkgdir}"/usr/lib/libtensorflow_framework.so
  install -Dm644 tensorflow/c/c_api.h "${pkgdir}"/usr/include/tensorflow/tensorflow/c/c_api.h
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  # Fix interoperability of C++14 and C++17. See https://bugs.archlinux.org/task/65953
  patch -Np0 -i "${srcdir}"/fix-c++17-compat.patch -d "${pkgdir}"/usr/include/tensorflow/absl/base

  # Fix FS#75571
  find "${pkgdir}"/usr/lib -type f -exec patchelf --replace-needed libiomp5.so libomp.so '{}' \; -print
}

_python_package() {
  WHEEL_PACKAGE=$(find "${srcdir}"/$1 -name "tensor*.whl")
  pip install --ignore-installed --upgrade --root "${pkgdir}"/ $WHEEL_PACKAGE --no-dependencies

  # create symlinks to headers
  local _srch_path="${pkgdir}/usr/lib/python$(get_pyver)"/site-packages/tensorflow/include/
  check_dir "${_srch_path}"  # we need to quit on broken search paths
  find "${_srch_path}" -maxdepth 1 -mindepth 1 -type d -print0 | while read -rd $'\0' _folder; do
    rm -rf "${_folder}"
    _smlink="$(basename "${_folder}")"
    ln -s /usr/include/tensorflow/"${_smlink}" "${_srch_path}"
  done

  # tensorboard has been separated from upstream but they still install it with
  # tensorflow. I don't know what kind of sense that makes but we have to clean
  # it out from this pacakge.
  rm -rf "${pkgdir}"/usr/bin/tensorboard

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_python38-tensorflow() {
  depends+=(tensorflow "${_common_py_depends[@]}")

  cd "${srcdir}"/tensorflow-${_pkgver}
  _python_package tmp
}

package_python38-tensorflow-opt() {
  pkgdesc="Library for computation using data flow graphs for scalable machine learning (with AVX2 CPU optimizations)"
  depends+=(tensorflow-opt "${_common_py_depends[@]}")
  conflicts=(python38-tensorflow)
  provides=(python38-tensorflow)

  cd "${srcdir}"/python38-tensorflow-${_pkgver}-opt
  _python_package tmpopt
}

package_python38-tensorflow-cuda() {
  pkgdesc="Library for computation using data flow graphs for scalable machine learning (with CUDA)"
  depends+=(tensorflow-cuda cuda cudnn nccl python38-pycuda "${_common_py_depends[@]}")
  conflicts=(python38-tensorflow)
  provides=(python38-tensorflow)

  cd "${srcdir}"/python38-tensorflow-${_pkgver}-cuda
  _python_package tmpcuda
}

package_python38-tensorflow-opt-cuda() {
  pkgdesc="Library for computation using data flow graphs for scalable machine learning (with CUDA and AVX2 CPU optimizations)"
  depends+=(tensorflow-opt-cuda cuda cudnn nccl python38-pycuda "${_common_py_depends[@]}")
  conflicts=(python38-tensorflow)
  provides=(python38-tensorflow python38-tensorflow-cuda)

  cd "${srcdir}"/python38-tensorflow-${_pkgver}-opt-cuda
  _python_package tmpoptcuda
}

# vim:set ts=2 sw=2 et: