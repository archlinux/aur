# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

_pkgname=certbot
pkgname=${_pkgname}-user
pkgver=0.9.3
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
install="${_pkgname}.install"
source=("https://pypi.io/packages/source/c/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"{,.asc}
        "${_pkgname}.tmpfiles"
        "${_pkgname}.sysusers")
validpgpkeys=('148C30F6F7E429337A72D992B00B9CC82D7ADF2C'
              '1B41B758F9A78C7F444C20FA3E5B4152E3ADB1FD'
              'A2CFB51FA275A7286234E7B24D17C995CD9775F2')
sha256sums=('68149cb8392b29f5d5246e7226d25f913f2b10482bf3bc7368e8c8821d25f3b0'
            'SKIP'
            'ca72fe5f7e6ccbbe8afc084d9255f93e3b81ce2793a77103a9382fa9eaff6c97'
            '151621a821f56178408851e016c7fda67dc4c726f210ad3279b29fd1f43282fa')

build() {
    cd ${_pkgname}-${pkgver}
    python2 setup.py build
}

check() {
    cd ${_pkgname}-${pkgver}
    python2 setup.py test
}

package() {
    cd ${_pkgname}-${pkgver}
    python2 setup.py install --root="${pkgdir}"

    install -Dm644 "${srcdir}"/${_pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf
    install -Dm644 "${srcdir}"/${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf
}
