# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=x2goclient
pkgname=${_pkgname}-qt5
pkgver=4.1.0.0
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.x2go.org"
depends=('qt5-x11extras' 'qt5-svg' 'phonon-qt5' 'libldap' 'libcups' 'nxproxy' 'libssh' 'libxpm' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'man2html' 'xdg-utils' 'xorg-xauth')
# FS#48088
optdepends=('xorg-xauth: may be required by X2goservers running a different linux distribution giving MIT-COOKIE errors')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(http://code.x2go.org/releases/source/${_pkgname}/${_pkgname}-${pkgver}.tar.gz{,.asc})
sha256sums=('4b5915bc3666228910342810a34f7a03fb6967c6b9c796633d9cdf8b89cc2b6a'
            'SKIP')
validpgpkeys=('9BFBAEE86C0AA5FFBF2207829AF46B3025771B31'  # Mike Gabriel <mike.gabriel@das-netzwerkteam.de>
              '1AD23D1B8F087A35AB74BDE9F4A7678C9C6B0B2B') #  "X2go Git Administrator <git-admin@x2go.org>"

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -i "s:-o root -g root ::" Makefile
  # Enable a qt5 build
  sed -i 's:qmake-qt4:qmake-qt5:' Makefile
  sed -i 's:lrelease-qt4:lrelease-qt5:' Makefile
}

build() {
  cd ${_pkgname}-${pkgver}
  make PREFIX=/usr build_client
  # Don't build the browser plugin - requires qt4 (also NPAPI is deprecated)
  make PREFIX=/usr build_man
}

package() {
  cd ${_pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="$pkgdir" install_client install_man
}
