pkgbase=dyndnsc
pkgname=('dyndnsc' 'dyndnsc-py2')
pkgver=0.4.2
pkgrel=2
pkgdesc="Dynamic dns (dyndns) update client with support for multiple protocols"
arch=('any')
url="https://github.com/infothrill/python-dyndnsc"
license=('MIT')
makedepends=('python-argparse' 'python-ipy' 'python-ndg-httpsclient' 'python-requests' 'python-setuptools'
             'python2-argparse' 'python2-ipy' 'python2-ndg-httpsclient' 'python2-requests' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/d/dyndnsc/dyndnsc-$pkgver.tar.gz"
        'dyndnsc.service')
md5sums=('1a0c9aa48deb0e65f01e81d95e76f60c'
         '4b2cd825c387494ba77ad78106dd42eb')
sha512sums=('4b3a8fead2483c6f75a8bf1d6fc1c5ad17210ebf874973a8e5844ea1cec4be1a2ee54d8a00276cc3b128da56b4444c105a4396aed3ff980c2245e0cc3fe43bac'
            '29a66551ca796366ca0ed33e858bbfe22f63e04eca7d17530e41be58e557739f9aad983d312f1d79002157ad0e9187e00a70aa9d6481fd761678ec5036b33dcb')

prepare() {
    cp -a "dyndnsc-$pkgver"{,-py2}
}

build() {
    cd "$srcdir/dyndnsc-$pkgver"
    python setup.py build

    cd "$srcdir/dyndnsc-$pkgver-py2"
    python2 setup.py build
}

package_dyndnsc() {
    depends=('python-argparse' 'python-ipy' 'python-ndg-httpsclient' 'python-requests' 'python-setuptools')
    conflicts=('dyndnsc-py2')

    cd "dyndnsc-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1

    # install systemd service file
    install -Dm644 "$srcdir/dyndnsc.service" "$pkgdir/usr/lib/systemd/system/dyndnsc.service"

    # install license file
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_dyndnsc-py2() {
    pkgdesc="$pkgdesc (Python 2)"
    depends=('python2-argparse' 'python2-ipy' 'python2-ndg-httpsclient' 'python2-requests' 'python2-setuptools')
    provides=("dyndnsc=$pkgver")
    conflicts=('dyndnsc')

    cd "dyndnsc-$pkgver"-py2
    python2 setup.py install --root="$pkgdir" --optimize=1

    # install systemd service file
    install -Dm644 "$srcdir/dyndnsc.service" "$pkgdir/usr/lib/systemd/system/dyndnsc.service"

    # install license file
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
