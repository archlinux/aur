# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Laurent Soest <laurent.soest(at)gmail.com>

pkgname='python2-portend'
_pkgbase="${pkgname//python2-/}"
pkgver=2.6
pkgrel=2
pkgdesc="Use portend to monitor TCP ports for bound or unbound states."
arch=('any')
url="https://github.com/jaraco/portend"
license=('MIT')
depends=('python2' 'python2-tempora')
makedepends=('python2' 'python2-setuptools' 'python2-setuptools-scm'
             'python2-tox' 'python2-tempora')
source=("https://files.pythonhosted.org/packages/source/${_pkgbase:0:1}/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz"
        'LICENSE')
sha512sums=('9e53c668ba9d0ddb2e92d9b4c97d2b8a4d858a6fc44123414ee3c8ac433f51f50a4773ee08f85bb134e49aeace2a17baffd32962d36df0b19b505a2c6634bf7e'
            '1106afed483b7258e4ae89c5d9459c3834412b31aac90169725ed62d2ab44f61f6f79e894d4c9e4d8bd99e14530ab778df2187784f0b25eaab86d312fad68944')

build() {
    # setuptools wont find version from git tag
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    python2 ./setup.py build
}

check() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    tox2
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    python2 ./setup.py install --root="${pkgdir}" --optimize=1

    # the author has promised to include a LICENSE file in future releases:
    # https://github.com/jaraco/skeleton/issues/1
    # for now the LICENSE file has been taken from:
    # https://github.com/jaraco/skeleton/blob/skeleton/LICENSE
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
