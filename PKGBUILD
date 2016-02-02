# Maintainer: Shalygin Konstantin <k0ste@opentech.ru>

pkgname='spice-xpi'
pkgver='2.8.90'
pkgrel='11'
pkgdesc='XPI client for interacting with SPICE servers. This package contains a mozilla browser client for interacting with SPICE servers.'
arch=('x86_64')
url='http://spice-space.com'
license=('GPL')
depends=('firefox' 'spice')
provides=('browser-plugin-spice')
conflicts=('browser-plugin-spice')
makedepends=('git' 'python2' 'xulrunner' 'zip' 'gawk')
source=("git://anongit.freedesktop.org/spice/${pkgname}"
	"git://anongit.freedesktop.org/spice/spice-protocol")
sha256sums=('SKIP'
	    'SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long | gawk 'match($0, /^(spice-xpi)-([0-9.]+)-([0-9]+)-([a-z0-9]+)$/, a) {print a[2]}'
}

prepare() {
  pushd "${pkgname}"
  git submodule init
  git config submodule.spice-protocol.url "${srcdir}/spice-protocol"
  git submodule update
  ./autogen.sh
  make clean

  PYTHON=/usr/bin/python2 \
  ./configure \
  --prefix=/usr \
  --sbindir=/usr/bin \
  --bindir=/usr/bin \
  --sysconfdir=/etc \
  --localstatedir=/var/lib \
  --enable-xpi
  popd
}

build() {
  pushd "${pkgname}"
  make
  popd
}

package() {
  pushd "${srcdir}/${pkgname}"
  make DESTDIR="${srcdir}/xpi-temp" install
  popd
  install -Dm 755 "${srcdir}/xpi-temp/usr/lib/mozilla/plugins/npSpiceConsole.so" "${pkgdir}/usr/lib/mozilla/plugins/npSpiceConsole.so"
}
