# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: synapse84 <synapse84 at gmail dot com>

pkgname=mumble-snapshot
pkgver=1.3.0_2942_g755c290
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
source=("https://dl.mumble.info/mumble-${pkgver//_/\~}~snapshot.tar.gz"
        "https://github.com/mumble-voip/mumble/commit/ce0ecff200dd6e57a13c67b189406318595b52fb.patch")
# Disable signature verification for now, since public key is not available
#validpgpkeys=('F3F5324A14AD0B32568F7839F0413B5CB858BD0E')
sha256sums=('209cc0680fcf90adc8d374a0f73a932c3a3dfa71611d2a78a3036121e67f78a2'
            'af078c71af9a2892254c7104b1f6a73d98b2df03927b74c08f64f6f6d6826cc3')

prepare() {
    cd $srcdir/mumble-${pkgver//_/\~}~snapshot
    patch --forward --strip=1 --input="${srcdir}/ce0ecff200dd6e57a13c67b189406318595b52fb.patch"
}

build() {
    cd $srcdir/mumble-${pkgver//_/\~}~snapshot

    qmake-qt5 main.pro \
      CONFIG+="bundled-celt no-bundled-opus no-bundled-speex no-g15 no-xevie no-server no-embed-qt-translations no-update" \
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
    install -m755 -D ./release/plugins/*.so $pkgdir/usr/lib/mumble/

    # other
    install -m755 -d $pkgdir/usr/share/man/man1
    install -m644 -D ./man/mumble* $pkgdir/usr/share/man/man1/
    install -m644 -D ./scripts/mumble.desktop $pkgdir/usr/share/applications/mumble.desktop
    install -m644 -D ./icons/mumble.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/mumble.svg
    install -m644 -D ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
