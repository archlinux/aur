# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_base=ripser
pkgname=python-${_base}
pkgver=0.6.10
pkgrel=1
pkgdesc="A Lean Persistent Homology Library for Python"
arch=(x86_64)
url="https://github.com/scikit-tda/${_base}.py"
license=(MIT)
depends=(python-persim)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
checkdepends=(python-pytest)
changelog=CHANGELOG.md
source=(${_base}.py-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('03f69adb25781ed1ce1f3127d754bf6a8851ca9524f59b712b508c3c3450161d770c994a4b687d1fd0d48131ff2bce386018c2f02e588bb68a32e83427dd631b')

build() {
  cd ${_base}.py-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}.py-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}.py-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
