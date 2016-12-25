# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Filip Dvorak <fila@pruda.com>
# Contributor: 3ED_0 (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname=firehol
pkgver=3.1.0
pkgrel=2
epoch=2
pkgdesc="The iptables stateful packet filtering firewall builder."
url="http://firehol.sourceforge.net"
arch=('any')
license=('GPL')
depends=('iptables' 'gawk' 'iproute' 'iprange' 'ipset' 'traceroute')
backup=('etc/firehol/firehol.conf' 'etc/firehol/fireqos.conf')
install='firehol.install'
source=("http://firehol.org/download/firehol/releases/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "firehol.service"
        "fireqos.service")

build() {
  cd "$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib
  
  make
}

package() {
  cd "$pkgname-$pkgver"

  make install DESTDIR="$pkgdir"

  install -d -m755 "$pkgdir"/usr/lib/systemd/system/
  install -m644 "$srcdir"/fire{hol,qos}.service "$pkgdir"/usr/lib/systemd/system/

  touch "$pkgdir"/etc/firehol/fire{hol,qos}.conf

  # https://github.com/firehol/firehol/issues/178
  rm "$pkgdir/usr/bin/"{vnetbuild,update-ipsets,fireqos,link-balancer,firehol}
  ln -s "/usr/lib/firehol/3.1.0/vnetbuild" "$pkgdir/usr/bin/vnetbuild"
  ln -s "/usr/lib/firehol/3.1.0/update-ipsets" "$pkgdir/usr/bin/update-ipsets"
  ln -s "/usr/lib/firehol/3.1.0/fireqos" "$pkgdir/usr/bin/fireqos"
  ln -s "/usr/lib/firehol/3.1.0/link-balancer" "$pkgdir/usr/bin/link-balancer"
  ln -s "/usr/lib/firehol/3.1.0/firehol" "$pkgdir/usr/bin/firehol"
  
}

md5sums=('9699af31c453fa100c4d729d90b9f293'
         '6c6571af548273e1f172313e366532df'
         'ae9fc18b19a69149108e9f4ab9ba5de9')
