# Maintainer: Jon Schlipf <jschlipf@gmx.com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
_base=juliapkg
pkgname=python-${_base}
pkgver=0.1.22
pkgrel=1
pkgdesc="Julia version manager and package manager"
arch=(x86_64)
url="https://github.com/JuliaPy/py${_base}"
license=(MIT)
depends=(python-semver python-filelock python-tomlkit python-tomli julia)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest python-pip python-setuptools)
optdepends=('python-click: cli support')
source=(py${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5741a6d32f05cc873fd8f3ca08971e4feeecce2102651a7c67b2ef5caf40d911a0fee5c60ecfd7daeb975f608f5c1012c1cb51c22d2dcae17786011568b24c1a')

build() {
    cd py${_base}-${pkgver}
    python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd py${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/pip install -e test/juliapkg_test_editable_setuptools
  test-env/bin/python -m pytest test
}

package() {
    cd py${_base}-${pkgver}
    PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
