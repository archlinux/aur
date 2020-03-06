# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=sigma
pkgver=0.16.0
pkgrel=1
pkgdesc="Generic Signature Format for SIEM Systems"
arch=('any')
url="https://github.com/Neo23x0/sigma"
license=('LGPL3')
depends=('python-yaml' 'python-argparse' 'python-urllib3' 'python-pymisp')
makedepends=('python-setuptools')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
  "pymisp.patch"
)
sha256sums=('32325c7653096fd7b6e75ca950b9f4ea78c98f5e566ed7cbdd9dac11e18b0601'
            'f6489322336e0e72d967fd22be157365676626a27e1f7da19df88d9efeff2eb7')

prepare() {
  cd "${pkgname}-${pkgver}"/tools
  patch -p1 <"${srcdir}/pymisp.patch"
}

build() {
  cd "${pkgname}-${pkgver}"/tools
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"/tools
  python setup.py install --root="${pkgdir}" --skip-build
  mv "${pkgdir}/usr/etc/" "${pkgdir}"

  # Update License
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.LGPL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
