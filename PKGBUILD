# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=pytest-flakefinder
pkgname=python-${_name}
pkgver=1.1.0
pkgrel=2
pkgdesc='Runs tests multiple times to expose flakiness.'
arch=('any')
url='https://github.com/dropbox/pytest-flakefinder'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e2412a1920bdb8e7908783b20b3d57e9dad590cc39a93e8596ffdd493b403e0e')
depends=('python>=3.5' 'python-pytest')
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest')

prepare(){
  cd "${srcdir}"/${_name}-${pkgver}
  sed -i "/result = testdir.runpytest(/{/--flake-finder/ s/\(--flake-finder[^)]*\)/\1, '-p', 'no:pretty'/}" tests/test_flakefinder.py
}

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
