pkgname=apio
_name=apio
pkgver=0.8.1
pkgrel=1
pkgdesc="Experimental micro-ecosystem for open FPGAs"
arch=('any')
url="https://pypi.org/project/apio/"
license=('GPL')
depends=('python-click' 'python-pyserial' 'python-semantic-version'
         'python-colorama' 'python-requests' 'sudo'
         'python-wheel' 'scons' 'python-setuptools')
makedepends=('python-build' 'python-flit' 'python-install')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('73c24f6fe8174dac50c0a29084c20f7fe958c5af6f37d0dc49f9f495f5746766')

build() {
  cd "${_name}-$pkgver"

  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${_name}-$pkgver"

  # We need a venv since apio.commands.upgrade requests the installed apio package version
  python -m venv --system-site-packages test-venv
  ./test-venv/bin/python -m install dist/*.whl

  ./test-venv/bin/python -m pytest -v -c /dev/null test --offline
}

package() {
  cd "${_name}-$pkgver"

  python -m install --optimize=1 --destdir="$pkgdir" dist/*.whl

  chmod +x $pkgdir/usr/bin/apio
}
