# Maintainer: synapse84 <synapse84 at gmail dot com>

pkgname=mumble-snapshot-tts
pkgver=1.3.0_690_ge614a7b
pkgrel=1
pkgdesc="A high quality voice chat program. (snapshot build + text to speech)"
arch=('i686' 'x86_64')
url="http://mumble.info/"
license=('BSD')
depends=('qt4' 'opus' 'speex' 'avahi' 'protobuf' 'speech-dispatcher')
makedepends=('boost')
optdepends=('espeak: speech synthesizer'
            'festival: speech synthesizer')
provides=('mumble')
conflicts=('mumble')
install=mumble.install
source=("http://mumble.info/snapshot/mumble-${pkgver//_/\~}~snapshot.tar.gz")
sha256sums=('c833ed48c00c44a34363876705c5e33b25e146510af158f01fd44866499b6151')

build() {
    cd $srcdir/mumble-${pkgver//_/\~}~snapshot

    qmake-qt4 main.pro \
      CONFIG+="bundled-celt no-bundled-opus no-bundled-speex no-g15 no-xevie no-server no-embed-qt-translations no-update qt4-legacy-compat" \
      DEFINES+="PLUGIN_PATH=/usr/lib/mumble"

    make release
}

package() {
    cd $srcdir/mumble-${pkgver//_/\~}~snapshot

    # binaries
    install -m755 -D ./release/mumble $pkgdir/usr/bin/mumble
    install -m755 -D ./scripts/mumble-overlay $pkgdir/usr/bin/mumble-overlay

    # libraries
    # mumble
    install -m755 -D ./release/libmumble.so.1.3.0 $pkgdir/usr/lib/mumble/libmumble.so.1.3.0
    ln -s libmumble.so.1.3.0 $pkgdir/usr/lib/mumble/libmumble.so
    ln -s libmumble.so.1.3.0 $pkgdir/usr/lib/mumble/libmumble.so.1
    ln -s libmumble.so.1.3.0 $pkgdir/usr/lib/mumble/libmumble.so.1.3
    # celt 11
    install -m755 -D ./release/libcelt0.so.0.11.0 $pkgdir/usr/lib/mumble/libcelt0.so.0.11.0
    ln -s libcelt0.so.0.11.0 $pkgdir/usr/lib/mumble/libcelt0.so
    ln -s libcelt0.so.0.11.0 $pkgdir/usr/lib/mumble/libcelt0.so.0
    ln -s libcelt0.so.0.11.0 $pkgdir/usr/lib/mumble/libcelt0.so.0.11
    # celt 7
    install -m755 -D ./release/libcelt0.so.0.7.0 $pkgdir/usr/lib/mumble/libcelt0.so.0.7.0
    ln -s libcelt0.so.0.7.0 $pkgdir/usr/lib/mumble/libcelt0.so.0.7
    
    # plugins
    install -m755 -D ./release/plugins/liblink.so $pkgdir/usr/lib/mumble/plugins/liblink.so
    install -m755 -D ./release/plugins/libmanual.so $pkgdir/usr/lib/mumble/plugins/libmanual.so

    # other
    install -m755 -d $pkgdir/usr/share/man/man1
    install -m644 -D ./man/mumble* $pkgdir/usr/share/man/man1/
    install -m644 -D ./scripts/mumble.desktop $pkgdir/usr/share/applications/mumble.desktop
    install -m644 -D ./icons/mumble.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/mumble.svg
    install -m644 -D ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

