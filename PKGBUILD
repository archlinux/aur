# Maintainer: Felix Singer

_pkgname=mumble
pkgname=${_pkgname}-stable-minimal
pkgver=1.2.19
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Mumble is an open source voice chat application similar to TeamSpeak. This release doesn't include Text2Speech, Overlay and several plugins."
license=('BSD')
depends=('qt4' 'speex' 'libxi' 'avahi' 'libsndfile' 'protobuf' 'libpulse' 'jack' 'opus' 'xdg-utils')
makedepends=('boost' 'mesa')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
url="https://mumble.info"
source=("https://github.com/mumble-voip/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('f91111194a899149b500a94afcf7cc5b9691c7ce8669f07fca2c66adbb3916ddb863bf703d04fb8387133fb75f3c8edb52974d1acf3febfafa1f73da19946de4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  qmake-qt4 main.pro \
    CONFIG+="bundled-celt no-bundled-opus no-bundled-speex no-g15 no-xevie no-server \
              no-embed-qt-translations no-update packaged no-speechd no-overlay no-bonjour" \
    DEFINES+="PLUGIN_PATH=/usr/lib/mumble"

  make release
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

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
