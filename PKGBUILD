# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: synapse84 <synapse84 at gmail dot com>

pkgname=mumble-snapshot
pkgver=1.3.0_2586_g894ade2
pkgrel=1
pkgdesc="A high quality voice chat program."
arch=('i686' 'x86_64')
url="https://www.mumble.info/"
license=('BSD')
depends=('qt5-svg' 'opus' 'speex' 'protobuf' 'hicolor-icon-theme' 'libspeechd' 'libpulse')
makedepends=('boost' 'qt5-tools' 'python' 'libsndfile' 'speech-dispatcher')
optdepends=('espeak: speech synthesizer')
provides=('mumble')
conflicts=('mumble')
source=("https://dl.mumble.info/mumble-${pkgver//_/\~}~snapshot.tar.gz"{,.sig}
	"float_overload.patch")
validpgpkeys=('C4666C6767A26017CE68406988048D0D625297A0')
sha256sums=('a0b8720e01495c399d14c2051bcf5e7356ceea8e0162a75cc4e10039a5324f7e'
            'SKIP'
            'c65cd76cdc4243ce29d7ce005a438e0a1bd7f99327e2623bea9436901fab98ec')


prepare() {
    cd $srcdir/mumble-${pkgver//_/\~}~snapshot
    patch -Np1 -i "${srcdir}/float_overload.patch"
}

build() {
    cd $srcdir/mumble-${pkgver//_/\~}~snapshot

    qmake-qt5 main.pro \
      CONFIG+="bundled-celt no-bundled-opus no-bundled-speex no-g15 no-xevie no-server no-embed-qt-translations no-update" \
      DEFINES+="PLUGIN_PATH=/usr/lib/mumble" \
      INCLUDEPATH+="/usr/include/openssl-1.0" \
      QMAKE_LFLAGS+="-L/usr/lib/openssl-1.0 -lssl -lcrypto"

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
    install -m755 -D ./release/plugins/*.so $pkgdir/usr/lib/mumble/

    # other
    install -m755 -d $pkgdir/usr/share/man/man1
    install -m644 -D ./man/mumble* $pkgdir/usr/share/man/man1/
    install -m644 -D ./scripts/mumble.desktop $pkgdir/usr/share/applications/mumble.desktop
    install -m644 -D ./icons/mumble.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/mumble.svg
    install -m644 -D ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
