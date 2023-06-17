# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-vtk
pkgname=python-${_base}
pkgdesc="VTK widgets for trame"
pkgver=2.5.0
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=('custom:BSD-3-clause')
depends=(python-trame-client paraview)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-xprocess) # python-pyvista
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('17da5ef550890d7aa742687d296a3464b6c910e4e1e7c0a6127cb3d7170dfb248e9fc12080b722a2186e282962fb6ad7963279bdf2d3124538e263be70906bfb')

prepare() {
  sed -i 's/^include/#include/' ${_base}-${pkgver}/MANIFEST.in
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --ignore=tests/test_remote_rendering.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm ${pkgdir}${site_packages}/trame/__init__.py
  rm ${pkgdir}${site_packages}/trame/modules/__init__.py
  rm ${pkgdir}${site_packages}/trame/widgets/__init__.py
}
