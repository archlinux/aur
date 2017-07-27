# $Id: PKGBUILD 280689 2016-11-14 07:42:25Z bpiotrowski $
# Maintainer: Sébastien Luttringer

pkgname=quagga-fpm
_pkgname=quagga
pkgver=1.2.1
pkgrel=1
pkgdesc='BGP/OSPF/ISIS/RIP/RIPNG routing daemon suite (FPM enabled)'
arch=('i686' 'x86_64')
url='http://www.quagga.net'
license=('GPL2')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
depends=('libcap' 'libnl' 'net-snmp' 'readline' 'ncurses' 'perl' 'c-ares' 'openssl')
options=('!buildflags')
install=quagga.install
validpgpkeys=('C1B5C3ED3000F2BFCD66F3B76FE57CA8C1A4AEA6') # Quagga Release Signing Key
source=("https://download.savannah.gnu.org/releases/$_pkgname/$_pkgname-$pkgver.tar.gz"{,.asc}
        'quagga.sysusers'
        'quagga.tmpfiles'
        'babeld.service'
        'bgpd.service'
        'isisd.service'
        'ospf6d.service'
        'ospfd.service'
        'pimd.service'
        'ripd.service'
        'ripngd.service'
        'zebra.service')
md5sums=('b1546de89062f7070d56e780b30be4b1'
         'SKIP'
         '286c545efadcc7b463eb603c25473cb4'
         '9dfa2f649a2c83a2e52f5f89dec3b167'
         '20a8e36ad851d4e06467aeb56a84b245'
         'cc90c234aac9098c5132d653037d5269'
         '67d0ada0f3000b9a86351798786c5256'
         '6e2569ef339838aa41375e913a8e19ce'
         '260f5fcf9b53ef201a8fb34e7ea90457'
         'af6571185d6a6a6e1f070c7be0e4333a'
         'b6e3549d780355914ae8edd43e15630a'
         '72dd63c49fdaea41729a4318d0fbac79'
         '577f1e7caeea31d910f2dc29c28ada7d')

prepare() {
  cd $_pkgname-$pkgver
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
  cd $_pkgname-$pkgver
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
    --enable-logfile-mask=0640 \
    --enable-fpm
  make
}

package() {
  # upstream install
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # logrotate stuff
  install -D -m 644 redhat/$_pkgname.logrotate "$pkgdir/etc/logrotate.d/$_pkgname"
  sed -ri 's,/var/run/quagga,/run/quagga,g' "$pkgdir/etc/logrotate.d/$_pkgname"

  # systemd
  cd "$srcdir"
  install -d -m 755 "$pkgdir"/usr/lib/{systemd/system,tmpfiles.d,sysusers.d}
  for _d in zebra ripd ripngd bgpd ospfd ospf6d isisd babeld pimd; do
    install -D -m 644 $_d.service "$pkgdir/usr/lib/systemd/system/$_d.service"
  done
  install -D -m 644 $_pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -D -m 644 $_pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
}

# vim:set ts=2 sw=2 et:
