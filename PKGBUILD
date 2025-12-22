# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
_base=streamz
pkgname=python-${_base}
pkgver=0.6.5
pkgrel=1
pkgdesc="Real-time stream processing for python"
arch=(any)
url="https://github.com/${pkgname}/${_base}"
license=(BSD-3-Clause)
depends=(python-tornado python-toolz python-zict python-six python-setuptools lzo snappy)
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest python-pandas python-distributed
  python-flaky python-networkx python-graphviz) # python-dask-expr
optdepends=('python-pandas: for supports streams of Pandas dataframes or Pandas series'
  'python-graphviz: for visualize the stream graph'
  'python-networkx: for visualize the stream graph') # 'python-cudf: for for supports streams of cudf dataframes or cudf series'
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('45d342aef2d98d862cb2ea063461bac95af5b4480b8cad2db2509ec9adaa65eda5868a4ebdde3d8e22c2d283c72aa9ad37afcccf6fc38cc3eb15ad9c3ac49031')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest -k 'not dask and not separate_thread_without_time and not await_syntax'
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
