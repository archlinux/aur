#Maintainer: ovi chis <sonekken@gmail.com>
pkgname=corosync-git
pkgver=2.4.1.r36.g4939c75
pkgrel=2
pkgdesc="Cluster engine for nodal communication systems with additional features for implementing high availability within applications."
arch=('i686' 'x86_64')
url="http://www.corosync.org/"
license=('BSD')
makedepends=('git')
depends=('nss' 'libstatgrab' 'net-snmp' 'libdbus' 'libqb' 'kronosnet-git')
provides=('corosync')
conflicts=('corosync1' 'corosync')
source=("$pkgname::git+https://github.com/corosync/corosync.git"
    "corosync.service")

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  mkdir -p m4
  autoreconf -fiv
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
              --with-systemddir=/usr/lib/systemd/system \
              --with-tmpfilesdir=/usr/lib/tmpfiles.d
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('SKIP'
         '93d77bf4963852cf842497d5da92dc82')
