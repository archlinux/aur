# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>

pkgname=python-tensorflow-lite
pkgver=2.13.0
_pkgver=2.13.0
pkgrel=1
pkgdesc="TensorFlow Lite is a mobile library for deploying models on mobile, microcontrollers and other edge devices"
url="https://www.tensorflow.org/lite/"
license=('APACHE')
arch=('x86_64')
depends=(glibc gcc-libs python python-numpy)
makedepends=(
  git
  ninja
  cmake
  pybind11
  python-build
  python-installer
  python-setuptools
  python-wheel
)

source=("https://github.com/tensorflow/tensorflow/archive/v$pkgver.tar.gz"
        tflite-add-stdint.h-for-int-types-in-internal-Spectr.patch)
sha512sums=('b243ef9ded002faf8127fedb74e7e60685a0fc636790a9616fbb67a1e902d45b28f044f3da58d7febde1c5bd13a9578a0a463db24b2f2f06daf558cc7eadfec4'
            '14e51281282a80f3174da9db613f677ca4bde7763984b584b5a6564ec5fedec97ff7b266191fe9fabd21e2b34e6af1e9ee70d058aa6fadcd06ab215b1304433f')

prepare() {
  cd "tensorflow-${pkgver}"

  # Fix stdint includes
  patch -Np1 -i "${srcdir}/tflite-add-stdint.h-for-int-types-in-internal-Spectr.patch"

  # Copy around pip build files, as seen in build_pip_package_with_cmake.sh
  mkdir -p "${srcdir}/build-pip/tflite_runtime"

  cd tensorflow/lite
  cp "tools/pip_package/setup_with_binary.py" "${srcdir}/build-pip/setup.py"
  cp "python/interpreter.py" \
     "python/metrics/metrics_interface.py" \
     "python/metrics/metrics_portable.py" \
     "${srcdir}/build-pip/tflite_runtime"
  echo "__version__ = '${pkgver}'" > "${srcdir}/build-pip/tflite_runtime/__init__.py"
}

build() {
  PYTHON_INCLUDE=$(python -c "from sysconfig import get_paths as gp; print(gp()['include'])")
  PYBIND11_INCLUDE=$(python -c "import pybind11; print (pybind11.get_include())")
  NUMPY_INCLUDE=$(python -c "import numpy; print (numpy.get_include())")
  PYTHON_INCLUDE_FLAGS="-I${PYTHON_INCLUDE} -I${PYBIND11_INCLUDE} -I${NUMPY_INCLUDE}"

  local cmake_args=(
    -S "tensorflow-${pkgver}"/tensorflow/lite
    -B build
    -G Ninja
    -DCMAKE_INSTALL_PREFIX=/usr/
    -DCMAKE_PREFIX_PATH=/usr/
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_C_FLAGS="${CFLAGS} ${PYTHON_INCLUDE_FLAGS}"
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} ${PYTHON_INCLUDE_FLAGS}"
    -Wno-dev
  )

  cmake "${cmake_args[@]}"
  cmake --build build -t _pywrap_tensorflow_interpreter_wrapper
}


package() {
  cp "${srcdir}/build/_pywrap_tensorflow_interpreter_wrapper.so" \
     "${srcdir}/build-pip/tflite_runtime"

  export PROJECT_NAME=tflite_runtime
  export PACKAGE_VERSION="${pkgver}"

  cd "${srcdir}/build-pip"
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
}

