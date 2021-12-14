#Maintainer: Brian Bidulock <bidulock@openss7.org>
#Contributor: ovi chis <ovi@ovios.org>

pkgname=corosync
pkgver=3.1.6
pkgrel=1
pkgdesc="Cluster engine for nodal communications systems with high availability features."
arch=('i686' 'x86_64')
url="http://www.corosync.org/"
license=('BSD')
depends=('nss' 'libstatgrab' 'net-snmp' 'libdbus' 'libqb' 'libcgroup' 'kronosnet')
source=("$pkgname-$pkgver.tar.gz::https://github.com/corosync/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('7b98886bd70071b941de7adc839c7d28')

prepare() {
  cd ${pkgname}-${pkgver}
  echo ${pkgver} >.tarball-version
  GIT_DIR=`pwd`/.git ./autogen.sh
}
build() {
  cd ${pkgname}-${pkgver}
  GIT_DIR=`pwd`/.git ./configure --sbindir=/usr/bin \
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
  cd ${pkgname}-${pkgver}
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
