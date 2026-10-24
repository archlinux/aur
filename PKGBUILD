# Contributor: Elis Hughes <elishughes@googlemail.com>
# Contributor: djerome <jerome _at_ j2ze dot org>
# Contributor: zeppelinlg <zeppelinlg@gmail.com>
# Contributor: dncrash <dncrash@gmail.com>
# Maintainer: mhaquila
# Co-Maintainer: executter

pkgname=ocsinventory-agent
pkgver=2.10.4
pkgrel=1
pkgdesc="Hardware and software inventory tool (client)"
arch=('any')
url="http://www.ocsinventory-ng.org"
license=('GPL')
depends=('dmidecode' 'pciutils' 'perl-crypt-ssleay' 'perl-xml-sax'
     'perl-libwww' 'perl-net-ip' 'perl-xml-namespacesupport' 'perl-xml-simple'
     'perl-proc-daemon' 'perl-proc-pid-file' 'perl-net-ssleay' 'perl-net-snmp')
optdepends=('smartmontools')
makedepends=('perl-module-install')
install=${pkgname}.install
backup=('etc/ocsinventory/ocsinventory-agent.cfg')
source=("https://github.com/OCSInventory-NG/UnixAgent/releases/download/v${pkgver}/Ocsinventory-Unix-Agent-${pkgver}.tar.gz"
    "modules.conf" "ocsinventory-agent" "ocsinventory-agent.cfg")
sha256sums=('5aa171c48a21db8dc17e96b7e4d5a80cdbd30979c963a654b6974b8bb1e0efe1'
     'c82b7e18cb2bdfa3d35170d1a50df74aae599b4ca766e866afea03735c73a773'
     'f6c1723c9e6c3a480396395e3865fb29465bc6091ee7e4eea3b6dec13b5331ee'
     '96708ef480c0ec7ba58bc4e9e2074ee3f133965e3c378dca3281aef18cb202b1')

build() {
  cd "$srcdir/Ocsinventory-Unix-Agent-$pkgver"

  sed -i "s/require 'lib\/Ocsinventory\/Agent\/Config.pm';/require '.\/lib\/Ocsinventory\/Agent\/Config.pm';/g" Makefile.PL

  perl Makefile.PL
  make || return 1
  rm run-postinst
}

package() {
  mkdir -p ${pkgdir}/var/lib/ocsinventory-agent
  mkdir -p ${pkgdir}/var/log/ocsinventory-agent

  cd "$srcdir/Ocsinventory-Unix-Agent-$pkgver"

  make DESTDIR=${pkgdir} install

  /usr/bin/find ${pkgdir} -name '.packlist' -delete
  /usr/bin/find ${pkgdir} -name '*.pod' -delete

  cd "$srcdir"
  install -D -m644 ocsinventory-agent.cfg "${pkgdir}/etc/ocsinventory/ocsinventory-agent.cfg"
  install -D -m644 modules.conf "${pkgdir}/etc/ocsinventory/modules.conf"
  install -D -m744 -D ocsinventory-agent "${pkgdir}/etc/cron.d/ocsinventory-agent"

  cd "$srcdir/Ocsinventory-Unix-Agent-$pkgver"
  install -D -m755 ocsinventory-agent "${pkgdir}"/usr/bin/ocsinventory-agent
}
