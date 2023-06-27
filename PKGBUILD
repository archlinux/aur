# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-vtk
pkgname=python-${_base}
pkgdesc="VTK widgets for trame"
pkgver=2.5.2
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=('custom:BSD-3-clause')
depends=(python-trame-client paraview)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-xprocess python-pillow) # python-pixelmatch python-pyvista
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b49a68862c0ab4cdc0f30d17a8e9cf3651810dbb01a52f6daec212d7a3347814292960615ba8a18597796314a9b9c8e8da8cac1cce810addcfd386bd694213f3')

prepare() {
  sed -i 's/^include/#include/' ${_base}-${pkgver}/MANIFEST.in
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest #--ignore=tests/test_remote_rendering.py
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm ${pkgdir}${site_packages}/trame/__init__.py
  rm ${pkgdir}${site_packages}/trame/modules/__init__.py
  rm ${pkgdir}${site_packages}/trame/widgets/__init__.py
}
