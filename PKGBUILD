# Maintainer: TheLugal <thelugal@gmail.com>

pkgname=pybitmessage
_realname=PyBitmessage
pkgver=0.6.3.2
pkgrel=2
pkgdesc="Decentralized and trustless P2P communications protocol for sending encrypted messages to another person or to many subscribers"
arch=('any')
depends=('openssl' 'python2' 'python2-pyqt4' 'python2-sip-pyqt4' 'python2-msgpack' 'qt4' 'sqlite')
optdepends=('mpg123: MP3 sounds support'
            'alsa-utils: WAV sounds support')
url="https://github.com/Bitmessage/PyBitmessage"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://github.com/Bitmessage/$_realname/archive/$pkgver.tar.gz
        pybitmessage.sh)
sha256sums=('1008d9b34070774267df005389d7e478b42131f79b63c40b1eb8212e67067ac3'
            'dad3783438c7328468eb0117da04b26c4f6d5f897ed3b44a333b22355c938a4b')
sha512sums=('57bdbf10417973b4414f1a184b375a2dd6db1a07a6bc5596b5d256589eeae3c7343692be0f0aa681244c550d2b2d91773d9383d97c56eb48562d8099908c0261'
            'ddeac31b20f2a253df02e66d7f2981c9e672dfe422bd179c345f33362a7e0d089785b0c8f7e78353093ab57ef9b1a1f7baf8aa8fbbffb7d7198799f52a74d50c')
provides=('pybitmessage')
conflicts=('pybitmessage-git')

prepare() {
  cd "$srcdir/$_realname-$pkgver"

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/$_realname-$pkgver/src/bitmsghash"
  make
}

package() {
  cd "$srcdir/$_realname-$pkgver"

  msg 'Installing shared files...'
  mkdir -p "$pkgdir"/usr/share/$pkgname
  cp -R src/* "$pkgdir"/usr/share/$pkgname

  msg 'Installing desktop icons...'
  install -D -m644 desktop/pybitmessage.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m644 src/images/can-icon-24px.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/$pkgname.png"
  install -D -m644 desktop/can-icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -D -m644 desktop/can-icon.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"

  msg 'Installing executable...'
  install -D -m755 $srcdir/pybitmessage.sh "$pkgdir/usr/bin/$pkgname"

  msg 'Installing man page...'
  mkdir -p "$pkgdir/usr/share/man/man1"
  install -m644 man/pybitmessage.1.gz "$pkgdir/usr/share/man/man1"
}

