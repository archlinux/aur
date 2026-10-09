# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=K3D
pkgname=python-${_base,,}
pkgdesc="3D visualization library"
pkgver=3.2.0
pkgrel=1
arch=(any)
url="https://github.com/${_base}-tools/${_base}-jupyter"
license=(MIT)
depends=(python-traittypes python-msgpack python-ipywidgets python-deepcomparer)
makedepends=(python-build python-installer python-hatch-nodejs-version python-hatch-jupyter-builder
  python-wheel jupyterlab nodejs-lts-iron npm)
checkdepends=(python-pytest)
optdepends=('jupyterlab: for notebook support')
source=(${_base}-jupyter-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7d633e1a31876339861fd5beb352dbd24978066b2ebc23bb735c07d16a08afd4ff6632dc4862546b200a347f998d85981c810f5fbc8a2936d43c5b85196b68ac')

build() {
  cd ${_base}-jupyter-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-jupyter-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest ${_base}/test
}

package() {
  cd ${_base}-jupyter-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
