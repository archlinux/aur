# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=meshzoo
pkgname=python-${_base}
pkgdesc="A collection of meshes for canonical domains"
pkgver=0.9.3
pkgrel=3
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-numpy)
makedepends=(python-build python-flit-core python-install)
checkdepends=(python-pytest-codeblocks python-matplotlib)
optdepends=('python-matplotlib: for Matplotlib rendering in 2d')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b97159e897c59af7523dfafc2df4895cdca9045e86f2998111510dfe3de624e4474dcfce5a5f081b8a9f78b35134a421e91e4cb3c6215c077f2088d2783520f0')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest --codeblocks
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # https://github.com/FFY00/python-install/pull/6
  chmod +x ${pkgdir}/usr/bin/*

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
