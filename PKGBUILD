pkgname=apio
_name=apio
pkgver=0.8.0
pkgrel=1
pkgdesc="Experimental micro-ecosystem for open FPGAs"
arch=('any')
url="https://pypi.org/project/apio/"
license=('GPL')
depends=('python-click' 'python-pyserial' 'python-semantic-version'
         'python-colorama' 'python-requests' 'sudo'
         'python-wheel' 'scons')
makedepends=('python-build' 'python-flit' 'python-install')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('6a5b841c7a9259a1aa4e5533f8288c58b388714c362f15399b17f18b394fea99')

build() {
  cd "${_name}-$pkgver"

  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${_name}-$pkgver"

  # We need a venv since apio.commands.upgrade requests the installed apio package version
  python -m venv --system-site-packages test-venv
  ./test-venv/bin/python -m install dist/*.whl

  ./test-venv/bin/python -m pytest -v -c /dev/null test
}

package() {
  cd "${_name}-$pkgver"

  python -m install --optimize=1 --destdir="$pkgdir" dist/*.whl

  chmod +x $pkgdir/usr/bin/apio
}
