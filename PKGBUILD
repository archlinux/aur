# Maintainer: wuxxin <wuxxin@gmail.com>
# Based on solo-python; original contributors:
# Contributor: mutantmonkey <aur@mutantmonkey.mx>

pkgname=solo1
_pkgname=solo1-cli
pkgver=0.1.1
pkgrel=5
pkgdesc="Python tool and library for SoloKeys Solo 1"
arch=('any')
url="https://github.com/solokeys/${_pkgname}"
license=('Apache' 'MIT')
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
  'python-pip'
  'python-flit'
)
replaces=('solo-python')
conflicts=('solo-python')
provides=('solo-python')
source=(
  "${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  '169.patch'
)
sha256sums=(
  '377f0c244ee0efc741f18b3370cc0e5dcaff852db90102eeb258201128643c84'
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # patch api change in python-fido2 > 0.9
  # https://github.com/solokeys/solo1-cli/pull/169
  patch -Np1 -i "${srcdir}/169.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m flit build --format wheel
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm 644 LICENSE-MIT \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  pip install -I --no-warn-script-location --isolated --no-deps --compile \
    --root="${pkgdir}" dist/${pkgname/-/_}-${pkgver}-py3-none-any.whl
}
