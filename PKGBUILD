# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-vtk
_npm_base=vue-vtk-js
pkgname=python-${_base}
pkgdesc="VTK widgets for trame"
pkgver=2.5.4
_npm_pkgver=3.1.7
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=('custom:BSD-3-clause')
depends=(python-trame-client vtk openmpi fmt jsoncpp glew ospray
  openxr openvr ffmpeg hdf5-openmpi postgresql-libs netcdf pdal
  mariadb-libs liblas cgns adios2 libharu gl2ps verdict)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-xprocess python-pillow python-pixelmatch python-seleniumbase python-pyvista) # FIXME: python-matplotlib
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  https://registry.npmjs.org/${_npm_base}/-/${_npm_base}-${_npm_pkgver}.tgz
  https://kitware.github.io/vtk-js/examples/OfflineLocalView/OfflineLocalView.html)
sha512sums=('bc2745283f910634a07bc91793dbc56a5146c030b2c19817564bffd8e967db25b789262d47a918e3396fa7e0b183b41322e49e96d1875bbd96bf63bacb280b9a'
  '66ed3556c34303c3af0de0585ad6e2e39d3dcec2a4e8773b98aef7312239c4d11466ff180c64aad192c4842fdcb83292dd26a3d98696cb0493a10fbb5f80f0c9'
  'SKIP')

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
  test-env/bin/python -m pytest \
    --ignore=tests/test_gc.py \
    -k 'not reactivity[examples/validation/PyVistaInt64.py] and not reactivity[examples/validation/PyVistaLookupTable.py]'
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
