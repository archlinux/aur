# Maintainer: Strykar <strykar@hotmail.com>

pkgname=ntripcaster
pkgver=2.0.47
pkgrel=1
pkgdesc="BKG Professional caster disseminates real-time GNSS data streams via NTRIP"
arch=('x86_64' 'aarch64')
url="https://igs.bkg.bund.de/ntrip/bkgcaster"
license=('GPL-2.0-only')
backup=("etc/ntripcaster.conf")
depends=('glibc')
optdepends=('libwrap: for tcp_wrapper support' 'python: for scripting')
makedepends=('gcc' 'make' 'autoconf' 'automake')
source=("https://igs.bkg.bund.de/root_ftp/NTRIP/software/caster/ntripcaster-${pkgver}.tar.bz2")
sha256sums=("52676a9b85156b16255b4eb54c41c55ec2553e17196929bdec89bf1525b3deec")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i scripts/ntripcaster.service.in \
    -e 's|@NTRIPCASTER_ETCDIR_INST@|/etc/ntripcaster|g' \
    -e 's|@NTRIPCASTER_LOGDIR_INST@|/var/log/ntripcaster|g' \
    -e 's|@NTRIPCASTER_SBINDIR@|/usr/bin|g' \
    -e 's|@NTRIPCASTER_VARDIR_INST@|/run/ntripcaster|g'

  sed -i conf/ntripcaster.conf.dist.in \
    -e 's|@NTRIPCASTER_LOGDIR_INST@|/var/log/ntripcaster|' \
    -e 's|@NTRIPCASTER_VARDIR_INST@|/run/ntripcaster|' \
    -e 's|@NTRIPCASTER_TEMPLATEDIR_INST@|/usr/share/ntripcaster/templates|'    

  sed -i config.h.in \
    -e 's|"conf"|"/etc/ntripcaster"|' \
    -e 's|"logs"|"/var/log/ntripcaster"|'

  autoreconf -fi
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin
  
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 src/ntripdaemon "${pkgdir}/usr/bin/ntripdaemon"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 conf/ntripcaster.conf.dist "${pkgdir}/etc/ntripcaster.conf"
  install -Dm644 scripts/ntripcaster.service "${pkgdir}/usr/lib/systemd/system/ntripcaster.service"
  install -Dm644 ntripcaster_manual.html "${pkgdir}/usr/share/doc/${pkgname}/ntripcaster_manual.html"
  
  install -d "${pkgdir}/usr/share/${pkgname}/templates"
  cp -a templates/. "${pkgdir}/usr/share/${pkgname}/templates/"
  install -Dm644 conf/*.dist "${pkgdir}/usr/share/doc/${pkgname}/"

  rm -f "${pkgdir}/usr/share/${pkgname}/templates/Makefile"
  rm -f "${pkgdir}/usr/share/${pkgname}/templates/Makefile.in"
  rm -f "${pkgdir}/usr/share/${pkgname}/templates/Makefile.am"
  
  install -d "${pkgdir}/run/ntripcaster"
  install -d "${pkgdir}/var/log/ntripcaster"
}
