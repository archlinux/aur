# Maintainer:   Maximilian Weiss         <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Thomas Voegtlin          <$(echo "dGhvbWFzdkBlbGVjdHJ1bS5vcmcK" | base64 -d)>
# Contributor:  Pooler                   <https://bitcointalk.org/index.php?action=profile;u=43931>
# Contributor:  The Vertcoin Developers  <$(echo "Y29udGFjdEB2ZXJ0Y29pbi5vcmcK" | base64 -d)>

pkgname=electrum-vtc
pkgver=2.9.3.3
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
         'python2-jsonrpclib'
         'python2-pysocks'
         'zbar')

provides=('electrum-vtc')
conflicts=('electrum-vtc')

source=('Electrum-VTC-2.9.3.3.tar.gz::https://github.com/vertcoin/electrum-vtc/releases/download/2.9.3.3/Electrum-VTC-2.9.3.3.tar.gz')

sha256sums=('b3a957f92f06b46c88bb3509cea53cbc2fa1bb49184d4cc259dc127f3b82edb4')

prepare() {
    cd "$srcdir/Electrum-VTC-2.9.3.3/"
    find ./ -type f -exec sed -i '/#!/s/python$/&2/' {} +
    for i in icons/{electrum_{dark,light}_icon,unpaid}.png
    do convert $i $i
    done
    pyrcc4 icons.qrc >gui/qt/icons_rc.py
}

build() {
    cd "$srcdir/Electrum-VTC-2.9.3.3/"
    python2 setup.py build
}

package() {
    cd "$srcdir/Electrum-VTC-2.9.3.3/"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
    mkdir -p "$pkgdir/usr/share/doc/electrum-vtc/"
    mkdir -p "$pkgdir/usr/share/licenses/electrum-vtc/"
    cp AUTHORS README.rst RELEASE-NOTES electrum-vtc.conf.sample "$pkgdir/usr/share/doc/electrum-vtc/"
    cp LICENCE "$pkgdir/usr/share/licenses/electrum-vtc/"
}
