# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Laurent Soest <laurent.soest(at)gmail.com>

pkgname='python2-tempora'
_pkgbase="${pkgname//python2-/}"
pkgver=1.14.1
pkgrel=5
pkgdesc="Objects and routines pertaining to date and time (tempora)."
arch=('any')
url="https://github.com/jaraco/tempora"
license=('MIT')
depends=('python2' 'python2-six' 'python2-pytz' 'python2-jaraco')
makedepends=('python2-setuptools' 'python2-setuptools-scm' 'python2-six'
             'python2-pytz' 'python2-jaraco')
checkdepends=('python2-tox' 'python2-backports.unittest_mock')
source=("https://files.pythonhosted.org/packages/source/${_pkgbase:0:1}/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz"
        'LICENSE')
sha512sums=('4ecd5430d4d90959b0985908a1e4f239a56ce0026cd315ef6b8c204b645caccb135db76bb2ca9cb95bc65bdf337b61e7c31514eb9c85036771469b6a058edfbb'
            '1106afed483b7258e4ae89c5d9459c3834412b31aac90169725ed62d2ab44f61f6f79e894d4c9e4d8bd99e14530ab778df2187784f0b25eaab86d312fad68944')

build() {
    # setuptools wont find version from git tag

    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    python2 ./setup.py build
}

check() {
    # setuptools wont find version from git tag
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"

    cd "${srcdir}/${_pkgbase}-${pkgver}"
    tox2
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    python2 ./setup.py install --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/calc-prorate" "${pkgdir}/usr/bin/calc-prorate2"

    # the author has promised to include a LICENSE file in future releases:
    # https://github.com/jaraco/skeleton/issues/1
    # for now the LICENSE file has been taken from:
    # https://github.com/jaraco/skeleton/blob/skeleton/LICENSE
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
