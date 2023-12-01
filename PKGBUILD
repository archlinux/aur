_base=FMPy
pkgname=python-${_base,,}-sundials6
_gitcommit=8945636e85f09e6267b2b4ee101b99c81982530a
pkgver=0.3.19
pkgrel=1
pkgdesc="Simulate Functional Mockup Units (FMUs) in Python"
url="https://github.com/CATIA-Systems/${_base}"
arch=(x86_64)
license=('custom:BSD-2-clause')
conflicts=("python-fmpy")
provides=("python-fmpy")
depends=(python-attrs python-jinja python-lark-parser python-lxml python-msgpack python-numpy python-pytz sundials) # rpclib
makedepends=(python-build python-installer python-setuptools python-wheel python-requests cmake git)
checkdepends=(python-pytest python-dask python-scipy python-plotly jupyter-nbformat)
optdepends=('python-matplotlib: for plot results'
  'python-kaleido: for SVG export'
  'jupyter-notebook: for simulate the FMU in jupyter'
  'python-plotly: for plot results'
  'python-dash-bootstrap-components: for webapp support'
  'python-pyqtgraph: for graphical user interface') # python-pyqt5 python-pyqt5-webengine
source=(git+${url}.git#commit=${_gitcommit}
  git+https://github.com/ludocode/mpack.git
  git+https://github.com/modelica/Reference-FMUs.git sundials6.patch)
sha512sums=('SKIP'
  'SKIP'
  'SKIP' 'SKIP')

prepare() {
  cd ${_base}
  git submodule init
  git config submodule.libs/thirdparty/mpack.url "${srcdir}/mpack"
  git config submodule.libs/thirdparty/Reference-FMUs.url "${srcdir}/Reference-FMUs"
  git -c protocol.file.allow=always submodule update
  patch -p1 -i "${srcdir}"/sundials6.patch
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
  cd ${_base}
  python build_binaries.py
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   PATH="${srcdir}/${_base}/test-env/bin:$PATH"
#   test-env/bin/python -m pytest tests \
#     -k 'not cmake and not simulate and not create_juypter_notebook and not cswrapper' \
#     --ignore=test_fmu_container.py \
#     --ignore=tests/test_fmu_container.py
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
