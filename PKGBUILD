# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: gls <ghostlovescorebg at gmail dot com>
# Contributor: Thermi <noel at familie-kuntze dot de>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=pacemaker
pkgver=2.1.6
pkgrel=1
pkgdesc="advanced, scalable high-availability cluster resource manager"
arch=('i686' 'x86_64')
url="https://github.com/ClusterLabs/${pkgname}/"
license=('GPL2')
makedepends=('inkscape' 'help2man' 'asciidoc')
depends=('gnutls' 'glib2' 'pam' 'libtool' 'python-lxml' 'python-yaml' 'libesmtp'
         'corosync' 'libqb' 'resource-agents' 'fence-agents'
         'ha-glue' 'net-snmp')
optdepends=('pssh: for use with some tools'
            'pdsh: for use with some tools'
            'crmsh: for use with crm_report'
            'booth: for geo-clustering')
source=("https://github.com/ClusterLabs/$pkgname/archive/Pacemaker-$pkgver.tar.gz"
        'crm_report.in')
sha512sums=('46a05cec46212e92eef3916fa44ced5fcf41d3014761bbe095cd23ef7acad6969a937d81c907f2ff1a2f212bc20ec9f9bf43786db31ebd5a227fdfade91e7440'
            '09a80f5579db9016dcbba759ee9b661aea24ed7c98906939d5e50befb344c693652a9634ab804a91bfedeeeb69ce5ab87f30d2ed356bfefd9cdc67669a1cce64')

prepare() {
  cd ${pkgname}-Pacemaker-${pkgver}
  ./autogen.sh
}

build() {
  cd ${pkgname}-Pacemaker-${pkgver}
  ./configure \
    CPPFLAGS= \
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
    --with-corosync \
    --with-nagios \
    --with-acl \
    --with-cibsecrets \
    --without-profiling \
    --without-coverage \
    --with-configdir=/etc/pacemaker \
    --with-initdir=/etc/init.d
#   --with-nagios-plugin-dir=DIR
#   --with-nagios-metadata-dir=DIR
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make V=0
}

package() {
  cd ${pkgname}-Pacemaker-${pkgver}
  make DESTDIR="${pkgdir}" install
  chown root:root "${pkgdir}"/etc/pacemaker
  chmod 0755 "${pkgdir}"/etc/pacemaker
  cd "$srcdir"
  install -Dm644 /dev/null "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  cat>"$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"<<-EOF
		d /etc/pacemaker              0750 root      haclient
		d /var/log/pacemaker          0755 hacluster haclient
		d /var/lib/pacemaker          0770 hacluster haclient
		d /var/lib/pacemaker/blackbox 0770 hacluster haclient
		d /var/lib/pacemaker/cib      0770 hacluster haclient
		d /var/lib/pacemaker/cores    0770 hacluster haclient
		d /var/lib/pacemaker/pengine  0770 hacluster haclient
	EOF
  install -Dm644 /dev/null "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  cat>"$pkgdir/usr/lib/sysusers.d/$pkgname.conf"<<-EOF
    g haclient 189
    u hacluster 189:189 "cluster user" / /sbin/nologin
	EOF
  rm -fr "$pkgdir/var"
  chmod a+x "$pkgdir/usr/share/pacemaker/tests/cts/CTSlab.py"
  find "$pkgdir" -name '*.xml' -type f -print0 | xargs -0 chmod a-x
  rm -fr "$pkgdir/etc/init.d"
  rm -f "$pkgdir/usr/bin/fence_pcmk"
  mv "$pkgdir/usr/bin/crm_report" "$pkgdir/usr/bin/crm_report.pacemaker"
  install -Dm755 crm_report.in "$pkgdir/usr/bin/crm_report"
}

# vim: set sw=2 et ts=2:
