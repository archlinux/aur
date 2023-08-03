# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-vtk
_npm_base=vue-vtk-js
pkgname=python-${_base}
pkgdesc="VTK widgets for trame"
pkgver=2.5.8
_npm_pkgver=3.1.7
pkgrel=1
arch=(any)
url="https://github.com/Kitware/${_base}"
license=('custom:BSD-3-clause')
depends=(python-trame-client vtk openmpi fmt jsoncpp glew ospray
  openxr openvr ffmpeg hdf5-openmpi postgresql-libs netcdf pdal
  mariadb-libs liblas cgns adios2 libharu gl2ps verdict qt5-tools)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-xprocess python-pillow python-pixelmatch python-seleniumbase python-pyvista) # python-trame-vuetify
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  https://registry.npmjs.org/${_npm_base}/-/${_npm_base}-${_npm_pkgver}.tgz
  https://kitware.github.io/vtk-js/examples/OfflineLocalView/OfflineLocalView.html)
sha512sums=('bccdbecf0a1e42529486a95eac9136fab97308928d4db688316cae9d6fd7dc8d23173769068ba1b79491027e857e5805828f25041cb9970e92dfcaf356355eba'
  '66ed3556c34303c3af0de0585ad6e2e39d3dcec2a4e8773b98aef7312239c4d11466ff180c64aad192c4842fdcb83292dd26a3d98696cb0493a10fbb5f80f0c9'
  '78c5ad8b671074ca4456334743bf1835c360d2b49da3b27c8ecc7fd88b207c474474db12c67b54b3ed07ebc586b55e6f692e37f2b06b324ac91bc05af95fa4b5')

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
