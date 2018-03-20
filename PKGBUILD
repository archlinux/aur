# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot
pkgver=0.22.2
pkgrel=1
pkgdesc="A tool to automatically receive and install X.509 certificates to enable TLS on servers. The client will interoperate with the Let’s Encrypt CA which will be issuing browser-trusted certificates for free."
arch=('any')
license=('Apache')
url="https://certbot.eff.org"
depends=('ca-certificates' "python-acme=$pkgver" 'python-configargparse' 'python-configobj'
         'python-cryptography' 'python-mock' 'python-parsedatetime' 'python-pyrfc3339'
         'python-pytz' 'python-setuptools' 'python-zope-component' 'python-zope-interface')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
optdepends=("certbot-apache: Apache plugin for Let’s Encrypt client"
            "certbot-nginx: Nginx plugin for Let’s Encrypt client")
replaces=("letsencrypt")
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
validpgpkeys=('148C30F6F7E429337A72D992B00B9CC82D7ADF2C'
              '1B41B758F9A78C7F444C20FA3E5B4152E3ADB1FD'
              'A2CFB51FA275A7286234E7B24D17C995CD9775F2')
sha512sums=('dc04054917448f542e725e3f3e196020f1847773cb26cbf3ceade47f66561a95364ba8b28b8f278a3906a71113cd7f3b20d879882c2bb1a1aae5007585a6f865'
            'SKIP')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py pytest
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir"

  mkdir -p "$pkgdir"/{etc,var/lib,var/log}/letsencrypt
  chmod 700 "$pkgdir"/var/log/letsencrypt
}
