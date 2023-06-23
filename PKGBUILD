# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-scikit-build-core
pkgdesc='Next generation Python CMake adaptor and Python API for plugins'
url='https://scikit-build-core.readthedocs.io/'
pkgver=0.4.6
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
  '54f06b23dea20284730c437d6af4298299165950a55cb7fb933915e1070a35a1'
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
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pypi-$pkgver"-*.whl
}
