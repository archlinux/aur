# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=gustaf
pkgname=python-${_base}
_gitcommit=23ebe6e14ff9ccdd05b802d1978239ff9496ed22
pkgver=0.0.26
pkgrel=1
pkgdesc="Process and visualize numerical-analysis-geometries"
url="https://tataratat.github.io/${_base}"
license=(MIT)
arch=(any)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-napf)
optdepends=('python-vedo: for renderer and visualization'
  'python-scipy: for create k-d tree'
  'python-meshio: for load and export numerous mesh formats'
  'python-napf: for fast k-d tree build'
  'python-funi: for find unique float array rows')
source=(git+https://github.com/tataratat/${_base}.git#commit=${_gitcommit})
sha512sums=('375998323e6279521f020c11a46ce8caca73481a535cf44fa2e840178c9b71e7e1b9a3d0f9ddfcffb2cf80474156678274bca6e01023434fd613234f196e4eb4')

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
