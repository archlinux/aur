# Maintainer: Marco Nelles <marco.nelles@credativ.de>

pkgname=vault-cli
pkgver=3.1.0
pkgrel=2
pkgdesc='12-factor oriented command line tool for Hashicorp Vault'
arch=('any')
url="https://github.com/peopledoc/${pkgname}"
license=('APL2')
depends=('python>=3.6'
         'python-requests'
         'python-yaml>5.3.1'
         #'python-hvac<0.10.12'
         'python-click'
         'python-jinja')
optdepends=('vault')
conflicts=('python-hvac')
makedepends=('python-pip'
             'python-sphinx'
             'python-sphinx-autodoc-typehints'
             'python-sphinxcontrib-programoutput')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/peopledoc/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ec0b09aaeccf61ff2868db9584be8f2d1f291b8d4fe4eef272855144fec0aa7a9bb6174d2c30e837bdb73ff134294b405ce97d0dc6c57e6e3be3fae708847778')

build() {

  cd "${pkgname}-${pkgver}/docs"
  make man

}

package() {

  cd "${pkgname}-${pkgver}"

  # Workaround for https://github.com/peopledoc/vault-cli/issues/191
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps hvac==0.10.11

  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "docs/_build/man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

}
