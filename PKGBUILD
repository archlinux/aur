#Maintainer: ovi chis <sonekken@gmail.com>

pkgname=corosync
pkgver=2.4.2
pkgrel=1
pkgdesc="Cluster engine for nodal communication systems with additional features for implementing high availability within applications."
arch=('i686' 'x86_64')
url="http://www.corosync.org/"
license=('BSD')
depends=('libstatgrab' 'net-snmp' 'libdbus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/corosync/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('7e9b72c21817bb6630c9bfaaa4076420')

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

# vim: set sw=2 et:
