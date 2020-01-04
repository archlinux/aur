# Maintainer: Patrick Jennings <patrick at jenningsga dot com>

pkgname=corosync-qdevice
pkgver=3.0.0
pkgrel=1
pkgdesc="The Corosync Cluster Engine Qdevice"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.corosync.org/"
license=('BSD')
depends=('corosync')
source=("$pkgname-$pkgver.tar.gz::https://github.com/corosync/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('06b6ba6bd34186a13e645b962cbcf0ebf644227688e3578e239632c82243ab3c')

prepare() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --sbindir=/usr/bin \
              --sysconfdir=/etc \
              --libdir=/usr/lib \
              --enable-dbus \
              --enable-monitoring \
              --enable-watchdog \
              --enable-systemd \
              --disable-upstart \
              --enable-snmp \
              --enable-xmlconf \
              --enable-qdevices \
              --enable-qnetd \
              --localstatedir=/var \
              --with-systemddir=/usr/lib/systemd/system \
              --with-tmpfilesdir=/usr/lib/tmpfiles.d
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install

  rm -r "$pkgdir/var/run"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set sw=2 et:
