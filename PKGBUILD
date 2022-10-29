# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=perfplot
pkgname=python-${_base}
pkgdesc="Performance plots for Python code snippets"
pkgver=0.10.2
pkgrel=1
arch=(x86_64)
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-matplotx python-rich)
makedepends=(python-build python-flit-core python-installer)
checkdepends=(python-pytest-codeblocks)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b11086e3b9737d09c1e8dea0c2abc35b0ebc540c8aa693e4ca2df23cef9ad7e0cb0e2fcf7ad572b933279b57c6953b54a24ea2e9f8958830463da9055da5c3ec')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest --codeblocks
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-$pkgver.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
