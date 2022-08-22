# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Astro Benzene <universebenzene at sina dot com>
_pkgname=iminuit
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python-${_pkgname}-docs")
pkgver=2.16.0
pkgrel=1
pkgdesc="Python interface for MINUIT, a physics analysis tool for function minimization."
arch=('x86_64')
url="https://iminuit.readthedocs.io"
license=('GPL' 'MIT')
depends=('python-numpy')
makedepends=('git' 'cmake' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-joblib'
             'python-boost-histogram' 'python-nbsphinx' 'python-sphinx_rtd_theme' 'python-matplotlib' 'python-pillow' 'pandoc' 'python-ipywidgets')
checkdepends=('python-pytest' 'python-scipy' 'python-tabulate')
options=(!emptydirs)
source=(
  "${pkgbase}::git+https://github.com/scikit-hep/iminuit#tag=v${pkgver}"
  "${pkgbase}-pybind11::git+https://github.com/pybind/pybind11.git"
  "${pkgbase}-root::git+https://github.com/root-project/root.git"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

get_pyver () {
    python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
}

get_cpyver () {
    python -c 'import sys; print(str(sys.version_info[0]) + str(sys.version_info[1]))'
}

prepare() {
  cd "${srcdir}/${pkgbase}"
  git submodule init

  git config submodule."extern/root".url "${srcdir}/${pkgname}"-root
  git config submodule."extern/pybind11".url "${srcdir}/${pkgname}"-pybind11

  # root submodule reference is broken, fix it
  git submodule update --init --recursive extern/pybind11
  git submodule update --recursive --remote --merge extern/root

  # python-cmake is not needed
  sed -i '/cmake/d' pyproject.toml
}

build() {
  cd "${srcdir}/${pkgbase}"

  # build
  python -m build --wheel --no-isolation

  # build docs
  python -m venv --system-site-packages test-env
  test-env/bin/python -m pip install numba-stats resample
  echo 'nbsphinx_allow_errors = True' >> doc/conf.py
  PYTHONPATH="${PWD}/test-env/lib/python$(get_pyver)/site-packages:${PWD}/build/lib.linux-${CARCH}-cpython-$(get_cpyver)" make build/html/done
}

check() {
  cd "${srcdir}/${pkgbase}"

  PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-$(get_cpyver)" pytest || warning "Tests failed"
}

package_python-iminuit() {
  optdepends=('python-iminuit-doc: Documentation for python-iminuit')
  cd "${srcdir}/${pkgname}"

  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-iminuit-docs() {
  cd "${srcdir}/${pkgbase}"

  install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a build/html "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
