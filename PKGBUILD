# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot
pkgver=1.15.0
pkgrel=1
pkgdesc="A tool to automatically receive and install X.509 certificates to enable TLS on servers. The client will interoperate with the Let’s Encrypt CA which will be issuing browser-trusted certificates for free."
arch=('any')
license=('Apache')
url="https://certbot.eff.org"
depends=('ca-certificates' 'python-acme' 'python-configargparse' 'python-configobj'
         'python-cryptography' 'python-distro' 'python-parsedatetime'
         'python-pyrfc3339' 'python-pytz' 'python-setuptools' 'python-zope-component'
         'python-zope-interface')
checkdepends=('python-pytest')
optdepends=('certbot-apache: Apache plugin for Let’s Encrypt client'
            'certbot-nginx: Nginx plugin for Let’s Encrypt client')
replaces=("letsencrypt")
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
validpgpkeys=('148C30F6F7E429337A72D992B00B9CC82D7ADF2C'
              '1B41B758F9A78C7F444C20FA3E5B4152E3ADB1FD'
              'A2CFB51FA275A7286234E7B24D17C995CD9775F2')
sha512sums=('97307afdb795e1bb53c520b928081f3b7a3b4ec49c37a8306b015193e27c03c51771227bac0566a8bf5213675335b12132d8e1c23d49d86c4ff7c43216d6c15a'
            'SKIP')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  export PYTHONHASHSEED=0
  python setup.py build
}

check() {
  cd "$srcdir"/$pkgname-$pkgver
  python -m pytest
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir"

  mkdir -p "$pkgdir"/{etc,var/lib,var/log}/letsencrypt
  chmod 700 "$pkgdir"/var/log/letsencrypt
}
