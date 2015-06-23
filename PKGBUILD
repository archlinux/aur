# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Moritz Kiefer <moritz.kiefer@gmail.com>

pkgname=mumble-jack
pkgver=1.2.9
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Mumble with support for JACK"
license=('BSD')
depends=('qt4' 'speex' 'lsb-release' 'libxi' 'avahi' 'libsndfile' 'protobuf' 'libpulse' 'jack' 'opus')
makedepends=('boost' 'mesa' 'avahi')
provides=('mumble')
conflicts=('mumble')
install=mumble.install
url=http://mumble.info/
source=(http://downloads.sourceforge.net/mumble/mumble-$pkgver.tar.gz
        http://sourceforge.net/p/mumble/patches/_discuss/thread/1bfdbda2/a90e/attachment/mumble-jack-support.patch)
md5sums=('85decb9a1efb13e7558fab6265f81ad8'
         '03d89f5f4265de696505211984b969a0')


prepare() {
  cd $srcdir/mumble-$pkgver

  patch -Np1 < $srcdir/mumble-jack-support.patch
}

build() {
  cd $srcdir/mumble-$pkgver
  # Building mumble
  qmake-qt4 main.pro \
    CONFIG+="bundled-celt no-bundled-opus no-bundled-speex no-speechd no-g15 no-xevie no-server \
    no-embed-qt-translations no-update packaged" \
    DEFINES+="PLUGIN_PATH=/usr/lib/mumble"
  make release
}

package() {
  cd $srcdir/mumble-$pkgver

  # bin stuff
  install -m755 -D ./release/mumble $pkgdir/usr/bin/mumble
  install -m755 -D ./scripts/mumble-overlay $pkgdir/usr/bin/mumble-overlay

  # lib stuff
  install -m755 -D ./release/libmumble.so.$pkgver $pkgdir/usr/lib/mumble/libmumble.so.$pkgver
  ln -s libmumble.so.$pkgver $pkgdir/usr/lib/mumble/libmumble.so
  ln -s libmumble.so.$pkgver $pkgdir/usr/lib/mumble/libmumble.so.1
  ln -s libmumble.so.$pkgver $pkgdir/usr/lib/mumble/libmumble.so.1.2
  install -m755 -D ./release/plugins/liblink.so $pkgdir/usr/lib/mumble/liblink.so
  install -m755 -D ./release/plugins/libmanual.so $pkgdir/usr/lib/mumble/libmanual.so
  install -m755 -D ./release/libcelt* $pkgdir/usr/lib/mumble/

  # other stuff
  install -m644 -D ./scripts/mumble.desktop $pkgdir/usr/share/applications/mumble.desktop
  install -m755 -d $pkgdir/usr/share/man/man1
  install -m644 -D ./man/mum* $pkgdir/usr/share/man/man1/
  install -m644 -D ./icons/mumble.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/mumble.svg
  install -m644 -D ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

