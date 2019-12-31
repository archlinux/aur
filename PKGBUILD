#Maintainer: ovi chis <ovi@ovios.org>

pkgname=corosync
pkgver=3.0.3
pkgrel=1
pkgdesc="Cluster engine for nodal communication systems with additional features for implementing high availability within applications."
arch=('i686' 'x86_64')
url="http://www.corosync.org/"
license=('BSD')
depends=('nss' 'libstatgrab' 'net-snmp' 'libdbus' 'libqb' 'libcgroup' 'kronosnet')
source=("$pkgname-$pkgver.tar.gz::https://github.com/corosync/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('c22d4e0f84c28781b37f03f4414c752e')

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
