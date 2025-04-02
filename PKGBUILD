# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyprecice
pkgname=python-${_base}
pkgdesc="Python language bindings for the preCICE coupling library"
pkgver=3.2.0
pkgrel=1
arch=(x86_64)
url="https://github.com/${_base/py/}/python-bindings"
license=(LGPL-3.0-or-later)
depends=(precice python-mpi4py)
makedepends=(python-build python-installer python-setuptools cython python-pkgconfig python-wheel)
source=(python-bindings-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('81743f49ad284ff226b0a1ced9d8ee081d8d992da4a6254e5338183ac1dc7721be053fbff9d6c5cbadb5357003252e249f29d90ee7fa4aebdb6b91b2d037ddd7')

build() {
  cd python-bindings-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  # FIXME: https://github.com/precice/python-bindings/issues/1
  cd python-bindings-${pkgver}/examples/solverdummy
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer ../../dist/*.whl
  mpiexec -n 1 test-env/bin/python solverdummy.py precice-config.xml SolverOne &
  mpiexec -n 1 test-env/bin/python solverdummy.py precice-config.xml SolverTwo
}
package() {
  cd python-bindings-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
