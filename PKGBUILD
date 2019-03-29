# Maintainer: Felix Singer

_pkgname=mumble
pkgname=${_pkgname}-snapshot-minimal
pkgver=1.3.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Mumble is an open source voice chat application similar to TeamSpeak. This release doesn't include Text2Speech, Overlay and several plugins."
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'opus' 'speex' 'libpulse' 'avahi' 'protobuf')
makedepends=('boost' 'qt5-tools' 'python' 'gcc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
url="https://mumble.info"
# source=("https://mumble.info/snapshot/mumble-${pkgver//_/\~}~snapshot.tar.gz")
source=("https://mumble.info/snapshot/mumble-${pkgver}-rc1.tar.gz")
sha512sums=('e993b18b0ecf620d3a9a89f145c18b9ecde3aaf9b7217e235b7472908c81a365323c8683dd6fc9ed14b108160f8bf5244369c2a9ee57c22595550220d158516c')

build() {
#	cd $srcdir/mumble-${pkgver//_/\~}~snapshot
	cd $srcdir/mumble-${pkgver}

	qmake-qt5 main.pro \
		CONFIG+="bundled-celt no-bundled-opus no-bundled-speex no-g15 no-xevie no-server no-embed-qt-translations no-update no-speechd no-overlay no-bonjour" \
		DEFINES+="PLUGIN_PATH=/usr/lib/mumble"

	make release
}

package() {
	cd "${srcdir}/mumble-${pkgver}"

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
