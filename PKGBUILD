# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pytest-base-url
pkgname=python-${_base}
pkgdesc="pytest plugin for URL based testing"
pkgver=1.4.2
pkgrel=2
arch=('any')
url="https://github.com/pytest-dev/${_base}"
license=(MPL2)
depends=(python-pytest python-requests)
makedepends=(python-setuptools-scm git)
checkdepends=(python-pytest-localserver)
source=("git+${url}.git?#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${_base}"
  python setup.py build
}

check() {
  cd "${_base}"
  python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest tests
}

package() {
  cd "${_base}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
