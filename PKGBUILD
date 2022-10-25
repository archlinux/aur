# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Christian Rebischke <chris dot rebischke[at]archlinux[dot]org>
_base=PyPDNS
pkgname=python-${_base,,}
pkgver=2.0.0
pkgrel=1
pkgdesc="Python API for PDNS"
arch=(any)
url="https://github.com/CIRCL/${_base}"
license=(GPL3)
depends=(python-requests-cache python-dnspython)
makedepends=(python-build python-installer python-poetry-core)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0e9f30a44cb4bd9bb20a3e8398b2aade61889d55990919a96cc5a3378b26f08e709c0dd14adde51a041ee8eaf5d77f57ba0b2ab04cbd9a5d184e5d6598bbb645')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}/tests
  PYTHONPATH="${srcdir}/${_base}-${pkgver}:${PYTHONPATH}" python test.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
