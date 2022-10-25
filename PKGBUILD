# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pytest-base-url
pkgname=python-${_base}
pkgdesc="pytest plugin for URL based testing"
pkgver=2.0.0
pkgrel=1
arch=(any)
url="https://github.com/pytest-dev/${_base}"
license=(MPL2)
depends=(python-pytest python-requests)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest-localserver)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('91bccc0809050552feef9e0445e16433f5f5ab45bbc69e2b88ad49ddfdb9304f46a039760c3dc052b38b1954412059fceec346f14add7dc9968692610a1209ba')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
