# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=rasdaemon
pkgname=${_pkgname}-git
pkgver=0.8.0.r49.gf9cb13b
pkgrel=1
pkgdesc="A RAS (Reliability, Availability and Serviceability) logging tool using the EDAC tracing events"
arch=('x86_64' 'i686')
url=https://github.com/mchehab/rasdaemon
license=('GPL-2.0-only')
depends=('perl-dbd-sqlite' 'hwdata' 'dmidecode' 'libtraceevent')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/conf.d/rasdaemon')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's|^v||;s|-|.r|;s|-|.|'
}

prepare() {
  cd $_pkgname
  autoreconf -vfi
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr --sbindir=/usr/bin --with-sysconfdefdir=/etc/conf.d --localstatedir=/var \
              --enable-all
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir/" install
  install -Dm644 misc/{rasdaemon,ras-mc-ctl}.service -t "${pkgdir}"/usr/lib/systemd/system
}
