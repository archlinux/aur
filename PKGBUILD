# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-sgl-kernel
_pkgname=sgl-kernel
_sglang_ver=0.5.16
pkgver=0.4.5
pkgrel=2
pkgdesc='Compiled CUDA kernels for the SGLang serving framework'
arch=('x86_64')
url='https://github.com/sgl-project/sglang/tree/main/sgl-kernel'
license=('Apache-2.0')
depends=(
  'python'
  'python-pytorch'
  'cuda'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-scikit-build-core'
  'python-pytorch'
  'python-sympy'
  'cmake'
  'ninja'
  'gcc15'
)
options=('!strip')
source=("sglang-${_sglang_ver}.tar.gz::https://github.com/sgl-project/sglang/archive/refs/tags/v${_sglang_ver}.tar.gz"
        'remove-thc-atomics.patch'
        'unpin-build-dependencies.patch'
        'torch-cxx20.patch')
sha256sums=('28003e0c210319d06f783333a3c99770c47129fd064f0f057634737e3d5268b6'
            '27955a907c7513ad4e9f18a0140bef1eb8d02d5d6c7e62a5b55a69e884492d5f'
            '059217cc009ad22810cca7e359031daed565dd64e813ca010a66de8cdd1a2c6a'
            '0bd34f48c9c9edcf285be4e9122e9ecbfd7b3859d6af264b1e24ae932e3d1abd')

prepare() {
  cd "sglang-${_sglang_ver}"
  patch -p1 < "${srcdir}/remove-thc-atomics.patch"
  patch -p1 < "${srcdir}/unpin-build-dependencies.patch"
  # torch 2.15 headers require C++20 for host and CUDA compilation.
  patch -p1 < "${srcdir}/torch-cxx20.patch"
}

build() {
  cd "sglang-${_sglang_ver}/${_pkgname}"
  # Four nvcc processes exhaust memory on large kernels; two fit this host.
  _jobs=2
  if [[ $MAKEFLAGS =~ -j[[:space:]]*([0-9]+) ]] && (( BASH_REMATCH[1] < _jobs )); then
    _jobs="${BASH_REMATCH[1]}"
  fi
  export MAX_JOBS=$_jobs
  export CMAKE_BUILD_PARALLEL_LEVEL=$_jobs
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  export CMAKE_ARGS="${CMAKE_ARGS:--DSGL_KERNEL_COMPILE_THREADS=1}"
  export CUDAHOSTCXX=/usr/bin/g++-15
  export CC=/usr/bin/gcc-15 CXX=/usr/bin/g++-15
  python -m build --wheel --no-isolation --skip-dependency-check \
    -C build-dir="${srcdir}/skbuild"
}

package() {
  cd "sglang-${_sglang_ver}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
