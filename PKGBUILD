# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pygmsh
pkgname=python-${_base}
pkgdesc="Gmsh for Python"
pkgver=7.1.15
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-meshio gmsh)
makedepends=(python-build python-flit-core python-install)
# python-pip
checkdepends=(python-pytest-codeblocks)
# python-matplotlib
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('601792a83f76a3da9fdae64cbba336fadf8e1f68641210280002c58abe5e6340d3582051621ca804362b05a8a90954974037d53d685ec0815ca6707e741aa567')

build() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPATH="/usr/share/gmsh/api/python:${PYTHONPATH}" python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  MPLBACKEND=Agg PYTHONPATH="/usr/share/gmsh/api/python:${PYTHONPATH}" test-env/bin/python -m pytest --codeblocks -k 'not circle and not ellipsoid and not swiss_cheese' # MPLBACKEND=Agg
}

package() {
  cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # https://github.com/FFY00/python-install/pull/6
  chmod +x ${pkgdir}/usr/bin/*

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-$pkgver.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  echo 'Important note: for the python-gmsh module to be available you need to add export PYTHONPATH="$PYTHONPATH:/usr/share/gmsh/api/python" in ~/.bashrc, ~/.zshrc, etc. :-)'
}
