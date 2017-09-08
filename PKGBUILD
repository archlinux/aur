# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot
pkgver=0.18.0
pkgrel=1
pkgdesc="A tool to automatically receive and install X.509 certificates to enable TLS on servers. The client will interoperate with the Let’s Encrypt CA which will be issuing browser-trusted certificates for free."
arch=('any')
license=('Apache')
url="https://certbot.eff.org"
depends=('ca-certificates' "python-acme=$pkgver" 'python-configargparse' 'python-configobj'
         'python-cryptography' 'python-pyopenssl' 'python-mock' 'python-parsedatetime'
         'python-pytz' 'python-setuptools' 'python-six' 'python-zope-component'
         'python-zope-interface')
optdepends=("certbot-apache: Apache plugin for Let’s Encrypt client"
            "certbot-nginx: Nginx plugin for Let’s Encrypt client")
replaces=("letsencrypt")
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
validpgpkeys=('148C30F6F7E429337A72D992B00B9CC82D7ADF2C'
              '1B41B758F9A78C7F444C20FA3E5B4152E3ADB1FD'
              'A2CFB51FA275A7286234E7B24D17C995CD9775F2')
sha512sums=('e2218feb8a3788de5d137ac0ce38a2a0a59f98075da9109471685786376906cec6c8adb1e8c16271dbe0c1ca18fc3a0521954ddb8685d0667272bbd318452523'
            'SKIP')

prepare() {
  sed -i "/'argparse',/d" $pkgname-$pkgver/setup.py
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py test
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir"

  mkdir -p "$pkgdir"/{etc,var/lib,var/log}/letsencrypt
  chmod 700 "$pkgdir"/var/log/letsencrypt
}
