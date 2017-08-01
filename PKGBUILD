# Maintainer: Felix Singer

_pkgname=mumble
pkgname=${_pkgname}-snapshot-minimal
pkgver=1.3.0_2523_g5aaf1ed
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Mumble is an open source voice chat application similar to TeamSpeak. This release doesn't include Text2Speech, Overlay and several plugins."
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'opus' 'speex' 'libpulse' 'avahi' 'protobuf')
makedepends=('boost' 'qt5-tools' 'python')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
url="https://mumble.info"
source=("https://mumble.info/snapshot/mumble-${pkgver//_/\~}~snapshot.tar.gz")
sha512sums=('e1c214ac98a5c087ea683fbaee5a2f3e20fd21a3f3d0627b6abafd0434011d309e058b081061507ff869e6367f5e6979426c600e5615df05ea722d3ec7311c2b')

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
