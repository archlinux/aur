# Maintainer: wuxxin <wuxxin@gmail.com>
# Based on solo-python; original contributors:
# Contributor: mutantmonkey <aur@mutantmonkey.mx>

pkgname=solo1
_pkgname=solo1-cli
pkgver=0.1.1
pkgrel=6
pkgdesc="Python tool and library for SoloKeys Solo 1"
arch=('any')
url="https://github.com/solokeys/${_pkgname}"
license=('Apache-2.0' 'MIT')
depends=(
  'python'
  'python-click>=7.1'
  'python-cryptography'
  'python-ecdsa'
  'python-fido2'
  'python-intelhex'
  'python-pyserial'
  'python-pyusb'
  'python-requests'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-flit-core'
)
replaces=('solo-python')
conflicts=('solo-python')
provides=('solo-python')
source=(
  "${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}-169.patch"
  "pyproject-pep621.patch"
)
sha256sums=('377f0c244ee0efc741f18b3370cc0e5dcaff852db90102eeb258201128643c84'
            '06b4aed197f90604447f5f297f06c5784ede4fa33c90af851cd2ff3f62cf5abf'
            '0bdbc1d753ea073b4f6c77ec4b6f2719ffe19d762b407a38bdd04d35ab41a61c')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # patch api change in python-fido2 > 0.9
  # https://github.com/solokeys/solo1-cli/pull/169
  patch -Np1 -i "${srcdir}/${pkgname}-169.patch"
  # migrate to PEP 621 [project] metadata for flit_core
  patch -Np1 -i "${srcdir}/pyproject-pep621.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE-MIT \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm 644 LICENSE-APACHE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
