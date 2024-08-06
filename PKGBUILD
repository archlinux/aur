pkgname=apio
_name=apio
pkgver=0.9.5
pkgrel=1
pkgdesc="Experimental micro-ecosystem for open FPGAs"
arch=('any')
url="https://pypi.org/project/apio/"
license=('GPL')
depends=(
    'python-click'
    'python-colorama'
    'python-pyserial'
    'python-requests'
    'python-semantic-version'
    'python-setuptools'
    'python-wheel'
    'scons'
)
makedepends=('python-build' 'python-flit-core' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('511255c3427817aabb997adc891f079dfa4e1e60c6f2a7180125d0c20057136c')

build() {
  cd "${_name}-$pkgver"

  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${_name}-$pkgver"

  # We need a venv since apio.commands.upgrade requests the installed apio package version
  python -m venv --system-site-packages --clear test-venv
  ./test-venv/bin/python -m installer dist/*.whl

  ./test-venv/bin/python -m pytest -v -c /dev/null test --offline
}

package() {
  cd "${_name}-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
