# Maintainer: Oscar Morante <spacepluk@gmail.com>

# If you want support for your G15 Keyboard, please add 'g15daemon'
# to the depends and delete "no-g15" in the configure line below

pkgname=mumble-dev
_version=1.3.0
_snapshot='~1492~g2f88605~snapshot'
pkgver=${_version}${_snapshot}
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A voice chat application similar to TeamSpeak (Development Snapshots)"
license=('BSD')
depends=('qt5-svg' 'hicolor-icon-theme' 'speech-dispatcher' 'opus' 'protobuf' 'speex' 'avahi')
makedepends=('qt5-base' 'qt5-tools')
url="http://mumble.sourceforge.net/"
source=("http://mumble.info/snapshot/mumble-${pkgver}.tar.gz")
md5sums=('bc4ee8dc545e5d7d3f68b77ea9171ffe')
conflicts=('mumble')

build() {
  cd mumble-${pkgver}

  # Building mumble
  qmake main.pro \
    CONFIG+="bundled-celt \
             no-bundled-opus \
             no-bundled-speex \
             no-g15 \
             no-xevie \
             no-server \
             no-update packaged" \
    DEFINES+="PLUGIN_PATH=/usr/lib/mumble" \
    INCLUDEPATH+="/usr/include/speech-dispatcher"
  make release
}

package() {
  cd mumble-${pkgver}

  # bin stuff
  install -Dm755 ./release/mumble $pkgdir/usr/bin/mumble
  install -Dm755 ./scripts/mumble-overlay $pkgdir/usr/bin/mumble-overlay

  # lib st
  install -dm755 $pkgdir/usr/lib/mumble
  install -Dm755 ./release/lib*.so.* $pkgdir/usr/lib/mumble
  install -Dm755 -t $pkgdir/usr/lib/plugins ./release/plugins/*

  # other stuff
  install -Dm644 ./scripts/mumble.desktop $pkgdir/usr/share/applications/mumble.desktop
  install -dm755 $pkgdir/usr/share/man/man1
  install -Dm644 ./man/mum* $pkgdir/usr/share/man/man1/
  install -Dm644 ./icons/mumble.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/mumble.svg
  install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
# vim: sw=2:ts=2 et:
