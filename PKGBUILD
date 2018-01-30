# Maintainer:   Maximilian Weiss         <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  James Lovejoy            <$(echo "amFtZXNsb3Zlam95MUBnbWFpbC5jb20=" | base64 -d)>
# Contributor:  The Vertcoin Developers  <$(echo "Y29udGFjdEB2ZXJ0Y29pbi5vcmcK" | base64 -d)>
# Contributor:  Thomas Voegtlin          <$(echo "dGhvbWFzdkBlbGVjdHJ1bS5vcmcK" | base64 -d)>
# Contributor:  Pooler                   <https://bitcointalk.org/index.php?action=profile;u=43931>

pkgname=electrum-vtc
pkgver=2.9.3.6
pkgrel=1
pkgdesc='A simple, powerful, and secure Vertcoin wallet which has no sync time or long waits for the blockchain to download.'

arch=('any')
url='https://electrum.vertcoin.org/'
license=('MIT')

depends=('python2-setuptools'
         'python2-pyaes'
         'python2-ecdsa'
         'python2-pbkdf2'
         'python2-requests'
         'python2-qrcode'
         'python2-vtc_scrypt'
         'python2-lyra2re2_hash'
         'python2-protobuf'
         'python2-pyqt4'
         'python2-dnspython'
         'python2-jsonrpclib-pelix'
         'python2-pysocks'
         'zbar')

provides=('electrum-vtc')
conflicts=('electrum-vtc')

source=("Electrum-VTC-$pkgver.tar.gz::https://github.com/vertcoin/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "Electrum-VTC-$pkgver.tar.gz.sig::https://github.com/vertcoin/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.sig")

validpgpkeys=('E44EAD1F0BB016963229A6A304E9BCFB4E777CA3')

sha256sums=('8b07a684c076f40cf55355261213f50799a6513b80c163caa8667d39828ad09d'
            'SKIP')

prepare() {
    cd "$srcdir/Electrum-VTC-$pkgver/"
    find ./ -type f -exec sed -i '/#!/s/python$/&2/' {} +
    for i in icons/{electrum_{dark,light}_icon,unpaid}.png
    do convert $i $i
    done
    pyrcc4 icons.qrc >gui/qt/icons_rc.py
}

build() {
    cd "$srcdir/Electrum-VTC-$pkgver/"
    python2 setup.py build
}

package() {
    cd "$srcdir/Electrum-VTC-$pkgver/"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
    mkdir -p "$pkgdir/usr/share/doc/$pkgname/"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    cp AUTHORS README.rst RELEASE-NOTES electrum-vtc.conf.sample "$pkgdir/usr/share/doc/$pkgname/"
    cp LICENCE "$pkgdir/usr/share/licenses/$pkgname/"
}

