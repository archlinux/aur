# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: synapse84 <synapse84 at gmail dot com>

pkgname=mumble-snapshot
pkgver=1.3.0_rc2
_dirname=1.3.0
pkgrel=1
# use epoch since rc naming scheme won't be recogniced as new version
epoch=1
pkgdesc="A high quality voice chat program."
arch=('i686' 'x86_64')
url="https://www.mumble.info/"
license=('BSD')
depends=('qt5-svg' 'opus' 'speex' 'protobuf' 'hicolor-icon-theme' 'libspeechd' 'libpulse')
makedepends=('boost' 'qt5-tools' 'python' 'libsndfile' 'speech-dispatcher')
optdepends=('espeak: speech synthesizer')
provides=('mumble')
conflicts=('mumble')
#source=("https://dl.mumble.info/mumble-${pkgver//_/\~}~snapshot.tar.gz"{,.sig} # git snapshots
source=("https://dl.mumble.info/mumble-${pkgver//_/-}.tar.gz"{,.sig}) # release canidate
validpgpkeys=('56D0B23AE00B1EE9A8BAAC0F5B8CF87BB893449B')
sha256sums=('258643a73997dc192ec9cc1175a55082e432ae21e4283bef27ffa331e85a0380'
            'SKIP')

build() {
    cd $srcdir/mumble-${_dirname}

    qmake-qt5 main.pro \
      CONFIG+="bundled-celt no-bundled-opus no-bundled-speex no-g15 no-server no-embed-qt-translations no-update no-jackaudio" \
      DEFINES+="PLUGIN_PATH=/usr/lib/mumble"

    make release
}

package() {
    cd $srcdir/mumble-${_dirname}

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
    install -m755 -D ./release/plugins/*.so $pkgdir/usr/lib/mumble/

    # other
    install -m755 -d $pkgdir/usr/share/man/man1
    install -m644 -D ./man/mumble* $pkgdir/usr/share/man/man1/
    install -m644 -D ./scripts/mumble.desktop $pkgdir/usr/share/applications/mumble.desktop
    install -m644 -D ./icons/mumble.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/mumble.svg
    install -m644 -D ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
