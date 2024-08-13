# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
_base=streamz
pkgname=python-${_base}
pkgver=0.6.4
pkgrel=6
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
sha512sums=('830c9dfadccce485ab0ee4e669a0a183648f826922fe5c3a7f647b6beb1ca853858e50327a629bc2d8942904fbad6fd4357639edc8a4bca4f8af94ec20263060')

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
