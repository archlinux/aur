# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Astro Benzene <universebenzene at sina dot com>
_pkgname=iminuit
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python-${_pkgname}-docs")
pkgver=2.21.3
_commit=d83dc285b2789ceea620fb3dcdef609e6967d6b7  # refs/tags/v2.21.3
pkgrel=1
pkgdesc="Python interface for MINUIT, a physics analysis tool for function minimization."
arch=('x86_64')
url="https://iminuit.readthedocs.io"
license=('GPL' 'MIT')
makedepends=(
  'git'
  'cmake'
  'pandoc'
  'pybind11'
  'python-boost-histogram'
  'python-build'
  'python-installer'
  'python-ipykernel'
  'python-ipywidgets'
  'python-joblib'
  'python-matplotlib'
  'python-nbsphinx'
  'python-numba'
  'python-numpy'
  'python-pillow'
  'python-pyrsistent'
  'python-setuptools'
  'python-sphinx_rtd_theme'
  'python-wheel'
)
checkdepends=('python-pytest' 'python-scipy' 'python-tabulate')
options=(!emptydirs)
source=(
  "${pkgbase}::git+https://github.com/scikit-hep/iminuit#commit=$_commit"
  "${pkgbase}-pybind11::git+https://github.com/pybind/pybind11.git"
  "${pkgbase}-root::git+https://github.com/root-project/root.git"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

_get_pyver () {
    python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

_get_cpyver () {
    python -c 'import sys; print(str(sys.version_info[0]) + str(sys.version_info[1]))'
}

prepare() {
  cd "${pkgbase}"
  git submodule init

  git config submodule."extern/root".url "${srcdir}/${pkgname}"-root
  git submodule deinit "extern/pybind11"

  # root submodule reference is broken, fix it
  git -c protocol.file.allow=always submodule update --init --recursive

  # python-cmake is not needed
  sed -i '/cmake/d' pyproject.toml
}

build() {
  cd "${pkgbase}"

  # build against system pybind11
  export CMAKE_ARGS='-DIMINUIT_EXTERNAL_PYBIND11=ON'
  python -m build --wheel --no-isolation

  # NOTE: building docs is broken because numba* is not compatible with Python 3.11 and fails to install/build in a venv
  # # build docs
  # python -m venv --system-site-packages test-env
  # test-env/bin/python -m pip install numba-stats resample
  # echo 'nbsphinx_allow_errors = True' >> doc/conf.py
  # PYTHONPATH="${PWD}/test-env/lib/python$(_get_pyver)/site-packages:${PWD}/build/lib.linux-${CARCH}-cpython-$(_get_cpyver)" make build/html/done

  # NOTE: this is an attempt at building it with system dependencies, unfortunately there are issues with importing nbconvert.RSTExporter() for some reason...
  # local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  # python -m installer --destdir=test_dir dist/*.whl
  # export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  # sphinx-build -v -W -b html -d build/doctrees doc build/html
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgbase
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest -vv
}

package_python-iminuit() {
  depends=(
    'gcc-libs'
    'glibc'
    'python'
    'python-numpy'
  )
  optdepends=(
    'python-iminuit-docs: Documentation for python-iminuit'
    'python-ipython: for plotting'
    'python-ipywidgets: for plotting'
    'python-matplotlib: for drawing operations'
    'python-progressbar: for progressbar support'
    'python-scipy: for scipy minimizers'
  )

  cd "${pkgname}"

  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-iminuit-docs() {
  cd "${pkgbase}"

  install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}"
  # NOTE: there's currently nothing to install... consider dropping as online documentation exists
  # cp -a build/html "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
