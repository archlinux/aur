# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot
pkgver=1.16.0
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
sha512sums=('bfcca4115912e54ab072da6e2d5fd22a5d73c7eb6e68ccde3c5a9aeb3035c8f8691a218bb1b2e8e969850337e48578f4939b7be9d9f0e36b3a9af61f77142ccb'
            'SKIP')

build() {
  cd $pkgname-$pkgver
  export PYTHONHASHSEED=0
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  python -m pytest
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir"

  mkdir -p "$pkgdir"/{etc,var/lib,var/log}/letsencrypt
  chmod 700 "$pkgdir"/var/log/letsencrypt
}
