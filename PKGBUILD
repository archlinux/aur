# Maintainer: Strykar <strykar@hotmail.com>

pkgname=ntripcaster
pkgver=2.0.47
pkgrel=3
pkgdesc="BKG Professional caster disseminates real-time GNSS data streams via NTRIP"
arch=('x86_64' 'aarch64')
url="https://igs.bkg.bund.de/ntrip/bkgcaster"
license=('GPL-2.0-only')
install=ntripcaster.install
backup=("etc/ntripcaster/ntripcaster.conf")
depends=('glibc')
optdepends=('libwrap: for tcp_wrapper support' 'python: for scripting')
makedepends=('gcc' 'make' 'autoconf' 'automake')
source=("https://igs.bkg.bund.de/root_ftp/NTRIP/software/caster/ntripcaster-${pkgver}.tar.bz2"
	"ntripcaster.tmpfiles"
	"ntripcaster.service")
sha256sums=("52676a9b85156b16255b4eb54c41c55ec2553e17196929bdec89bf1525b3deec"
	"6f4b86cafff8d239745bd9705c4d1f51a558d99e3c8ade70f200eb574a7e9b93"
	"a613f80c795836a275c33177d855741778dc961b75c43b7fcf7d55c6f6268734")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i config.h.in \
    -e 's|"conf"|"/etc/ntripcaster"|' \
    -e 's|"logs"|"/var/log/ntripcaster"|'

  sed -i conf/ntripcaster.conf.dist.in \
    -e 's|@NTRIPCASTER_VARDIR_INST@|/run/ntripcaster|' \
    -e 's|@NTRIPCASTER_LOGDIR_INST@|/var/log/ntripcaster|' \
    -e 's|@NTRIPCASTER_TEMPLATEDIR_INST@|/usr/share/ntripcaster/templates|'    

  autoreconf -fi
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var
  
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/etc/ntripcaster"
  install -d "${pkgdir}/usr/share/doc/ntripcaster"
  install -d "${pkgdir}/usr/share/ntripcaster/templates"
  install -Dm755 src/ntripdaemon "${pkgdir}/usr/bin/ntripdaemon"
  install -Dm644 conf/*.dist "${pkgdir}/usr/share/doc/ntripcaster/"
  install -Dm644 README "${pkgdir}/usr/share/doc/ntripcaster/README"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/ntripcaster/LICENSE"
  install -Dm644 conf/ntripcaster.conf.dist "${pkgdir}/etc/ntripcaster/ntripcaster.conf"
  install -Dm644 templates/*.{html,ico,txt} "${pkgdir}/usr/share/ntripcaster/templates/"
  install -Dm644 ntripcaster_manual.html "${pkgdir}/usr/share/doc/ntripcaster/ntripcaster_manual.html"
  install -Dm644 "${srcdir}/ntripcaster.service" "${pkgdir}/usr/lib/systemd/system/ntripcaster.service"
  install -Dm644 "${srcdir}/ntripcaster.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/ntripcaster-tmpfiles.conf"
}
