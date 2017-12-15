# Maintainer: Michael Spradling <mike@mspradling.com>

pkgname='bareos-traymonitor'
pkgver=17.2.4
pkgrel=1
# Needed for old day split, need to submit ticket to convert this split
# package to normal package
pkgbase="bareos-x11"
arch=(x86_64)
pkgdesc="Bareos - Backup Archiving REcovery Open Sourced"
url="http://www.bareos.org"
license=('AGPL3')
source=("git+https://github.com/bareos/bareos.git#tag=Release/$pkgver")
depends+=('qt4' "bareos-common=${pkgver}")
md5sums=('SKIP')
install=bareos-traymonitor.install

prepare() {
  cd $srcdir/bareos
  sed -i "s/python-config/python2-config/g" configure
}

build() {
  cd $srcdir/bareos
  QMAKE="/usr/bin/qmake-qt4" ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/ \
    --libdir=/usr/lib/bareos \
    --disable-conio \
    --enable-traymonitor  \
    --with-x \
    --enable-client-only \
    --with-python \
    --with-openssl \
    --disable-rpath \
    --with-logdir=/var/log/bareos \
    --with-fd-user=root \
    --with-pid-dir=/run/bareos \
    --with-fd-group=root \
    --with-configtemplatedir=/usr/share/bareos/config \
    --with-working-dir=/var/lib/bareos \
    --with-plugindir=/usr/lib/bareos/plugins \
    --with-scriptdir=/usr/lib/bareos/scripts \
    --with-backenddir=/usr/lib/bareos/backends \
    --with-archivedir=/var/lib/bareos/storage \
    --with-bsrdir=/var/lib/bareos \
    --with-subsys-dir=/run/bareos \
    --with-systemd && make

    make DESTDIR="$srcdir/install" install install-autostart
}


_cp() {
  mkdir -p "$(dirname $2)"
  cp -a "$1" "$2"
}

package() {
  for f in \
    usr/share/bareos-traymonitor/config/tray-monitor.d/monitor/bareos-mon.conf \
    usr/bin/bareos-tray-monitor \
    usr/share/man/man1/bareos-tray-monitor.1.gz \
    usr/share/applications/bareos-tray-monitor.desktop \
    usr/share/pixmaps/bareos-tray-monitor.xpm \
  ; do
    _cp $srcdir/install/$f $pkgdir/$f
  done
}
