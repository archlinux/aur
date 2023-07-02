# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Christian Rebischke <chris dot rebischke[at]archlinux[dot]org>
_base=PyPDNS
pkgname=python-${_base,,}
pkgver=2.1.0
pkgrel=1
pkgdesc="Python API for PDNS"
arch=(any)
url="https://github.com/CIRCL/${_base}"
license=(GPL3)
depends=(python-requests-cache python-dnspython)
makedepends=(python-build python-installer python-poetry-core)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d5b322ae0b8edbe10d0369a4539a76df864f5f9561bba39047d7b82b8139aed4e9eef73d5567ca8eaa5d28297d4fe580f64c4738c0bbb2ea5e7ec44bf25812af')
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
