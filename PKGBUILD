# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

_pkgname=awkward
pkgbase="python-${_pkgname}"
# pkgname=("${pkgbase}" "${pkgbase}-docs") - docs require many new dependencies
pkgname=$pkgbase
pkgver=2.6.5
pkgrel=4
pkgdesc="Manipulate jagged, chunky, and/or bitmasked arrays as easily as Numpy"
url="https://github.com/scikit-hep/awkward"
license=(BSD-3-Clause)
arch=(x86_64)
depends=(
  python
  python-importlib_resources
  python-numpy
  python-packaging
)
makedepends=(
  cmake
  cuda
  doxygen
  git
  python-build
  python-hatch-fancy-pypi-readme
  python-hatchling
  python-installer
  python-nox
  python-scikit-build-core
  python-sphinx
  python-sphinx_rtd_theme
)
checkdepends=(
  pybind11
  python-fsspec
  python-hist
  python-numexpr
  python-pandas
  python-pyaml
  python-pyarrow
  python-pytest
  python-scikit-hep-testdata
  python-vector
  rapidjson
  root
)
optdepends=(
  'cuda: CUDA support'
  'python-pyarrow: pyArrow connector'
  'python-numexpr: numexpr connector'
  'python-pandas: pandas connector'
)
source=(
  "${pkgname}::git+https://github.com/scikit-hep/${_pkgname}#tag=v${pkgver}"
  "${pkgname}-dlpack::git+https://github.com/dmlc/dlpack.git"
  "${pkgname}-rapidjson::git+https://github.com/Tencent/rapidjson.git"
  "${pkgname}-pybind11::git+https://github.com/pybind/pybind11.git"
)

sha512sums=('64b3e6e7295e1fcd11d096419d3dbdb2627b70f9b4d2fea0f2c38d9f5ab0a9de9f45c003a0835ddcaeaf2c3b6f08b88a3f84e882efc9052d32b48e76e419acc2'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $pkgbase
  git submodule init

  git config submodule."pybind11".url "${srcdir}/${pkgname}"-pybind11
  git config submodule."rapidjson".url "${srcdir}/${pkgname}"-rapidjson
  git config submodule."dlpack".url "${srcdir}/${pkgname}"-dlpack

  git -c protocol.file.allow=always submodule update --init --recursive

  sed '/cmake/d' -i pyproject.toml
}

build() {
  cd $pkgbase

  nox -s prepare
  python -m build --wheel --no-isolation

  cd awkward-cpp
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgbase
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer awkward-cpp/dist/*.whl
  cd tests
  ../test-env/bin/python -m pytest || echo 'some tests fail'
}

package_python-awkward() {
  optdepends+=("${pkgbase}-docs: documentation")

  cd $pkgbase
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd awkward-cpp
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-awkward-docs() {
  pkgdesc+=" - documentation"

  cd $pkgbase

  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D README.md "${pkgdir}/usr/share/${pkgbase}/README.md"

  python -m installer --destdir=tmp-install dist/*.whl
  python -m installer --destdir=tmp-install awkward-cpp/dist/*.whl
  install -d "${pkgdir}/usr/share/doc/${pkgbase}"
  PYTHONPATH="${PWD}"/tmp-install/`python -c 'import site; print(site.getsitepackages()[0])'` sphinx-build "${PWD}/docs" "${pkgdir}/usr/share/doc/${pkgbase}"
}
