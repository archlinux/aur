# Maintainer: Sébastien Luttringer

pkgname=quagga
pkgver=1.2.4
pkgrel=1
pkgdesc='BGP/OSPF/ISIS/RIP/RIPNG routing daemon suite'
arch=('x86_64')
url='http://www.quagga.net'
license=('GPL2')
depends=('libcap' 'libnl' 'net-snmp' 'readline' 'ncurses' 'perl' 'c-ares' 'openssl')
options=('!buildflags')
validpgpkeys=('C1B5C3ED3000F2BFCD66F3B76FE57CA8C1A4AEA6') # Quagga Release Signing Key
source=("https://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc}
        'quagga.sysusers'
        'quagga.tmpfiles'
        'bgpd.service'
        'isisd.service'
        'ospf6d.service'
        'ospfd.service'
        'pimd.service'
        'ripd.service'
        'ripngd.service'
        'zebra.service')
md5sums=('eced21b054d71c9e1b7c6ac43286a166'
         'SKIP'
         '286c545efadcc7b463eb603c25473cb4'
         '9dfa2f649a2c83a2e52f5f89dec3b167'
         'cc90c234aac9098c5132d653037d5269'
         '67d0ada0f3000b9a86351798786c5256'
         '6e2569ef339838aa41375e913a8e19ce'
         '260f5fcf9b53ef201a8fb34e7ea90457'
         'af6571185d6a6a6e1f070c7be0e4333a'
         'b6e3549d780355914ae8edd43e15630a'
         '72dd63c49fdaea41729a4318d0fbac79'
         '577f1e7caeea31d910f2dc29c28ada7d')

prepare() {
  cd $pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      msg2 "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/quagga \
    --localstatedir=/run/quagga \
    --enable-exampledir=/usr/share/doc/quagga/examples \
    --enable-vtysh \
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
  install -d -m 755 "$pkgdir"/usr/lib/{systemd/system,tmpfiles.d,sysusers.d}
  for _d in zebra ripd ripngd bgpd ospfd ospf6d isisd pimd; do
    install -D -m 644 $_d.service "$pkgdir/usr/lib/systemd/system/$_d.service"
  done
  install -D -m 644 $pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -D -m 644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

# vim:set ts=2 sw=2 et:
