# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-vtk
_npm_base=vue-vtk-js
pkgname=python-${_base}
pkgdesc="VTK widgets for trame"
pkgver=2.8.0
_npm_pkgver=3.2.1
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=('custom:BSD-3-clause')
depends=(python-trame-client vtk openmpi fmt jsoncpp glew ospray
  openxr openvr ffmpeg hdf5-openmpi postgresql-libs netcdf pdal
  mariadb-libs liblas cgns adios2 libharu gl2ps verdict qt5-tools)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-xprocess python-pixelmatch python-seleniumbase python-pyvista) # python-trame-vuetify
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  https://registry.npmjs.org/${_npm_base}/-/${_npm_base}-${_npm_pkgver}.tgz
  https://raw.githubusercontent.com/Kitware/vtk-js/2d8de2853a1e63c12f9682acb3531083b77c4e3d/examples/OfflineLocalView/OfflineLocalView.html)
sha512sums=('ee2287f4b468937b5a7ce89ed3841492f91d90e5fed56bd980ce367f85a2d12b6b6db2929c98a6524e2f1833c890087a21ed3dae7e2eb30468102de94de74133'
            '17f81804464093d75663a7ad9e93b670171026d39c2a5dda6864e6e5ccc97b590efa0610f9fabf038f6a76802595705f05720f9f918303e14e8bfa6a489a9be6'
            '6f09789d876b431370dc55b04ba327092af218d1abea52dd4ec4c9de5b4340cbac2218f438bb231e0cab108f7edcc54d2e15d0c0b262067afb7a515a451414f5')

prepare() {
  sed -i 's/^include trame_vtk\/LICENSE/#include trame_vtk\/LICENSE/' ${_base}-${pkgver}/MANIFEST.in
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest \
    --ignore=tests/test_gc.py \
    -k 'not rendering[examples/validation/PyVistaInt64.py] and not rendering[examples/validation/PyVistaLookupTable.py] and not rendering[examples/validation/VolumeRendering.py]'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  # Install trame-vtk.js
  mv ${srcdir}/package/dist/${_npm_base::-3}.umd.js ${pkgdir}${site_packages}/${_base/-/_}/modules/common/serve/trame-vtk.js
  # Install static_viewer.html
  mv ${srcdir}/OfflineLocalView.html ${pkgdir}${site_packages}/${_base/-/_}/tools/static_viewer.html

  rm ${pkgdir}${site_packages}/trame/__init__.py
  rm ${pkgdir}${site_packages}/trame/modules/__init__.py
  rm ${pkgdir}${site_packages}/trame/widgets/__init__.py
  rm ${pkgdir}${site_packages}/trame/tools/__init__.py
}
