# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=K3D
pkgname=python-${_base,,}
pkgdesc="3D visualization library"
pkgver=3.0.1
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
sha512sums=('c8f592c6db6a39b96248c548d2ff8e0a74624eb898b6199af3843b8d76e13fe883e3c897ba18f2a6d98b82b920e20c46ad47edad46678f8f053181977739aa12')

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
