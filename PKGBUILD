pkgbase=dyndnsc
pkgname=('dyndnsc' 'dyndnsc-py2')
pkgver=0.4.2
pkgrel=1
pkgdesc="Dynamic dns (dyndns) update client with support for multiple protocols"
arch=('any')
url="https://github.com/infothrill/python-dyndnsc"
license=('MIT')
makedepends=('python-argparse' 'python-ipy' 'python-ndg-httpsclient' 'python-requests' 'python-setuptools'
             'python2-argparse' 'python2-ipy' 'python2-ndg-httpsclient' 'python2-requests' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/d/dyndnsc/dyndnsc-$pkgver.tar.gz"
        'dyndnsc.service')
md5sums=('1a0c9aa48deb0e65f01e81d95e76f60c'
         'cff3eed55172eb584ac232a575dc8a98')
sha512sums=('4b3a8fead2483c6f75a8bf1d6fc1c5ad17210ebf874973a8e5844ea1cec4be1a2ee54d8a00276cc3b128da56b4444c105a4396aed3ff980c2245e0cc3fe43bac'
            'ae00f342eda9b4ff63b2b18e0825bccd3cc3f9e31fed49e9d8eed472c1c81778b683b2cd6d98b797af573f554ba1a1712bb54bbd7c71f17f04e123217276bce7')

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
