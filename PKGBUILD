pkgname=apio
_name=apio
pkgver=1.4.0
pkgrel=1
pkgdesc="Experimental micro-ecosystem for open FPGAs"
arch=('any')
url="https://pypi.org/project/apio/"
license=('GPL-3.0-or-later')
depends=(
    'python-click'
    'python-colorama'
    'python-configobj'
    'python-debugpy'
    'python-packaging'
    'python-pyserial'
    'python-requests'
    'python-semantic-version'
    'python-setuptools'
    'python-vcdvcd'
    'python-wheel'
    'scons'
)
makedepends=('python-build' 'python-flit-core' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7587cbef11602f0fc918a0c502b8a64cba570d6ab8e829c13ea82c512f7f00a6')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Add include section for Flit
  sed -i '/\[tool.flit.sdist\]/a include = ["pyproject.toml", "LICENSE", "apio/"]' pyproject.toml
}

build() {
  cd "${_name}-$pkgver"

  python -m venv build-venv
  ./build-venv/bin/pip install "flit<4"

  ./build-venv/bin/python -m flit build
}

check() {
  cd "${_name}-$pkgver"
  echo "Tests are not shipped in the PyPI release, skipping"
}

package() {
  cd "${_name}-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
