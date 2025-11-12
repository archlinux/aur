# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=gustaf
pkgname=python-${_base}
_gitcommit=790638da5d78659c71f6aef067e67dc96541a3d0
pkgver=0.1.2
pkgrel=1
pkgdesc="Process and visualize numerical-analysis-geometries"
url="https://tataratat.github.io/${_base}"
license=(MIT)
arch=(any)
depends=(python-numpy python-packaging)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-napf)
optdepends=('python-vedo: for renderer and visualization'
  'python-scipy: for create k-d tree'
  'python-meshio: for load and export numerous mesh formats'
  'python-napf: for fast k-d tree build'
  'python-funi: for find unique float array rows')
source=(git+https://github.com/tataratat/${_base}.git#commit=${_gitcommit})
sha512sums=('f29cfe9bc656476c87f18375e366fa7e4f496134491fe560debe6177524454de642a5d933802acffdef05dec401a4b7179ed8d1c4a6de73154d10299f55d06c4')

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
