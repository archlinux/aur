# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pytest-variables
pkgname=python-${_base}
pkgdesc="pytest plugin for providing variables to tests/fixtures"
pkgver=2.0.0
pkgrel=1
arch=(any)
url="https://github.com/pytest-dev/${_base}"
license=(MPL2)
depends=(python-pytest)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-hjson python-yaml python-toml)
optdepends=('python-hjson: for json support'
  'python-yaml: for YAML support'
  'python-toml: for TOML support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3f092df8ddeda4a554e9d7e677218e5fca196775a009320f4f0de9f740bb6f6dfe5bb014b1c418c91d7870f402328e68bdee8701417da2ab375673de07135b40')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
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
