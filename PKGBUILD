# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=codepy
pkgname=python-${_base}
pkgdesc="Generate and execute native code at run time"
pkgver=2025.1
pkgrel=1
arch=(x86_64)
url="https://documen.tician.de/${_base}"
license=(MIT)
depends=(python-cgen boost)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('af093007697a12d4cbdf1e38d977c8e1740ac81c5aafe10a1912d70fe55cf0d2067838503172dac267cb2a09697a189b3435546e40fb57dad73d3ed9738399b8')

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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  # https://github.com/inducer/codepy/issues/46
  rm -r ${pkgdir}${site_packages}/doc
}
