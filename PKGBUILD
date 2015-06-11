# Contributor: Elis Hughes <elishughes@googlemail.com>
# Contributor: djerome <jerome _at_ j2ze dot org>
# Maintainer: zeppelinlg <zeppelinlg@gmail.com>

pkgname=ocsinventory-agent
pkgver=2.1.1
pkgrel=1
pkgdesc="Hardware and software inventory tool (client)"
arch=('any')
url="http://www.ocsinventory-ng.org"
license=('GPL')
depends=('dmidecode' 'pciutils' 'perl-crypt-ssleay' 'perl-xml-sax'
         'perl-libwww' 'perl-net-ip' 'perl-xml-namespacesupport' 'perl-xml-simple'
         'perl-proc-daemon' 'perl-proc-pid-file' 'perl-net-ssleay')
optdepends=('smartmontools')
install=${pkgname}.install
backup=('etc/ocsinventory/ocsinventory-agent.cfg')
source=("https://launchpad.net/ocsinventory-unix-agent/stable-2.1/$pkgver/+download/Ocsinventory-Unix-Agent-$pkgver.tar.gz"
        "modules.conf" "ocsinventory-agent" "ocsinventory-agent.cfg")
md5sums=('195960e048bfa77badc2a3df382a5a88'
         'a2a8a3ee7018d5681403088dcd3d2c2e'
         '9419012794e5e134bc152cfd388d63e7'
         '3be05b06c7a6e269d9a4c74dcf239d19')

build() {
  cd "$srcdir/Ocsinventory-Unix-Agent-$pkgver"

  perl Makefile.PL
  make || return 1
  rm run-postinst
}

package() {
  mkdir -p ${pkgdir}/var/lib/ocsinventory-agent
  mkdir -p ${pkgdir}/var/log/ocsinventory-agent
  mkdir -p ${pkgdir}/var/run
  
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
