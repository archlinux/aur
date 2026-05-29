# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nbsphinx-link
pkgname=python-${_base}
pkgdesc="A sphinx extension for including notebook files from outside sphinx source root"
pkgver=1.4.0
pkgrel=1
arch=(any)
url="https://github.com/vidartf/${_base}"
license=(BSD-3-Clause)
depends=(python-nbsphinx)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz
  docutils.patch::${url}/pull/26.patch)
sha512sums=('a9bf37fffd99de45991c9f385a548686cd5cc1494c122c277bbb72b815ea9192ca3a92d5ed2f00ca6b238021a013875d258ee2ef79b5f046493bafc85de3cdab'
            '3c8009fa41b552a16acf1dde6fe27585c17c25dd7e67fa8ab9c8898895e490214925e5c199994d88399ad1a94daee37dabaf7c7ec1279a457be9c7ed3708315b')

prepare() {
  cd ${_base}-${pkgver}
  patch -p1 -i ../docutils.patch
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
