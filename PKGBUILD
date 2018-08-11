# Maintainer:   Maximilian Weiss         <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  James Lovejoy            <$(echo "amFtZXNsb3Zlam95MUBnbWFpbC5jb20=" | base64 -d)>
# Contributor:  The Vertcoin Developers  <$(echo "Y29udGFjdEB2ZXJ0Y29pbi5vcmcK" | base64 -d)>
# Contributor:  Thomas Voegtlin          <$(echo "dGhvbWFzdkBlbGVjdHJ1bS5vcmcK" | base64 -d)>
# Contributor:  Pooler                   <https://bitcointalk.org/index.php?action=profile;u=43931>

pkgname=electrum-vtc
pkgver=3.2.2
pkgrel=1
pkgdesc='A simple, powerful, and secure Vertcoin wallet which has no sync time or long waits for the blockchain to download.'

_pkgdl=electrum-VTC-3.2.2-rc2

arch=('any')
url='https://electrum.vertcoin.org/'
license=('MIT')

depends=('python-setuptools'
         'python-pyaes'
         'python-ecdsa'
         'python-pbkdf2'
         'python-requests'
         'python-qrcode'
         'python-vtc_scrypt'
         'python-lyra2re2_hash'
         'python-protobuf'
         'python-pyqt5'
         'python-dnspython'
         'python-jsonrpclib-pelix'
         'python-pysocks'
         'zbar')

optdepends=('cython: Compilation support for all hardware wallet dependencies'
            'python-btchip: Ledger hardware wallet support'
            'python-trezor: Trezor hardware support'
            'python-keepkey: KeepKey hardware wallet support')

provides=('electrum-vtc')
conflicts=('electrum-vtc')

source=("Electrum-VTC-$pkgver.tar.gz::https://github.com/vertcoin/$pkgname/releases/download/$pkgver-rc2/$_pkgdl.tar.gz"
        "Electrum-VTC-$pkgver.tar.gz.sig::https://github.com/vertcoin/$pkgname/releases/download/$pkgver-rc2/$_pkgdl.tar.gz.sig")

validpgpkeys=('E44EAD1F0BB016963229A6A304E9BCFB4E777CA3'
              '64D9042053AA1391D6C0B4A7425776E2F9E5BAB8')

sha256sums=('7a01beb0c193c4cf5790c1060440e04612e996e53c4adf85c7ca2d9165d58349'
            'SKIP')

prepare() {
    cd "$srcdir/Electrum-VTC-$pkgver/"
    for i in icons/{electrum_{dark,light}_icon,unpaid}.png
    do convert $i $i
    done
    pyrcc5 icons.qrc -o gui/qt/icons_rc.py
}

build() {
    cd "$srcdir/Electrum-VTC-$pkgver/"
    python setup.py build
}

package() {
    cd "$srcdir/Electrum-VTC-$pkgver/"
    python setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
    mkdir -p "$pkgdir/usr/share/doc/$pkgname/"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    cp AUTHORS README.rst RELEASE-NOTES "$pkgdir/usr/share/doc/$pkgname/"
    cp LICENCE "$pkgdir/usr/share/licenses/$pkgname/"
}

