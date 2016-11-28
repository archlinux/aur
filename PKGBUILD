# Maintainer: Felix Singer

_pkgname=mumble
pkgname=${_pkgname}-stable-minimal
pkgver=1.2.17
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Mumble is an open source voice chat application similar to TeamSpeak. This release doesn't include Text2Speech, Overlay and several plugins."
license=('BSD')
depends=('qt4' 'speex' 'lsb-release' 'libxi' 'avahi' 'libsndfile' 'protobuf' 'libpulse' 'jack' 'opus' 'xdg-utils')
makedepends=('boost' 'mesa')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
url="https://mumble.info"
source=("https://github.com/mumble-voip/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('03cb0a2048d42bd480741e0580cb4bf6961d607d6cf9b620434aea87ac0cd7cdbfae33863b71821ac8b931300df490ae5436f3c8098d6a5f37dd1eab0fb34dbe')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  qmake-qt4 main.pro \
    CONFIG+="bundled-celt no-bundled-opus no-bundled-speex no-g15 no-xevie no-server \
              no-embed-qt-translations no-update packaged no-speechd no-overlay optimize" \
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
