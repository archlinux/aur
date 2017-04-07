# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot
pkgver=0.13.0
pkgrel=2
pkgdesc="A tool to automatically receive and install X.509 certificates to enable TLS on servers. The client will interoperate with the Let’s Encrypt CA which will be issuing browser-trusted certificates for free."
arch=('any')
license=('Apache')
url="https://letsencrypt.org/"
depends=('ca-certificates' "python2-acme=$pkgver" 'python2-configargparse' 'python2-configobj'
         'python2-cryptography' 'python2-pyopenssl' 'python2-mock' 'python2-parsedatetime'
         'python2-psutil' 'python2-pyrfc3339' 'python2-pytz' 'python2-requests' 'python2-setuptools'
         'python2-six' 'python2-zope-component' 'python2-zope-interface')
optdepends=("certbot-apache: Apache plugin for Let’s Encrypt client"
            "certbot-nginx: Nginx plugin for Let’s Encrypt client")
checkdepends=('python2-nose')
replaces=("letsencrypt")
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
validpgpkeys=('148C30F6F7E429337A72D992B00B9CC82D7ADF2C'
              '1B41B758F9A78C7F444C20FA3E5B4152E3ADB1FD'
              'A2CFB51FA275A7286234E7B24D17C995CD9775F2')
sha512sums=('0d0e36ee19482bf69f3dacd07fe6741ae7b639faae006c0411f1f8a3ac1d69036e6e5408eef4305b5bad5fcddf3a00dfe537684e25fd0960b43da6917e8734d3'
            'SKIP')

prepare() {
  sed -i "/'argparse',/d" $pkgname-$pkgver/setup.py
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py build
}

check() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py test
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"

  mkdir -p "$pkgdir"/{etc,var/lib,var/log}/letsencrypt
  chmod 700 "$pkgdir"/var/log/letsencrypt
}
