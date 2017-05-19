# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: gls <ghostlovescorebg at gmail dot com>
# Contributor: Thermi <noel at familie-kuntze dot de>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=pacemaker-git
_pkgname=pacemaker
pkgver=1.1.17.rc1.r20.g49eb595ab
pkgrel=2
pkgdesc="advanced, scalable high-availability cluster resource manager"
arch=('i686' 'x86_64')
url="https://github.com/ClusterLabs/${_pkgname}/"
license=('GPL2')
makedepends=('git' 'libxml2' 'inkscape')
depends=('gnutls' 'glib2' 'pam' 'libtool' 'python' 'libxslt' 'corosync-git' 'libesmtp' 'libqb-git')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("$pkgname::git+https://github.com/ClusterLabs/${_pkgname}.git"
        'pacemaker.sysusers'
        'pacemaker.tmpfiles'
        'crm_report.in')
md5sums=('SKIP'
         'f21b93a2bb62d54b69b9bd4427201707'
         '3339ef9d5124e722800b0aeda16f464c'
         '07f26ba3fff0749cc5bc5b4da154611d')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  autoreconf -fiv
# ./autogen.sh
}

build() {
  cd $pkgname
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
  cd $pkgname
  make DESTDIR="${pkgdir}" install
  cd "$srcdir"
  install -dm755 "$pkgdir"/usr/lib/{tmpfiles.d,sysusers.d}
  install -Dm644 $_pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -Dm644 $_pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
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
