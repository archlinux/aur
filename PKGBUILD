# Maintainer Musikolo <musikolo {at} hotmail [dot] com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase=python-rsa3
pkgname=(python-rsa3 python2-rsa3)
# pkgname=(python-rsa3)
pkgver=3.4.2
pkgrel=1
_libname=rsa
pkgdesc="Pure-Python RSA 3.x implementation"
arch=(any)
url="https://stuvel.eu/rsa"
license=('BSD')
source=(https://files.pythonhosted.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)
makedepends=(python-setuptools python2-setuptools)
# makedepends=(python-setuptools)
sha256sums=('25df4e10c263fb88b5ace923dd84bf9aa7f5019687b5e55382ffcdb8bede9db5')

build() {
    cd "$srcdir/$_libname-$pkgver"

    rm -rf ../buildpy3; mkdir ../buildpy3
    python setup.py build -b ../buildpy3

    rm -rf ../buildpy2; mkdir ../buildpy2
    python2 setup.py build -b ../buildpy2
}

package_python-rsa3() {
    depends=(python-pyasn1)
    provides=('python-rsa')
    conflicts=('python-rsa')

    cd "$srcdir/$_libname-$pkgver"
    #cd "$srcdir/sybren-python-rsa-8f50f506b4a2"
    rm -rf build; ln -s ../buildpy3 build
    python setup.py install --skip-build -O1 --root="$pkgdir"
    install -m0644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-rsa3() {
    depends=(python2-pyasn1)

    cd "$srcdir/$_libname-$pkgver"
    #cd "$srcdir/sybren-python-rsa-8f50f506b4a2"
    rm -rf build; ln -s ../buildpy2 build
    python2 setup.py install --skip-build -O1 --root="$pkgdir"
    install -m0644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    find "$pkgdir/usr/bin" -type f | while read f; do mv "$f" "$f"2; done
}
