# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-sgl-kernel
_pkgname=sgl-kernel
_sglang_ver=0.5.10.post1
pkgver=0.4.1
pkgrel=1
pkgdesc='Compiled CUDA kernels for the SGLang serving framework'
arch=('x86_64')
url='https://github.com/sgl-project/sglang/tree/main/sgl-kernel'
license=('Apache-2.0')
depends=(
  'python>=3.10'
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
  'git'
)
options=('!strip')
source=("sglang-${_sglang_ver}.tar.gz::https://github.com/sgl-project/sglang/archive/refs/tags/v${_sglang_ver}.tar.gz"
        'remove-thc-atomics.patch')
sha256sums=('2080e7d8802094ae2b92dead1c6788b7aa2a2ccd06d8ba221bbc5b43d4cb7786'
            'SKIP')

prepare() {
  cd "sglang-${_sglang_ver}"
  patch -p1 < "${srcdir}/remove-thc-atomics.patch"
}

build() {
  cd "sglang-${_sglang_ver}/${_pkgname}"
  # Cap parallel nvcc processes via MAKEFLAGS (set in /etc/makepkg.conf).
  # Each nvcc job peaks at several GB; uncapped builds OOM on small hosts.
  [[ $MAKEFLAGS =~ -j[[:space:]]*([0-9]+) ]] && _jobs="${BASH_REMATCH[1]}" || _jobs=1
  export MAX_JOBS=$_jobs
  export CMAKE_BUILD_PARALLEL_LEVEL=$_jobs
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  export CMAKE_ARGS="${CMAKE_ARGS:--DSGL_KERNEL_COMPILE_THREADS=1}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "sglang-${_sglang_ver}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
