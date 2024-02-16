# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=K3D
pkgname=python-${_base,,}
pkgdesc="3D visualization library"
pkgver=2.16.1
pkgrel=1
arch=(any)
url="https://github.com/${_base}-tools/${_base}-jupyter"
license=(MIT)
depends=(python-traittypes python-msgpack python-ipywidgets)
makedepends=(python-build python-installer python-hatch-nodejs-version python-hatch-jupyter-builder
  python-wheel jupyterlab nodejs-lts-hydrogen npm)
checkdepends=(python-pytest)
optdepends=('jupyterlab: for notebook support')
source=(${_base}-jupyter-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7e121b93d1d5529d7fb7b88de6c2a46da1608bdcd3c1e677746756698adb30229a0a138b27124a8f51d38d48255dffd869e7d54aec23d581429fb867349e2d76')

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
