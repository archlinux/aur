# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=m2r2
pkgname=python-${_base}
pkgver=0.3.4
pkgrel=1
pkgdesc="Markdown and reStructuredText in a single file"
arch=(any)
url="https://github.com/crossnox/${_base}"
license=(MIT)
depends=(python-mistune1 python-docutils)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-six python-sphinx)
changelog=CHANGES.md
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  setuptools_compatibility.patch::${url}/pull/22.patch)
sha512sums=('4a6fffab0f1d9d388c44e7e4879c818ddd437809238901c1f27b57fb3e3718db9ce5185528a209c74f3ef7aa084605248c2944dc7b596f8e0833d6eb35c09a34'
            '3686b8b8bf21f9e7c905e215766ded8aa66b14c7e20a4844ef21c926efabae0b56cc27e946ae626799c060c7d5323c9915198601a81d818a62ae57ce5be8cc95')

prepare() {
  cd ${_base}-${pkgver}
  # https://github.com/CrossNox/m2r2/issues/38
  patch -p1 -i ../setuptools_compatibility.patch
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  pytest -x --disable-warnings
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
