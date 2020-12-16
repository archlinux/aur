# Contributor: Elis Hughes <elishughes@googlemail.com>
# Contributor: djerome <jerome _at_ j2ze dot org>
# Maintainer: dncrash <dncrash@gmail.com>

pkgname=ocsinventory-agent
pkgver=2.8.1
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
source=("https://github.com/OCSInventory-NG/UnixAgent/releases/download/v2.8.1/Ocsinventory-Unix-Agent-2.8.1.tar.gz"
    "modules.conf" "ocsinventory-agent" "ocsinventory-agent.cfg")
md5sums=('c1218e871132b43d6901894f315e7f78'
     '3c1235643decce6f1a29c5644d2b527b'
     '9419012794e5e134bc152cfd388d63e7'
     '3be05b06c7a6e269d9a4c74dcf239d19')

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
