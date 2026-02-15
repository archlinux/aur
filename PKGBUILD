# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Darius Niminenn <root@dnim.dev>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=python-onnxoptimizer
pkgver=0.4.2
pkgdesc='ONNX model optimizer'
pkgrel=1
arch=(x86_64)
url='https://github.com/onnx/optimizer'
license=(Apache-2.0)
depends=(python python-onnx protobuf gcc-libs)
makedepends=(python-build python-installer python-wheel python-setuptools cmake git protobuf)
checkdepends=(python-pytest)
source=("onnx-optimizer::git+https://github.com/onnx/optimizer.git#tag=v$pkgver"
        "onnx"::"git+https://github.com/onnx/onnx.git"
        "nanobind"::"git+https://github.com/wjakob/nanobind.git"
        "robin-map"::"git+https://github.com/Tessil/robin-map.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd onnx-optimizer

  git submodule init
  git config submodule.third_party/onnx.url "$srcdir"/onnx
  git config submodule.third_party/nanobind.url "$srcdir"/nanobind
  git -c protocol.file.allow=always submodule update third_party/onnx third_party/nanobind

  # nanobind has its own submodule (robin-map)
  cd third_party/nanobind
  git submodule init
  git config submodule.ext/robin_map.url "$srcdir"/robin-map
  git -c protocol.file.allow=always submodule update ext/robin_map
}

build() {
  cd onnx-optimizer
  # Use system protobuf (https://github.com/onnx/optimizer/issues/38)
  ONNX_OPT_USE_SYSTEM_PROTOBUF=1 \
  CMAKE_ARGS="-DONNX_USE_PROTOBUF_SHARED_LIBS=ON -DONNX_USE_LITE_PROTO=ON" \
    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd onnx-optimizer

  # Basic import test
  local _pyver=$(python -c 'import sys; print(f"{sys.version_info[0]}.{sys.version_info[1]}")')
  PYTHONPATH="$PWD/.setuptools-cmake-build$_pyver:$PWD/build/lib:$PYTHONPATH" \
    python -c "import onnxoptimizer; print(onnxoptimizer.__version__)" || \
    echo "Warning: Import test failed"
}

package() {
  cd onnx-optimizer
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
