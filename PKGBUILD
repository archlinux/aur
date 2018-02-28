# Maintainer: David Parrish <daveparrish@tutanota.com>
# Maintainer: David Parrish <BM-2cU1Bk3fXVo9VrGpo2YQFJ1it31gSuAy5j>

pkgname=pybitmessage-dev-git
pkgver=0.6.3.2.r16.g0da0c109
pkgrel=1
pkgdesc="Decentralized and trustless P2P communications protocol for sending encrypted messages to another person or to many subscribers"
arch=('i686' 'x86_64')
depends=('python2-pyqt4' 'qt4' 'python2-msgpack')
optdepends=('mpg123: MP3 sounds support'
            'alsa-utils: WAV sounds support')
url="https://github.com/Bitmessage/PyBitmessage"
license=('MIT')
source=("${pkgname}::git+https://github.com/Bitmessage/PyBitmessage.git#branch=v0.6"
            "pybitmessage.profile")
sha256sums=('SKIP'
            '4029157df5179a487107ffb63358fc15c77e1395a765bbd957e89468669b414d')
provides=('pybitmessage')

pkgver() {
  cd "$pkgname" || exit
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname" || exit
  python2 setup.py build
}

package() {
  cd "$pkgname" || exit
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg 'Installing desktop icons...'
  install -D -m644 src/images/can-icon-24px.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/pybitmessage.png"
  install -D -m644 desktop/can-icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/pybitmessage.svg"
  install -D -m644 desktop/can-icon.svg "$pkgdir/usr/share/pixmaps/pybitmessage.svg"

  msg 'Installing man page...'
  mkdir -p "$pkgdir/usr/share/man/man1"
  install -m644 man/pybitmessage.1.gz "$pkgdir/usr/share/man/man1"

  msg 'Installing Firejail profile...'
  mkdir -p "$pkgdir/etc/firejail"
  install -m644 "$srcdir/pybitmessage.profile" "$pkgdir/etc/firejail"

  msg 'Installing license...'
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
