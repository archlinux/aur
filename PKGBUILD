# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=gustaf
pkgname=python-${_base}
_gitcommit=5c248f3646097a66432f822e3832f865bed6d71d
pkgver=0.0.19
pkgrel=1
pkgdesc="Process and visualize numerical-analysis-geometries"
url="https://tataratat.github.io/${_base}"
license=(MIT)
arch=(any)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel git)
checkdepends=(python-pytest python-scipy)
optdepends=('python-vedo: for renderer and visualization'
  'python-scipy: for create k-d tree'
  'python-meshio: for load and export numerous mesh formats'
  'python-napf: for fast k-d tree build'
  'python-funi: for find unique float array rows')
source=(git+https://github.com/tataratat/${_base}.git#commit=${_gitcommit})
sha512sums=('SKIP')

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
