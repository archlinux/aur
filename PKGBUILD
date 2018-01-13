# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Moritz Kiefer <moritz.kiefer@gmail.com>

_pkgname=mumble
pkgname=${_pkgname}-jack
pkgver=1.2.19
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Mumble with support for JACK"
license=('BSD')
depends=('qt4' 'speex' 'lsb-release' 'libxi' 'avahi' 'libsndfile' 'protobuf' 'libpulse' 'jack' 'opus' 'xdg-utils' 'speech-dispatcher')
makedepends=('boost' 'mesa')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
url="http://mumble.info/"
source=("https://github.com/mumble-voip/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "http://sourceforge.net/p/mumble/patches/_discuss/thread/1bfdbda2/a90e/attachment/mumble-jack-support.patch"
        "https://github.com/mumble-voip/mumble/commit/ea861fe86743c8402bbad77d8d1dd9de8dce447e.patch")
md5sums=('d101068ed27ce119effdb3765a8cf8e4'
         '03d89f5f4265de696505211984b969a0'
         '82e187597fde5db46c3d77befef06143')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -Np1 < "${srcdir}/mumble-jack-support.patch"
  patch -Np1 < "${srcdir}/ea861fe86743c8402bbad77d8d1dd9de8dce447e.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  qmake-qt4 main.pro \
    CONFIG+="bundled-celt no-bundled-opus no-bundled-speex no-g15 no-xevie no-server \
    no-embed-qt-translations no-update packaged" \
    DEFINES+="PLUGIN_PATH=/usr/lib/mumble" \
    INCLUDEPATH+="/usr/include/speech-dispatcher"
  make release
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm755 "./release/mumble" "${pkgdir}/usr/bin/mumble"
  install -Dm755 "./scripts/mumble-overlay" "${pkgdir}/usr/bin/mumble-overlay"

  install -Dm755 "./release/libmumble.so.${pkgver}" "${pkgdir}/usr/lib/mumble/libmumble.so.${pkgver}"
  ln -s "libmumble.so.${pkgver}" "${pkgdir}/usr/lib/mumble/libmumble.so"
  ln -s "libmumble.so.${pkgver}" "${pkgdir}/usr/lib/mumble/libmumble.so.1"
  ln -s "libmumble.so.${pkgver}" "${pkgdir}/usr/lib/mumble/libmumble.so.1.2"
  install -Dm755 "./release/plugins/liblink.so" "${pkgdir}/usr/lib/mumble/liblink.so"
  install -Dm755 "./release/plugins/libmanual.so" "${pkgdir}/usr/lib/mumble/libmanual.so"
  install -Dm755 "./release/libcelt"* "${pkgdir}/usr/lib/mumble/"

  install -Dm644 "./scripts/mumble.desktop" "${pkgdir}/usr/share/applications/mumble.desktop"
  install -dm755 "${pkgdir}/usr/share/man/man1"
  install -Dm644 "./man/mum"* "${pkgdir}/usr/share/man/man1/"
  install -Dm644 "./icons/mumble.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mumble.svg"
  install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
