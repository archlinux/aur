# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Christian Rebischke <chris dot rebischke[at]archlinux[dot]org>
_base=PyPDNS
pkgname=python-${_base,,}
pkgver=2.2.2
pkgrel=1
pkgdesc="Python API for PDNS"
arch=(any)
url="https://github.com/CIRCL/${_base}"
license=(GPL3)
depends=(python-requests-cache python-dnspython)
makedepends=(python-build python-installer python-poetry-core)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d2bf43a030c3daea4a1f7a8d3f86d5853737c80a29b8fb02500ab805a4f218feac740a2867e9311b272fa4857d208487dd38573d4c2c630683a5a691f18322fa')
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
