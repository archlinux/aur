# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=python-sigmatools
_pkgname=sigma
pkgver=0.12.1
pkgrel=1
pkgdesc="Generic Signature Format for SIEM Systems"
arch=('any')
url="https://github.com/Neo23x0/sigma"
license=('LGPL3')
depends=('python' 'python-yaml' 'python-argparse' 'python-urllib3' 'python-pymisp')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
# Package "python-pymisp" is temporarily not in AUR, you can use BlackArch's PKGBUILD
# https://github.com/BlackArch/blackarch/blob/master/packages/python-pymisp/PKGBUILD
  "pymisp.patch")
noextract=()
sha256sums=('ebc46f1a017785c95662adcceb1bfca01208181be43616fae47f6da243ce4377'
            'f6489322336e0e72d967fd22be157365676626a27e1f7da19df88d9efeff2eb7')

prepare() {
  cd "${_pkgname}-${pkgver}"/tools
  patch -p1 <"${srcdir}/pymisp.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"/tools
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"/tools
  python setup.py install --root="${pkgdir}" --skip-build

  # Remove ${pkgdir}usr/etc
  cp -r "${pkgdir}/usr/etc/" "${pkgdir}"
  rm -rfv "${pkgdir}/usr/etc"

  # Update License
  install -Dm 644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE.LGPL.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
