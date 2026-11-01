# Maintainer: David McInnis <dave@dave3.xyz>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyamg
pkgname=python-${_base}
pkgdesc="Algebraic Multigrid Solvers in Python"
pkgver=5.4.1
pkgrel=1
arch=(x86_64)
url="https://github.com/${_base}/${_base}"
license=(MIT)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel pybind11)
# checkdepends=(python-pytest) # python-matplotlib
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  pyproject.patch::https://github.com/pyamg/pyamg/pull/453.patch)
sha512sums=('ecf3654f04e8c73b1be1aa5dbffd861fcda7185e882ef24aff605affde74658bb4f18baf75acaaddb3d74c329d68bce5b7d11b82ba8e008c3cf4325894670bff'
            '44ac147dc8fb22729a103fdd6ee73aff58db54576d2e84323a2d81892895b1a6144e36d2824a196f43fbc9269fc58b8c0eefe52e7553aa484cab40542981b433')

prepare() {
  cd ${_base}-${pkgver}
  # https://github.com/pyamg/pyamg/issues/294
  patch -p1 -i ../pyproject.patch
}

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -c "import pyamg; pyamg.test()"
#   test-env/bin/python -m pytest
#   local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}{sys.version_info.minor}')")
#   PYTHONPATH="${srcdir}/${_base}-${pkgver}/build/lib.linux-${CARCH}-cpython-${_pyversion}:${PYTHONPATH}"
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
