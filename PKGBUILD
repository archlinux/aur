# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot
pkgver=0.17.0
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
sha512sums=('f4087cdb3c1fe29b38fb1b2459848f258cba6b91caa53ab68cb78906a6f2fd019ab837d8786cda4ae9ed47b70b05c526e9c38c31e05cb12a5fe9ad770200d243'
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
