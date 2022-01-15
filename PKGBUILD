# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=perfplot
pkgname=python-${_base}
pkgdesc="Performance plots for Python code snippets"
pkgver=0.9.15
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-matplotx python-rich)
makedepends=(python-build python-flit-core python-install)
checkdepends=(python-pytest-codeblocks)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cfa8b6964af64f16550662230597033f2c612dcb1a2cfd9143a39ef969627865131fba0c5e5998134e071feeb7d5264511d6c8e1596e9807a9517901667f100c')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${_base}-${pkgver}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest --codeblocks
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_base}-$pkgver.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
