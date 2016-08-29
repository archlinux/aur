# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgbase=certbot
pkgname=certbot-user
pkgver=0.8.1
pkgrel=1
pkgdesc="Let’s Encrypt certbot running as certbot user rather than root, with either standalone or webroot mode."
arch=('any')
license=('Apache')
url="https://letsencrypt.org/"
depends=('ca-certificates' "python2-acme=${pkgver}" 'python2-configargparse' 'python2-configobj'
         'python2-cryptography' 'python2-pyopenssl' 'python2-mock' 'python2-parsedatetime'
         'python2-psutil' 'python2-pyrfc3339' 'python2-pythondialog' 'python2-pytz'
         'python2-requests' 'python2-setuptools' 'python2-six' 'python2-zope-component'
         'python2-zope-interface')
checkdepends=('python2-nose')
conflicts=('certbot')
provides=('certbot')
install="${pkgbase}.install"
source=("https://pypi.io/packages/source/c/${pkgbase}/${pkgbase}-${pkgver}.tar.gz"{,.asc}
        "${pkgbase}.tmpfiles"
        "${pkgbase}.sysusers")
validpgpkeys=('148C30F6F7E429337A72D992B00B9CC82D7ADF2C'
              '1B41B758F9A78C7F444C20FA3E5B4152E3ADB1FD'
              'A2CFB51FA275A7286234E7B24D17C995CD9775F2')
md5sums=('df6d44d2144939810093283179baa899'
         'SKIP'
         '3d2a709a3ef1a2183d3b1fb159631eec'
         'bcdf4204508da91cde42ae6f5550f0e5')

build() {
  cd "${srcdir}"/${pkgbase}-${pkgver}
  python2 setup.py build
}

check() {
  cd "${srcdir}"/${pkgbase}-${pkgver}
  python2 setup.py test
}

package() {
  cd "${srcdir}"/${pkgbase}-${pkgver}
  python2 setup.py install --root="${pkgdir}"

  install -Dm644 "${srcdir}"/${pkgbase}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgbase}.conf
  install -Dm644 "${srcdir}"/${pkgbase}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgbase}.conf
}
