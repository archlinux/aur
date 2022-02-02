# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyfvm
pkgname=python-${_base}
pkgdesc="Finite volume discretization tools for Python"
pkgver=0.3.9
pkgrel=1
arch=(any)
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-meshplex python-scipy python-sphinxcontrib-bibtex python-sympy)
makedepends=(python-build python-flit-core python-install)
checkdepends=(python-pytest-codeblocks python-matplotlib python-meshzoo python-pyamg) # python-netcdf4
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('f0c66167a692442f257263c3d8abeb9a3d50c2f0dbeacfa8d44e88f89d8937d1c4f39c6053822245ca99013a4c29a2a4fb64d430ea77b8421583d43bf371126a')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  MPLBACKEND=Agg PATH="${PWD}/test-env/bin:$PATH" test-env/bin/python -m pytest --codeblocks tests -k 'not jacobian'
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
