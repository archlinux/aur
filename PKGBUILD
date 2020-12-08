# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: gls <ghostlovescorebg at gmail dot com>
# Contributor: Thermi <noel at familie-kuntze dot de>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=pacemaker1.1-git
_pkgname=pacemaker
pkgver=1.1.24.r0.g385048474
pkgrel=1
pkgdesc="advanced, scalable high-availability cluster resource manager (1.1 series)"
arch=('i686' 'x86_64')
url="https://github.com/ClusterLabs/${_pkgname}/"
license=('GPL2')
makedepends=('git' 'inkscape' 'help2man' 'asciidoc')
depends=('gnutls' 'glib2' 'pam' 'libtool' 'python-lxml' 'python-yaml' 'libesmtp'
         'corosync' 'libqb' 'resource-agents' 'fence-agents'
         'ha-glue' 'net-snmp')
optdepends=('pssh: for use with some tools'
            'pdsh: for use with some tools'
            'crmsh: for use with crm_report'
            'booth: for geo-clustering')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
source=("$pkgname::git+https://github.com/ClusterLabs/${_pkgname}.git#branch=1.1"
        'crm_report.in'
        'makefile-chown.patch')
md5sums=('SKIP'
         '07f26ba3fff0749cc5bc5b4da154611d'
         'e621d388eb0521a7ef74205a5707508a')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  patch -Np2 -b -z .orig <../makefile-chown.patch
  autoreconf -fiv
# ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    CFLAGS="$CFLAGS -fcommon" \
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
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
  cd "$srcdir"
  install -Dm644 /dev/null "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  cat>"$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"<<-EOF
		d /var/lib/pacemaker          0750 hacluster haclient
		d /var/lib/pacemaker/blackbox 0750 hacluster haclient
		d /var/lib/pacemaker/cib      0750 hacluster haclient
		d /var/lib/pacemaker/cores    0750 hacluster haclient
		d /var/lib/pacemaker/pengine  0750 hacluster haclient
	EOF
  install -Dm644 /dev/null "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  cat>"$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"<<-EOF
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
