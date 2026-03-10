# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=pytnl
pkgbase=python-$_name
pkgname=($pkgbase $pkgbase-cuda)
pkgver=0.0.11
pkgrel=1
pkgdesc="Python bindings for the Template Numerical Library"
arch=(x86_64)
url="https://gitlab.com/tnl-project/pytnl"
license=(MIT)
depends=(
  gcc-libs
  glibc
  openmpi
  python
  tinyxml2
  zlib
)
makedepends=(
  cmake
  cuda
  git
  python-build
  python-installer
  python-scikit-build-core
)
checkdepends=(
  python-pytest
  python-pytest-xdist
  python-psutil
  python-hypothesis
  python-mpi4py
  python-numpy
)
source=($url/-/archive/$pkgver/$_name-$pkgver.tar.gz)
b2sums=('02313e38fb9c4eccb6eaf0fe26f400f75363afeaeb9cb13c7e136db10e3d1967f949c685f38c0290e54ec07e1f3a31b3846e0e72527e1f62ac68d8b48d656804')

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

build() {
  # In general, we want to list all real archs (sm_XX) and the latest virtual arch (compute_XX) for future PTX compatibility.
  # Valid values can be discovered from nvcc --help
  local cuda_archs="75;80;86;87;88;89;90;100;103;110;120;121;121-virtual"

  # Compile for CUDA architectures in parallel
  export CUDAFLAGS="--threads=4"

  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation --config-setting=cmake.define.CMAKE_CUDA_ARCHITECTURES="$cuda_archs"
}

check() {
  local pytest_options=(
    -vv
    -W ignore::DeprecationWarning
    # distribute tests across multiple CPUs
    -n auto
    --maxprocesses=8
    # do not run CUDA tests
    -m 'not cuda'
  )

  cd $_name-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package_python-pytnl() {
  optdepends=(
    'python-mpi4py: for distributed datastructures (MPI)'
    'python-numpy: interoperability with NumPy'
    'python-pytnl-cuda: additional CUDA-accelerated modules'
  )

  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # fix the _IMPORT_PREFIX variable
  sed -i 's|set(_IMPORT_PREFIX "/tmp/.*/wheel/platlib")|set(_IMPORT_PREFIX "/usr")|' "$pkgdir"/usr/lib/cmake/PyTNL/PyTNLTargets.cmake

  # split CUDA modules into separate packages
  cd "$pkgdir"
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  _pick $pkgbase-cuda usr/lib/python$python_version/site-packages/pytnl/*cuda*
}

package_python-pytnl-cuda() {
  depends+=(
    cuda
    python-pytnl
  )
  optdepends=(
    'python-cupy: interoperability with CuPy'
  )

  mv -v $pkgname/* "$pkgdir"
  install -vDm 644 $_name-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
