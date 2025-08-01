# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Maintainer: crl <crl18039102576 at 126 dot com>

pkgname=python-taichi
pkgver=1.7.4
pkgrel=1
pkgdesc='Productive & portable programming language for high-performance, sparse & differentiable computing on CPUs & GPUs'
url='https://github.com/taichi-dev/taichi'
arch=('x86_64')
license=('Apache-2.0')
depends=(
  'python'
  'python-rich'
  'python-numpy'
  'pybind11'
  'python-pillow'
  'python-colorama'
  'python-dill'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-scikit-build'
  'clang'
  'ninja'
  'cmake'
  'cuda'
  'clang15'
  'llvm15')
_tag="v$pkgver"
source=("git+$url.git#tag=$_tag" "taichi.patch")
b2sums=('SKIP' 'SKIP')

prepare() {
    cd "$srcdir/taichi"
    git submodule update --init --recursive
    git apply ../taichi.patch
}

build() {
    cd "$srcdir/taichi"
    export TAICHI_CMAKE_ARGS="$TAICHI_CMAKE_ARGS -DTI_WITH_VULKAN=ON -DTI_WITH_METAL=OFF"
    export TAICHI_CMAKE_ARGS="$TAICHI_CMAKE_ARGS -DCMAKE_CXX_COMPILER=/usr/lib/llvm15/bin/clang++ -DCMAKE_C_COMPILER=/usr/lib/llvm15/bin/clang"
    export TAICHI_CMAKE_ARGS="$TAICHI_CMAKE_ARGS -DLLVM_DIR=/usr/lib/llvm15/lib/cmake/llvm"
    # Add CUDA include path
    export TAICHI_CMAKE_ARGS="$TAICHI_CMAKE_ARGS -DCMAKE_CXX_FLAGS=\"-I/opt/cuda/targets/x86_64-linux/include\""
    export TAICHI_CMAKE_ARGS="$TAICHI_CMAKE_ARGS -DCMAKE_C_FLAGS=\"-I/opt/cuda/targets/x86_64-linux/include\""
    export TAICHI_CMAKE_ARGS="$TAICHI_CMAKE_ARGS -DCMAKE_POLICY_VERSION_MINIMUM=3.5"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/taichi"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
