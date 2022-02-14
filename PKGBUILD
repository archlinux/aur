# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=cplot
pkgname=python-${_base}
pkgdesc="Plot complex functions"
pkgver=0.8.9
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-colorio python-matplotx python-networkx python-pypng)
makedepends=(python-build python-flit-core python-install)
checkdepends=(python-pytest-codeblocks python-meshzoo)
optdepends=('python-meshzoo: for riemann sphere plots'
  'python-pyvista: for create an unstructured grid')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f639d9a3c866b0381884fe85fbf942aa03cfc3058c89ee3c90b08a5b1bd957c804501d16c65fb20931a5373aa97aa00b62cf8976238a85617508d40d7adc386a')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest --codeblocks -k 'not README and not riemann'
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
