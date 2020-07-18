# Maintainer:   Maximilian Weiss         <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Jeremy Rand
# Contributor:  The Namecoin Developers
# Contributor:  The Electrum-DOGE Developers
# Contributor:  The Electrum Developers
# Contributor:  Thomas Voegtlin
# Contributor:  The Bitcoin Developers

pkgname=electrum-nmc
pkgver=3.3.10
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

source=("https://github.com/namecoin/electrum-nmc/archive/nc${pkgver}.tar.gz")

sha256sums=('7f7e9b728c2ee648006d96fa1320279b62f1705fd7859e3274a579991fc09066')

prepare() {
    cd "$srcdir/electrum-nmc-nc${pkgver}/"
    for i in dnsdialog dnssubdomaindialog; do
        pyuic5 electrum_nmc/electrum/gui/qt/forms/$i.ui --execute --output=electrum_nmc/electrum/gui/qt/forms/$i.py
        sed -i s/qvalidatedlineedit/.qvalidatedlineedit/ electrum_nmc/electrum/gui/qt/forms/$i.py
    done
    python contrib/pull_locale
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
    cp LICENCE LICENCE.DOGE "$pkgdir/usr/share/licenses/$pkgname/"
}

