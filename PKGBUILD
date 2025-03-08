# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_base=ripser
pkgname=python-${_base}
pkgver=0.6.12
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
sha512sums=('6ffce9bdd11e9226ca8ccfe956fccdcb590c2d7ce8548afc33942b8c73e32ee1758cedaa9fbb34da7df1a2f2e7328d551b1471d9ff95476a1a4110205334a80e')

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
