_base=FMPy
pkgname=python-${_base,,}-sundials6
_gitcommit=5823133022409b08e13d3164b06374a4e5e56af8
pkgver=0.3.32
pkgrel=1
pkgdesc="Simulate Functional Mockup Units (FMUs) in Python"
url="https://github.com/CATIA-Systems/${_base}"
arch=(x86_64)
license=('custom:BSD-2-clause')
conflicts=("python-fmpy")
provides=("python-fmpy")
depends=(python-attrs python-jinja python-lark python-lxml python-msgpack python-numpy sundials)
makedepends=(python-build python-installer python-setuptools python-wheel python-requests cmake git python-hatchling python-toml rust)
# checkdepends=(python-pytest python-dask python-scipy python-plotly jupyter-nbformat)
optdepends=('python-matplotlib: for plot results'
  'python-kaleido: for notebook support'
  'jupyter-notebook: for notebook support'
  'python-plotly: for plot results'
  'python-scipy: for plot results'
  'python-requests: for examples'
  'python-dash-bootstrap-components: for webapp support'
  'pyside6: for graphical user interface'
  'python-pyqtgraph: for graphical user interface')
source=(git+${url}.git#commit=${_gitcommit}
  git+https://github.com/ludocode/mpack.git
  git+https://github.com/modelica/Reference-FMUs.git)
sha512sums=('SKIP'
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

  sed -i "s/open(lockFilePath, O_CREAT | O_EXCL)/open(lockFilePath, O_CREAT | O_EXCL, 0600)/g" native/remoting/client_tcp.cpp

  # drop foreign binaries
  sed -i "/darwin/d" pyproject.toml
  sed -i "/win32/d" pyproject.toml
  sed -i "/win64/d" pyproject.toml
  sed -i "/windows/d" pyproject.toml
  sed -i "/sundials_/d" pyproject.toml
}

build() {
  cd ${_base}/native
  PYTHONPATH=$PWD/../src python build_binaries.py
  PYTHONPATH=$PWD/../src python build_remoting.py
  PYTHONPATH=$PWD/../src python build_container_fmu.py
  cd ..
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
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
