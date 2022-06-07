# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pytest-codeblocks
pkgname=python-${_base}
pkgdesc="Test code blocks in your READMEs"
pkgver=0.16.0
pkgrel=1
arch=(any)
url="https://github.com/nschloe/${_base}"
license=(MIT)
depends=(python-pytest)
makedepends=(python-build python-flit-core python-install)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e841ed11c8cd8e73b888bdee3ceda82193e0ed0441d623c586c69c45412039656a09e9f872f187c72d4e245ac8ee99b4a099ed9ae1a13f88f564bc0b9fae69f6')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  test-env/bin/python -m pytest -p pytester
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-$pkgver.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
