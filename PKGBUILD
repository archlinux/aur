# Maintainer: Adria Arrufat <swiftscythe@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Kamil Cukrowski <kamilcukrowski@gmail.com>

pkgbase=tensorflow-git
pkgname=(tensorflow-git tensorflow-cuda-git python-tensorflow-git python-tensorflow-cuda-git)
pkgver=1.12.1+54837+g03796cf1dda
pkgrel=1
pkgdesc="Library for computation using data flow graphs for scalable machine learning"
url="https://tensorflow.org/"
license=('APACHE')
arch=('x86_64')
depends=('c-ares' 'intel-mkl' 'onednn' 'pybind11' 'openssl-1.0' 'lmdb' 'libpng' 'curl' 'giflib' 'icu' 'libjpeg-turbo')
makedepends=('bazel' 'python-numpy' 'cuda' 'nvidia-utils' 'nccl' 'git'
             'cudnn' 'python-pip' 'python-wheel' 'python-setuptools' 'python-h5py'
             'python-keras-applications' 'python-keras-preprocessing'
             'cython')
optdepends=('tensorboard: Tensorflow visualization toolkit')
source=("git+https://github.com/tensorflow/tensorflow")
md5sums=('SKIP')

get_pyver () {
  python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

check_dir() {
  if [ -d "${1}" ]; then
    return 0
  else
    >&2 echo Directory "${1}" does not exist or is a file! Exiting...
    exit 1
  fi
}

pkgver() {
  cd ${srcdir}/tensorflow
  git describe --tags | sed 's/-/+/g;s/v//;'
}

prepare() {
  # Allow any bazel version
  echo "*" > tensorflow/.bazelversion

  [ -d ${srcdir}/tensorflow-cuda ] && rm -rf ${srcdir}/tensorflow-cuda
    cp -r ${srcdir}/tensorflow ${srcdir}/tensorflow-cuda
}

_set_build_env() {
  # make sure the proxy variables are in all caps, otherwise bazel ignores them
  export HTTP_PROXY=`echo $http_proxy | sed -e 's/\/$//'`
  export HTTPS_PROXY=`echo $https_proxy | sed -e 's/\/$//'`

  # These environment variables influence the behavior of the configure call below.
  export PYTHON_BIN_PATH=/usr/bin/python
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
  export TF_SYSTEM_LIBS="boringssl,curl,cython,gif,icu,libjpeg_turbo,lmdb,nasm,pcre,png,pybind11,zlib"
  export TF_SET_ANDROID_WORKSPACE=0
  export TF_DOWNLOAD_CLANG=0
  export TF_NCCL_VERSION=2.7
  export TF_IGNORE_MAX_BAZEL_VERSION=1
  export TF_MKL_ROOT=/opt/intel/mkl
  export NCCL_INSTALL_PATH=/usr
  export GCC_HOST_COMPILER_PATH=/usr/bin/gcc
  export HOST_C_COMPILER=/usr/bin/gcc
  export HOST_CXX_COMPILER=/usr/bin/g++
  export TF_CUDA_CLANG=0  # Clang currently disabled because it's not compatible at the moment.
  export CLANG_CUDA_COMPILER_PATH=/usr/bin/clang
  export TF_CUDA_PATHS=/opt/cuda,/usr/lib,/usr
  export TF_CUDA_VERSION=$(/opt/cuda/bin/nvcc --version | sed -n 's/^.*release \(.*\),.*/\1/p')
  export TF_CUDNN_VERSION=$(sed -n 's/^#define CUDNN_MAJOR\s*\(.*\).*/\1/p' /usr/include/cudnn_version.h)
  export TF_CUDA_COMPUTE_CAPABILITIES=5.2,5.3,6.0,6.1,6.2,7.0,7.2,7.5,8.0,8.6

  # Required until https://github.com/tensorflow/tensorflow/issues/39467 is fixed.
  export CC=gcc
  export CXX=g++

  export BAZEL_ARGS="--config=mkl -c opt --copt=-I/usr/include/openssl-1.0 --host_copt=-I/usr/include/openssl-1.0 --linkopt=-l:libssl.so.1.0.0 --linkopt=-l:libcrypto.so.1.0.0 --host_linkopt=-l:libssl.so.1.0.0 --host_linkopt=-l:libcrypto.so.1.0.0"

  # Workaround for gcc 10+ warnings related to upb.
  # See https://github.com/tensorflow/tensorflow/issues/39467
  export BAZEL_ARGS="$BAZEL_ARGS --host_copt=-Wno-stringop-truncation"
}

build() {
  _set_build_env
  cd ${srcdir}/tensorflow
  export CC_OPT_FLAGS="-march=native -O3"
  export TF_NEED_CUDA=0
    ./configure
  bazel \
    build ${BAZEL_ARGS[@]} \
      //tensorflow:libtensorflow.so \
      //tensorflow:libtensorflow_cc.so \
      //tensorflow:install_headers \
      //tensorflow/tools/pip_package:build_pip_package
  bazel-bin/tensorflow/tools/pip_package/build_pip_package "${srcdir}"/tmp

  cd ${srcdir}/tensorflow-cuda
  export TF_NEED_CUDA=1
  ./configure
  bazel \
    build ${BAZEL_ARGS[@]} \
      //tensorflow:libtensorflow.so \
      //tensorflow:libtensorflow_cc.so \
      //tensorflow:install_headers \
      //tensorflow/tools/pip_package:build_pip_package
  bazel-bin/tensorflow/tools/pip_package/build_pip_package --gpu "${srcdir}"/tmpcuda
}

_package() {
  # install headers first
  install -d "${pkgdir}"/usr/include/tensorflow
  cp -r bazel-bin/tensorflow/include/* "${pkgdir}"/usr/include/tensorflow/
  # install python-version to get all extra headers
  WHEEL_PACKAGE=$(find "${srcdir}"/$1 -name "tensor*.whl")
  pip install --ignore-installed --upgrade --root "${pkgdir}"/ $WHEEL_PACKAGE --no-dependencies
  # move extra headers to correct location
  find "${pkgdir}/usr/lib/python$(get_pyver)"/site-packages/tensorflow/include -maxdepth 1 -mindepth 1 -type d -print0 | while read -rd $'\0' _folder; do
    cp -nr "${_folder}" "${pkgdir}"/usr/include/tensorflow/
  done
  # clean up unneeded files
  rm -rf "${pkgdir}"/usr/bin
  rm -rf "${pkgdir}"/usr/lib
  rm -rf "${pkgdir}"/usr/share

  # install the rest of tensorflow
  tensorflow/c/generate-pc.sh --prefix=/usr --version=${pkgver}
  sed -e 's/\/include/\/include\/tensorflow/' -i tensorflow.pc
  install -Dm644 tensorflow.pc "${pkgdir}"/usr/lib/pkgconfig/tensorflow.pc
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
}

_python_package() {
  WHEEL_PACKAGE=$(find "${srcdir}"/$1 -name "tensor*.whl")
  pip install --ignore-installed --upgrade --root "${pkgdir}"/ $WHEEL_PACKAGE --no-dependencies

  # create symlinks to headers
  find "${pkgdir}/usr/lib/python$(get_pyver)"/site-packages/tensorflow/include/ -maxdepth 1 -mindepth 1 -type d -print0 | while read -rd $'\0' _folder; do
    rm -rf "${_folder}"
    _smlink="$(basename "${_folder}")"
    ln -s /usr/include/tensorflow/"${_smlink}" "${pkgdir}/usr/lib/python$(get_pyver)"/site-packages/tensorflow/include/
  done

  # tensorboard has been separated from upstream but they still install it with
  # tensorflow. I don't know what kind of sense that makes but we have to clean
  # it out from this pacakge.
  rm -rf "${pkgdir}"/usr/bin/tensorboard

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_tensorflow-git() {
  pkgdesc="Library for computation using data flow graphs for scalable machine learning (with CPU optimizations)"
  conflicts=(tensorflow)
  provides=(tensorflow)

  cd ${srcdir}/tensorflow
  _package tmp
  conflicts=(tensorflow)
  provides=(tensorflow)
}

package_tensorflow-cuda-git() {
  pkgdesc="Library for computation using data flow graphs for scalable machine learning (with CUDA)"
  depends+=(cuda cudnn nccl)
  conflicts=(tensorflow-cuda)
  provides=(tensorflow-cuda)

  cd ${srcdir}/tensorflow-cuda
  _package tmpcuda
}

package_python-tensorflow-git() {
  depends+=(tensorflow python-termcolor python-astor python-gast python-numpy python-protobuf absl-py python-h5py python-keras-applications python-keras-preprocessing python-tensorflow-estimator)

  cd ${srcdir}/tensorflow
  _python_package tmp
}

package_python-tensorflow-cuda-git() {
  pkgdesc="Library for computation using data flow graphs for scalable machine learning (with CUDA)"
  depends+=(tensorflow-cuda python-termcolor python-astor python-gast python-numpy cuda cudnn python-pycuda python-protobuf absl-py nccl python-h5py python-keras-applications python-keras-preprocessing python-tensorflow-estimator)
  conflicts=(python-tensorflow-cuda)
  provides=(python-tensorflow-cuda)

  cd ${srcdir}/tensorflow-cuda
  _python_package tmpcuda
}

# vim:set ts=2 sw=2 et:
