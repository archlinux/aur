# Maintainer:   Maximilian Weiss         <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Jeremy Rand
# Contributor:  The Namecoin Developers
# Contributor:  The Electrum-DOGE Developers
# Contributor:  The Electrum Developers
# Contributor:  Thomas Voegtlin
# Contributor:  The Bitcoin Developers

pkgname=electrum-nmc
pkgver=4.0.1
pkgrel=1
pkgdesc='Namecoin port of Electrum client with name support'

arch=('any')
url='https://github.com/namecoin/electrum-nmc'
license=('Custom: multiple open source')

depends=('libsecp256k1'
         'python-setuptools'
         'python-pyaes'
         'python-ecdsa'
         'python-aiorpcx'
         'python-aiohttp'
         'python-qrcode'
         'python-aiohttp-socks'
         'python-protobuf'
         'python-pyqt5'
         'python-dnspython'
         'python-jsonrpclib-pelix'
         'python-pysocks'
         'python-pycryptodomex'
         'python-websocket-client'
         'python-hidapi'
         'python-qdarkstyle'
         'python-multidict'
         'python-chardet'
         'python-idna'
         'qt5-multimedia'
         'python-yarl'
         'python-async-timeout'
         'zbar'
         'python-certifi'
         'python-bitstring'
         'python-attrs')

optdepends=('cython: Compilation support for all hardware wallet dependencies'
            'python-btchip: Ledger, Trezor, and KeepKey hardware wallet support dependency'
            'python-trezor: Trezor hardware support dependency'
            'python-keepkey: KeepKey hardware wallet support dependency'
            'python-ckcc-protocol: Coldcard wallet support')

provides=('electrum-nmc')
conflicts=('electrum-nmc')

source=("https://github.com/namecoin/electrum-nmc/archive/refs/tags/nc${pkgver}.tar.gz")

sha256sums=('b5cf0bcd0cccc7748af3447289b4bdd9e1f3265a6c0d66940a8e0084a786ea7d')

prepare() {
    cd "$srcdir/electrum-nmc-nc${pkgver}/"
    for i in dnsdialog dnssubdomaindialog; do
        pyuic5 electrum_nmc/electrum/gui/qt/forms/$i.ui --execute --output=electrum_nmc/electrum/gui/qt/forms/$i.py
        sed -i s/qvalidatedlineedit/.qvalidatedlineedit/ electrum_nmc/electrum/gui/qt/forms/$i.py
    done
}

build() {
    cd "$srcdir/electrum-nmc-nc${pkgver}/"
    python setup.py build
}

package() {
    cd "$srcdir/electrum-nmc-nc${pkgver}/"
    python setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
    mkdir -p "$pkgdir/usr/share/doc/$pkgname/"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    cp AUTHORS README.rst RELEASE-NOTES "$pkgdir/usr/share/doc/$pkgname/"
    cp LICENCE "$pkgdir/usr/share/licenses/$pkgname/"
}

