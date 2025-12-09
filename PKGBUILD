# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Christian Rebischke <chris dot rebischke[at]archlinux[dot]org>
_base=PyPDNS
pkgname=python-${_base,,}
pkgver=2.3.0
pkgrel=1
pkgdesc="Python API for PDNS"
arch=(any)
url="https://github.com/CIRCL/${_base}"
license=(GPL-3.0-or-later)
depends=(python-requests-cache python-dnspython)
makedepends=(python-build python-installer python-poetry-core)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c50a5a74246e72e05f2d138f69f328b855d80beb0ab532e7a226e227e61bca0cc79ae1644e9425728a0f2bc4a99396b56822830ab8f84d30f8b8baa2c129eea6')
# validpgpkeys=('8647F5A7FFD350AE38B6E22F32E4E1C133B3792F') # Raphaël Vinot <raphael.vinot@circl.lu>

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
