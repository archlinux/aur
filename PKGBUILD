# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: gls <ghostlovescorebg at gmail dot com>
# Contributor: Thermi <noel at familie-kuntze dot de>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=pacemaker
pkgver=2.0.0
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
install=${pkgname}.install
source=("https://github.com/ClusterLabs/$pkgname/archive/Pacemaker-$pkgver.tar.gz"
        'crm_report.in')
sha512sums=('63c287888e5f0bd5f1a2f56450cb3d4da580df2d750ffa90b2212a4efcfa146e05e258a9d87fdcaacde5f8985b9730dae11c5d5ad22e811fd114e1640365c9aa'
            '09a80f5579db9016dcbba759ee9b661aea24ed7c98906939d5e50befb344c693652a9634ab804a91bfedeeeb69ce5ab87f30d2ed356bfefd9cdc67669a1cce64')

prepare() {
  cd ${pkgname}-Pacemaker-${pkgver}
  autoreconf -fiv
#  ./autogen.sh
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
    --with-configdir=/etc/pacemaker
#   --with-nagios-plugin-dir=DIR
#   --with-nagios-metadata-dir=DIR
  make V=0
}

package() {
  cd ${pkgname}-Pacemaker-${pkgver}
  make DESTDIR="${pkgdir}" install
  cd "$srcdir"
  install -Dm644 /dev/null "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  cat>"$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"<<-EOF
		d /var/log/pacemaker          0755 hacluster haclient
		d /var/lib/pacemaker          0770 hacluster haclient
		d /var/lib/pacemaker/blackbox 0770 hacluster haclient
		d /var/lib/pacemaker/cib      0770 hacluster haclient
		d /var/lib/pacemaker/cores    0770 hacluster haclient
		d /var/lib/pacemaker/pengine  0770 hacluster haclient
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
sha512sums=('45e6880b06998a0f196e7ce5322bd288bda3801ee3009136b49d463cd85e6b9f4dfa4c83f823a355b92f2d02ff0b1f507f8f6b5f42da86ef0fe7421fbfd0027e'
            '09a80f5579db9016dcbba759ee9b661aea24ed7c98906939d5e50befb344c693652a9634ab804a91bfedeeeb69ce5ab87f30d2ed356bfefd9cdc67669a1cce64')
