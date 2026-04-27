# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-tilelang
_pkgname=tilelang
pkgver=0.1.9
pkgrel=1
pkgdesc='Tile-level domain-specific language for high-performance GPU/CPU kernels'
arch=('x86_64')
url='https://github.com/tile-ai/tilelang'
license=('Apache-2.0')
depends=(
  'python>=3.9'
  'python-pytorch'
  'python-tvm-ffi'
  'python-numpy'
  'python-z3-solver'
  'python-cloudpickle'
  'python-ml-dtypes'
  'python-psutil'
  'python-tqdm'
  'cuda'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-scikit-build-core'
  'python-pytorch'
  'cython'
  'cmake'
  'ninja'
  'patchelf'
)
options=('!strip')
source=("${_pkgname}::git+https://github.com/tile-ai/tilelang.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${_pkgname}"
  git submodule update --init --recursive --depth 1
  # Arch ships libz3 in the system 'z3' package, not inside python-z3-solver.
  # Drop NO_DEFAULT_PATH so FindZ3 falls back to /usr/include and /usr/lib.
  sed -i 's/ NO_DEFAULT_PATH//g' cmake/pypi-z3/FindZ3.cmake
}

build() {
  cd "${_pkgname}"
  # Honour MAKEFLAGS from /etc/makepkg.conf; fall back to nproc.
  # TVM C++ jobs are modest in memory (~500 MB each) so full parallelism is safe.
  [[ $MAKEFLAGS =~ -j[[:space:]]*([0-9]+) ]] && _jobs="${BASH_REMATCH[1]}" || _jobs=$(nproc)
  export MAX_JOBS=$_jobs
  export CMAKE_BUILD_PARALLEL_LEVEL=$_jobs
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
