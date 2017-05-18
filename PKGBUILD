#Maintainer: ovi chis <sonekken@gmail.com>

pkgname=corosync
pkgver=2.4.2
pkgrel=2
pkgdesc="Cluster engine for nodal communication systems with additional features for implementing high availability within applications."
arch=('i686' 'x86_64')
url="http://www.corosync.org/"
license=('BSD')
depends=('nss' 'libstatgrab' 'net-snmp' 'libdbus' 'libqb')
provides=('corosync=2.4.2')
conflicts=('corosync1')
source=("http://build.clusterlabs.org/corosync/releases/corosync-$pkgver.tar.gz"
	"corosync.service")
md5sums=('7e9b72c21817bb6630c9bfaaa4076420'
         '93d77bf4963852cf842497d5da92dc82')

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
              --with-systemddir=/usr/lib/systemd/system \
              --with-tmpfilesdir=/usr/lib/tmpfiles.d
  make V=0
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  rm -fr "${pkgdir}/var/log"
  install -Dm644 /dev/null "${pkgdir}/usr/lib/tmpfiles.d/corosync.conf"
  echo "d /var/log/cluster 0755 root root -" \
    >"${pkgdir}/usr/lib/tmpfiles.d/corosync.conf"
}


