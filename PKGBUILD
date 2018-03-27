# Maintainer: Felix Singer

_pkgname=mumble
pkgname=${_pkgname}-snapshot-minimal
pkgver=1.3.0_2717_gb25db3e
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Mumble is an open source voice chat application similar to TeamSpeak. This release doesn't include Text2Speech, Overlay and several plugins."
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'opus' 'speex' 'libpulse' 'avahi' 'protobuf')
makedepends=('boost' 'qt5-tools' 'python' 'gcc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
url="https://mumble.info"
source=("https://mumble.info/snapshot/mumble-${pkgver//_/\~}~snapshot.tar.gz")
sha512sums=('6f6d1f89dab533094c837ef517c7581d045dfc98cb271fd895329a1ff87053c3acd1d47d48156e8fd5279cf5c0ce86e24ffb1299f58cfb808f85a55dd37fea8a')

build() {
    cd $srcdir/mumble-${pkgver//_/\~}~snapshot

    qmake-qt5 main.pro \
      CONFIG+="bundled-celt no-bundled-opus no-bundled-speex no-g15 no-xevie no-server no-embed-qt-translations no-update no-speechd no-overlay no-bonjour" \
      DEFINES+="PLUGIN_PATH=/usr/lib/mumble" \
      INCLUDEPATH+="/usr/include/openssl-1.0" \
      QMAKE_LFLAGS+="-L/usr/lib/openssl-1.0 -lssl -lcrypto"

    make release
}

package() {
    cd "${srcdir}/mumble-${pkgver//_/\~}~snapshot"

    install -m755 -D "./release/mumble" "${pkgdir}/usr/bin/mumble"

    install -m755 -D "./release/libcelt0.so.0.11.0" "${pkgdir}/usr/lib/mumble/libcelt0.so.0.11.0"
    ln -s "libcelt0.so.0.11.0" "${pkgdir}/usr/lib/mumble/libcelt0.so"
    ln -s "libcelt0.so.0.11.0" "${pkgdir}/usr/lib/mumble/libcelt0.so.0"
    ln -s "libcelt0.so.0.11.0" "${pkgdir}/usr/lib/mumble/libcelt0.so.0.11"

    install -m755 -D "./release/libcelt0.so.0.7.0" "${pkgdir}/usr/lib/mumble/libcelt0.so.0.7.0"
    ln -s "libcelt0.so.0.7.0" "${pkgdir}/usr/lib/mumble/libcelt0.so.0.7"

    install -m644 -D "./scripts/mumble.desktop" "${pkgdir}/usr/share/applications/mumble.desktop"
    install -m755 -d "${pkgdir}/usr/share/man/man1"
    install -m644 -D "./man/mumble.1" "${pkgdir}/usr/share/man/man1/"
    install -m644 -D "./icons/mumble.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mumble.svg"
    install -m644 -D "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
