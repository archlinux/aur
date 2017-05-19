# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: gls <ghostlovescorebg at gmail dot com>
# Contributor: Thermi <noel at familie-kuntze dot de>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=pacemaker
pkgver=1.1.16
pkgrel=3
pkgdesc="advanced, scalable high-availability cluster resource manager"
arch=('i686' 'x86_64')
url="https://github.com/ClusterLabs/${pkgname}/"
license=('GPL2')
makedepends=('libxml2' 'inkscape')
depends=('gnutls' 'glib2' 'pam' 'libtool' 'python' 'libxslt' 'corosync' 'libesmtp' 'libqb')
source=("https://github.com/ClusterLabs/$pkgname/archive/Pacemaker-$pkgver.tar.gz"
        'pacemaker.sysusers'
        'pacemaker.tmpfiles'
        'crm_report.in')
md5sums=('a3b9d075bc9114ff698966e57e50bb12'
         'f21b93a2bb62d54b69b9bd4427201707'
         '3339ef9d5124e722800b0aeda16f464c'
         '07f26ba3fff0749cc5bc5b4da154611d')

prepare() {
  cd ${pkgname}-Pacemaker-${pkgver}
  autoreconf -fiv
#  ./autogen.sh
}

build() {
  cd ${pkgname}-Pacemaker-${pkgver}
  ./configure \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-fatal-warnings \
    --with-version=$pkgver-$pkgrel \
    --enable-systemd \
    --disable-upstart \
    --with-ais \
    --with-corosync \
    --without-heartbeat \
    --without-cman \
    --with-cs-quorum \
    --with-nagios \
    --with-snmp \
    --with-esmtp \
    --with-acl \
    --with-cibsecrets \
    --without-profiling \
    --without-coverage \
    --with-configdir=/etc/pacemaker
#   --with-nagios-plugin-dir=DIR
#   --with-nagios-metadata-dir=DIR
  make V=0
}

package() {
  cd ${pkgname}-Pacemaker-${pkgver}
  make DESTDIR="${pkgdir}" install
  cd "$srcdir"
  install -dm755 "$pkgdir"/usr/lib/{tmpfiles.d,sysusers.d}
  install -Dm644 $pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  rm -fr "$pkgdir/var"
  chmod a+x "$pkgdir/usr/share/pacemaker/tests/cts/CTSlab.py"
  find "$pkgdir" -name '*.xml' -type f -print0 | xargs -0 chmod a-x
  find "$pkgdir" -type f -name '*.la' -delete -print
  rm -fr "$pkgdir/etc/init.d"
  rm -f "$pkgdir/usr/bin/fence_pcmk"
  mv "$pkgdir/usr/bin/crm_report" "$pkgdir/usr/bin/crm_report.pacemaker"
  install -Dm755 crm_report.in "$pkgdir/usr/bin/crm_report"
}

# vim: set sw=2 et:
