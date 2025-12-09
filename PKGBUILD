# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_base=ripser
pkgname=python-${_base}
pkgver=0.6.14
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
sha512sums=('6396b71be96c0e95344296c1bd398b618a279aa805843ade20866f67ae7b1b6b1a12276258a24d778ee2f7bb23a021d1c703b8a1967a6e364be9c770d13a5751')

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
