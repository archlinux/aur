# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=K3D
pkgname=python-${_base,,}
pkgdesc="3D visualization library"
pkgver=2.17.0
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
sha512sums=('4ebaaa604011cec645d5e8f9720f80377d381ef5ded08bbfb070c2d73b6efe7c7ac6d911ba91d2d401e27bcd47c6d29e8011a70396034d2d8b6fcd2d777d0e44')

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
