# Maintainer: Sébastien Luttringer

pkgname=quagga
pkgver=0.99.23
pkgrel=1
pkgdesc='BGP/OSPF/ISIS/RIP/RIPNG routing daemon suite'
arch=('i686' 'x86_64')
url='http://www.quagga.net'
license=('GPL2')
depends=('libcap' 'libnl' 'net-snmp' 'readline' 'ncurses' 'perl')
options=('!buildflags')
install=quagga.install
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz"
        'babeld.service'
        'bgpd.service'
        'isisd.service'
        'ospf6d.service'
        'ospfd.service'
        'ripd.service'
        'ripngd.service'
        'zebra.service')
md5sums=('d17145e62b6ea14f0f13bb63f59e5166'
         '20a8e36ad851d4e06467aeb56a84b245'
         'cc90c234aac9098c5132d653037d5269'
         '67d0ada0f3000b9a86351798786c5256'
         '6e2569ef339838aa41375e913a8e19ce'
         '260f5fcf9b53ef201a8fb34e7ea90457'
         'b6e3549d780355914ae8edd43e15630a'
         '72dd63c49fdaea41729a4318d0fbac79'
         '577f1e7caeea31d910f2dc29c28ada7d')

prepare() {
  cd $pkgname-$pkgver
  shopt -s nullglob
  for _p in "$srcdir"/*.patch; do
    msg2 "Applying ${_p##*/}"
    patch -p 1 -i "$_p"
  done
}

build() {
  cd $pkgname-$pkgver
  # fix broken 0.99.22.4 tarball
  autoreconf -fvi
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/quagga \
    --localstatedir=/run/quagga \
    --enable-exampledir=/usr/share/doc/quagga/examples \
    --enable-vtysh \
    --enable-isisd \
    --enable-isis-topology \
    --enable-netlink \
    --enable-snmp \
    --enable-tcp-zebra \
    --enable-irdp \
    --enable-pcreposix \
    --enable-multipath=64 \
    --enable-user=quagga \
    --enable-group=quagga \
    --enable-configfile-mask=0640 \
    --enable-logfile-mask=0640
  make
}

package() {
  # upstream install
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # logrotate stuff
  install -D -m 644 redhat/$pkgname.logrotate "$pkgdir/etc/logrotate.d/$pkgname"
  sed -ri 's,/var/run/quagga,/run/quagga,g' "$pkgdir/etc/logrotate.d/$pkgname"

  # systemd
  cd "$srcdir"
  for _d in zebra ripd ripngd bgpd ospfd ospf6d isisd babeld; do
    install -D -m 644 $_d.service "$pkgdir/usr/lib/systemd/system/$_d.service"
  done
  install -D -m 644 /dev/null "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  echo "d /run/$pkgname 0750 $pkgname $pkgname" > "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

# vim:set ts=2 sw=2 et:
