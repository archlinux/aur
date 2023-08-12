# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-scikit-build-core
pkgdesc='Next generation Python CMake adaptor and Python API for plugins'
url='https://scikit-build-core.readthedocs.io/'
pkgver=0.4.8
pkgrel=1
arch=('any')
license=('Apache')

depends=(
  'cmake'
  'ninja'
  'python-cattrs'
  'python-packaging'
  'python-pathspec'
  'python-pyproject-metadata'
  'python-rich'
)
makedepends=('python-build' 'python-hatchling' 'python-hatch-vcs' 'python-installer')
checkdepends=(
  'cython'
  'gcc-fortran'
  'git'
  'pybind11'
  'python-hatch-fancy-pypi-readme'
  'python-numpy'
  'python-pip'
  'python-pytest'
  'python-pytest-subprocess'
  'python-setuptools-scm'
)

_pypi=scikit_build_core
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '9fac1cac1a38ba1168190b7bd98f62aecf06cd46db7185ec8c27b27e0da4ad4b'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pypi-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/$_pypi-$pkgver"-*.whl
  test-env/bin/python -m pytest -v -k "not pep518_sdist"

  local _examples=(abi3 c cython fortran pybind11)
  for _example in "${_examples[@]}"; do
    echo ""
    echo "Building example docs/examples/getting_started/$_example"
    cd "$srcdir/$_pypi-$pkgver/docs/examples/getting_started/$_example"
    "$srcdir/$_pypi-$pkgver"/test-env/bin/python -m build --no-isolation --wheel

    echo "Testing example docs/examples/getting_started/$_example"
    "$srcdir/$_pypi-$pkgver"/test-env/bin/python -m installer dist/example-*.whl
    "$srcdir/$_pypi-$pkgver"/test-env/bin/python ../test.py
    "$srcdir/$_pypi-$pkgver"/test-env/bin/pip uninstall -yq example
  done
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pypi-$pkgver"-*.whl
}
