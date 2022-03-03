# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=oci-cli
pkgver=3.5.3
pkgrel=1
pkgdesc='Command line interface for Oracle Cloud Infrastructure'
arch=('x86_64')
url="https://github.com/oracle/${pkgname}"
license=('Apache')
depends=('python' 'python-oci' 'python-arrow' 'python-certifi' 'python-click' 'python-dateutil' 'python-cryptography' 'python-pyopenssl' 'python-jmespath' 'python-terminaltables' 'python-idna' 'python-pytz' 'python-six' 'python-retrying' 'python-yaml')
makedepends=('python-setuptools')
optdepends=('python-cx_oracle: Used by the database service')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bdc27b562f587cd898e014bddb858f2db8463f8c79cadd1e832f095ae1969f3b')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i 's/profile == Sentinel(DEFAULT_PROFILE)/profile == str(Sentinel(DEFAULT_PROFILE))/' src/oci_cli/cli_root.py
  sed -i -r "s/(==|>|<).*'/'/g" setup.py
  sed -i '/configparser/d' setup.py
}

build() {
  cd "${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
