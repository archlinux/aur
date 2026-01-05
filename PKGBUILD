# Maintainer: Jon Schlipf <jschlipf@gmx.com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
_base=PythonCall.jl
pkgname=python-juliacall
pkgver=0.9.31
pkgrel=1
pkgdesc="Julia and Python in seamless harmony"
arch=(x86_64)
url="https://github.com/JuliaPy/${_base}"
license=(MIT)
depends=(python-juliapkg)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('091d9cc2b60ae934938fe9ad1e5826d8ff6d51337c6c72a9e5c457b4efd82ee15f6cf52744943cb07d7694247bbaf303bac5de355674038a9d1317082288e348')

build() {
cd ${_base}-${pkgver}
python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
cd ${_base}-${pkgver}
python -m venv --system-site-packages test-env
test-env/bin/python -m installer dist/*.whl
test-env/bin/python -m pytest pytest
}

package() {
cd ${_base}-${pkgver}
PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m
installer --destdir="${pkgdir}" dist/*.whl
install -Dm 644 LICENSE -t
"${pkgdir}/usr/share/licenses/${pkgname}"
}
