# Maintainer: Felix Singer

_pkgname=mumble
pkgname=${_pkgname}-stable-minimal
pkgver=1.2.16
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Mumble stable without Text2Speech and Overlay"
license=('BSD')
depends=('qt4' 'speex' 'lsb-release' 'libxi' 'avahi' 'libsndfile' 'protobuf' 'libpulse' 'jack' 'opus' 'xdg-utils')
makedepends=('boost' 'mesa')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
url="http://mumble.info/"
source=("https://github.com/mumble-voip/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('58e7574af80e36e0b943df0e6a44d6ce')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  qmake-qt4 main.pro \
    CONFIG+="bundled-celt no-bundled-opus no-bundled-speex no-g15 no-xevie no-server \
              no-embed-qt-translations no-update no-speechd no-overlay packaged" \
    DEFINES+="PLUGIN_PATH=/usr/lib/mumble"

  make release
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm755 "./release/mumble" "${pkgdir}/usr/bin/mumble"

  install -Dm755 "./release/plugins/liblink.so" "${pkgdir}/usr/lib/mumble/liblink.so"
  install -Dm755 "./release/plugins/libmanual.so" "${pkgdir}/usr/lib/mumble/libmanual.so"
  install -Dm755 "./release/libcelt"* "${pkgdir}/usr/lib/mumble/"

  install -Dm644 "./scripts/mumble.desktop" "${pkgdir}/usr/share/applications/mumble.desktop"
  install -dm755 "${pkgdir}/usr/share/man/man1"
  install -Dm644 "./man/mum"* "${pkgdir}/usr/share/man/man1/"
  install -Dm644 "./icons/mumble.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mumble.svg"
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
