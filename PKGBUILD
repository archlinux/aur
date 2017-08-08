# Maintainer: Laurent Soest <laurent.soest(at)gmail.com>

pkgname=('python-tempora' 'python2-tempora')
pkgver=1.8
pkgrel=2
pkgdesc="Objects and routines pertaining to date and time (tempora)."
arch=('any')
url="https://github.com/jaraco/tempora"
license=('MIT')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools' 'python-setuptools-scm' 'python2-setuptools-scm')
checkdepends=('python-tox' 'python2-tox' 'python2-backports.unittest_mock')
source=("https://github.com/jaraco/tempora/archive/$pkgver.tar.gz")
md5sums=('b1bc1e3d2374b229d5fae1938d54364c')

build() {
    cp -r "${srcdir}/tempora-${pkgver}" "${srcdir}/tempora-${pkgver}-py2"

    # setuptools wont find version from git tag
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    cd "$srcdir/tempora-$pkgver"
    python ./setup.py build
    # setuptools wont find version from git tag

    cd "${srcdir}/tempora-${pkgver}-py2"
    python2 ./setup.py build
}

package_python-tempora() {
    depends=('python' 'python-six' 'python-pytz')
    cd "$srcdir/tempora-$pkgver"
    python ./setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-tempora() {
    depends=('python2' 'python2-six' 'python2-pytz')
    cd "$srcdir/tempora-$pkgver-py2"
    python2 ./setup.py install --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/calc-prorate" "${pkgdir}/usr/bin/calc-prorate2"
}

check() {
    cd "$srcdir/tempora-$pkgver"
    tox

    cd "$srcdir/tempora-$pkgver-py2"
    tox2
}
