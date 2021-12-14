# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: ovi chis <sonekken@gmail.com>

pkgname=corosync-git
_pkgname=corosync
pkgver=3.1.6.r1.g8b638e98
pkgrel=1
pkgdesc="Cluster engine for nodal communication systems with additional features for implementing high availability within applications."
arch=('i686' 'x86_64')
url="http://www.corosync.org/"
license=('BSD')
makedepends=('git')
depends=('nss' 'libstatgrab' 'net-snmp' 'libdbus' 'libqb-git' 'libcgroup' 'kronosnet-git')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=(${_pkgname})
source=("$pkgname::git+https://github.com/corosync/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --sbindir=/usr/bin \
              --sysconfdir=/etc \
              --libdir=/usr/lib \
              --localstatedir=/var \
              --enable-dbus \
              --enable-monitoring \
              --enable-watchdog \
              --enable-systemd \
              --disable-upstart \
              --enable-snmp \
              --enable-xmlconf \
              --enable-qdevices \
              --enable-qnetd \
              --enable-libcgroup \
              --with-systemddir=/usr/lib/systemd/system \
              --with-tmpfilesdir=/usr/lib/tmpfiles.d
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  rm -fr "${pkgdir}/var/log"
  rm -fr "${pkgdir}/var/run"
  install -Dm644 /dev/null "${pkgdir}/usr/lib/tmpfiles.d/corosync.conf"
  cat >>"${pkgdir}/usr/lib/tmpfiles.d/corosync.conf" <<EOF
d /var/log/cluster 0755 root root -
d /run/corosync-qdevice 0755 root root -
d /run/corosync-qnetd 0755 root root -
EOF
}

# vim: set sw=2 et:
