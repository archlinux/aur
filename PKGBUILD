# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

_pkgname=certbot
pkgname=${_pkgname}-user
pkgver=0.14.0
pkgrel=1
pkgdesc="Let’s Encrypt certbot running as certbot user rather than root, with either standalone or webroot mode."
arch=('any')
license=('Apache')
url="https://${_pkgname}.eff.org"
depends=('ca-certificates' "python-acme=${pkgver}" 'python-configargparse' 'python-configobj'
         'python-cryptography' 'python-mock' 'python-parsedatetime' 'python-pyopenssl'
         'python-pyrfc3339' 'python-pytz' 'python-setuptools' 'python-six'
         'python-zope-component' 'python-zope-interface' 'systemd')
checkdepends=('python-nose')
conflicts=('certbot')
provides=('certbot')
source=("https://pypi.io/packages/source/c/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"{,.asc}
        "${_pkgname}.tmpfiles"
        "${_pkgname}.sysusers")
validpgpkeys=('A2CFB51FA275A7286234E7B24D17C995CD9775F2') # Let's Encrypt Client Team <letsencrypt-client@eff.org>
sha256sums=('98add3721e1edaedb404879a9d39bd49020e94fc8eedbc46032a00ada51d7741'
            'SKIP'
            'ca72fe5f7e6ccbbe8afc084d9255f93e3b81ce2793a77103a9382fa9eaff6c97'
            '151621a821f56178408851e016c7fda67dc4c726f210ad3279b29fd1f43282fa')

build() {
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

check() {
    cd ${_pkgname}-${pkgver}
    python setup.py test
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --skip-build --optimize=1

    install -Dm644 "${srcdir}"/${_pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf
    install -Dm644 "${srcdir}"/${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf
}
