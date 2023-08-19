# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=gustaf
pkgname=python-${_base}
pkgver=0.0.12
pkgrel=1
pkgdesc="Process and visualize numerical-analysis-geometries"
url="https://tataratat.github.io/${_base}"
license=(MIT)
arch=(any)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-scipy)
optdepends=('python-vedo: for renderer and visualization'
  'python-scipy: for create k-d tree'
  'python-meshio: for load and export numerous mesh formats'
  'python-napf: for fast k-d tree build'
  'python-funi: for find unique float array rows')
source=(${_base}-${pkgver}.tar.gz::https://github.com/tataratat/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('7c916dc7c9c61271406a932151b6bf0633bbecba36f80feaf55de46553f4d8ee374b5ca4cae27d07ee8b0d81ef5f6407dae37192687de83b456a75e795b62cc9')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
