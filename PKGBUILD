# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=FMPy
pkgname=python-${_base,,}
_gitcommit=22ad62fa4e721e6609aceb2501ebcb7693fa798d
pkgver=0.3.26
pkgrel=1
pkgdesc="Simulate Functional Mockup Units (FMUs) in Python"
url="https://github.com/CATIA-Systems/${_base}"
arch=(x86_64)
license=(BSD-2-Clause)
depends=(python-attrs python-jinja python-lark-parser python-lxml python-msgpack python-numpy jupyter-nbformat sundials) # rpclib
makedepends=(python-build python-installer python-hatchling python-wheel python-requests cmake git python-toml)
checkdepends=(python-pytest python-dask python-scipy python-plotly)
optdepends=('python-matplotlib: for plot results'
  'python-kaleido: for SVG export'
  'jupyter-notebook: for simulate the FMU in jupyter'
  'python-plotly: for plot results'
  'python-dash-bootstrap-components: for webapp support'
  'python-pyqtgraph: for graphical user interface') # python-pyqt6 python-pyqt6-webengine
source=(git+${url}.git#commit=${_gitcommit}
  git+https://github.com/ludocode/mpack.git
  git+https://github.com/modelica/Reference-FMUs.git)
sha512sums=('fa641ade8eabb827b3c5c0fedeaea76aeb176cb31e2fbadcfa07ac7acdd80e991b307bb4f72a10d518d319dcdf7dc07a8e33db4e9675fa678396abf570ae5e4f'
  'SKIP'
  'SKIP')

prepare() {
  cd ${_base}
  git submodule init
  git config submodule.libs/thirdparty/mpack.url "${srcdir}/mpack"
  git config submodule.libs/thirdparty/Reference-FMUs.url "${srcdir}/Reference-FMUs"
  git -c protocol.file.allow=always submodule update
  # sed -i "s/\['cmake'/\['cmake', '-DCMAKE_CXX_FLAGS=\"-Wno-format-security\"'/" build_binaries.py
  # sed -i "32 a \ \ \ \ \ \ \ \ '-D', 'CMAKE_CXX_FLAGS="-Wno-format-security"'," build_binaries.py
  # sed -i "s/^        fprintf/        fputs/" src/modelica/ModelicaFMI.c
  # sed -i "s/		printf/		fputs/" src/modelica/ModelicaUtilities.c
  # sed -i "s/library_dir, _ = os.path.split(__file__)/library_dir = '\/usr\/lib'/" ${_base}/${_base,,}/sundials/libraries.py
  # sed -i "s/, platform_tuple//" ${_base}/${_base,,}/sundials/libraries.py
  # sed -i "s/'s/'libs/" ${_base}/${_base,,}/sundials/libraries.py
  # sed -i '/if major/,+1 s/^/#/' ${_base}/${_base,,}/sundials/__init__.py
}

build() {
  cd ${_base}/native
  PYTHONPATH=$PWD/../src python download_binaries.py
  # PYTHONPATH=$PWD/../src python build_cvode.py build_binaries.py
  cd ${srcdir}/${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   PATH="${srcdir}/${_base}/test-env/bin:$PATH"
#   test-env/bin/python -m pytest tests \
#     -k 'not cmake and not simulate and not cswrapper and not create_juypter_notebook' \
#     --ignore=tests/test_fmu_container.py
# }

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf ${pkgdir}${site_packages}/${_base,,}/sundials/x86_64-darwin/
  rm -rf ${pkgdir}${site_packages}/${_base,,}/sundials/x86_64-windows/
  rm -rf ${pkgdir}${site_packages}/${_base,,}/sundials/x86_64-linux/
}
