# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot top>
_base=optimesh
pkgname=python-${_base}
pkgdesc="Mesh optimization, mesh smoothing"
pkgver=0.8.6
pkgrel=1
arch=(any)
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-meshplex python-quadpy python-termplotlib)
makedepends=(python-build python-flit-core python-install)
checkdepends=(python-pytest-codeblocks python-meshzoo python-matplotx)
optdepends=('python-matplotlib: for Matplotlib rendering')
provides=('optimesh' 'optimesh-info')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('a748b02df6b8ced94d094d721994f32468b07bfc675298765f91a39203c68bb2612d42accc1a13dcabb99237306e6bc0937638871ce6cde1219f2a937ad2b6f0')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  test-env/bin/python -m pytest --codeblocks
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # https://github.com/FFY00/python-install/pull/6
  chmod +x ${pkgdir}/usr/bin/*

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-$pkgver.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
