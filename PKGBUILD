# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

_pkgname=certbot
pkgname=${_pkgname}-user
pkgver=0.9.3
pkgrel=2
pkgdesc="Let’s Encrypt certbot running as certbot user rather than root, with either standalone or webroot mode."
arch=('any')
license=('Apache')
url="https://${_pkgname}.eff.org"
depends=('ca-certificates' "python2-acme=${pkgver}" 'python2-configargparse' 'python2-configobj'
         'python2-cryptography' 'python2-pyopenssl' 'python2-mock' 'python2-parsedatetime'
         'python2-psutil' 'python2-pyrfc3339' 'python2-pythondialog' 'python2-pytz'
         'python2-requests' 'python2-setuptools' 'python2-six' 'python2-zope-component'
         'python2-zope-interface' 'systemd')
checkdepends=('python2-nose')
conflicts=('certbot')
provides=('certbot')
install="${_pkgname}.install"
source=("https://pypi.io/packages/source/c/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"{,.asc}
        "${_pkgname}.tmpfiles"
        "${_pkgname}.sysusers")
validpgpkeys=('A2CFB51FA275A7286234E7B24D17C995CD9775F2') # Let's Encrypt Client Team <letsencrypt-client@eff.org>
md5sums=('df58b67f37d3c4ef5126de4ed45c1cea' 'SKIP' '3d2a709a3ef1a2183d3b1fb159631eec' 'bcdf4204508da91cde42ae6f5550f0e5')
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
    python2 setup.py install --root="${pkgdir}" --skip-build --optimize=1

    install -Dm644 "${srcdir}"/${_pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf
    install -Dm644 "${srcdir}"/${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf
}
