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
arch=('x86_64' 'aarch64')
url="http://www.ocsinventory-ng.org"
license=('GPL')
depends=('perl' 'which' 'dmidecode' 'pciutils'
     'perl-libwww' 'perl-lwp-protocol-https' 'perl-io-socket-ssl'
     'perl-net-ip' 'perl-xml-simple' 'perl-net-snmp')
optdepends=('perl-proc-daemon: daemon mode (--daemon)'
     'perl-proc-pid-file: prevent concurrent runs'
     'perl-edid: monitor inventory'
     'perl-net-netmask: SNMP network scan'
     'smartmontools: disk model, firmware and serial numbers'
     'ipmitool: BMC network interface inventory')
install=${pkgname}.install
backup=('etc/ocsinventory/ocsinventory-agent.cfg'
    'etc/ocsinventory/modules.conf'
    'etc/cron.d/ocsinventory-agent')
source=("https://github.com/OCSInventory-NG/UnixAgent/releases/download/v${pkgver}/Ocsinventory-Unix-Agent-${pkgver}.tar.gz"
    "ocsinventory-agent" "ocsinventory-agent.cfg")
sha256sums=('5aa171c48a21db8dc17e96b7e4d5a80cdbd30979c963a654b6974b8bb1e0efe1'
     'f6c1723c9e6c3a480396395e3865fb29465bc6091ee7e4eea3b6dec13b5331ee'
     '96708ef480c0ec7ba58bc4e9e2074ee3f133965e3c378dca3281aef18cb202b1')

build() {
  cd "$srcdir/Ocsinventory-Unix-Agent-$pkgver"

  sed -i "s/require 'lib\/Ocsinventory\/Agent\/Config.pm';/require '.\/lib\/Ocsinventory\/Agent\/Config.pm';/g" Makefile.PL

  # Scripts go to /usr/bin: ipdiscover must be in the PATH of cron and systemd
  perl Makefile.PL INSTALLDIRS=vendor INSTALLVENDORSCRIPT=/usr/bin
  make || return 1
  rm run-postinst
}

package() {
  mkdir -p ${pkgdir}/var/lib/ocsinventory-agent
  mkdir -p ${pkgdir}/var/log/ocsinventory-agent

  cd "$srcdir/Ocsinventory-Unix-Agent-$pkgver"

  make DESTDIR=${pkgdir} install
  # Installed read-only, which prevents makepkg from stripping it
  chmod 755 "${pkgdir}/usr/bin/ipdiscover"

  /usr/bin/find ${pkgdir} -name '.packlist' -delete
  /usr/bin/find ${pkgdir} -name '*.pod' -delete

  install -D -m644 etc/ocsinventory-agent/modules.conf "${pkgdir}/etc/ocsinventory/modules.conf"

  cd "$srcdir"
  install -D -m644 ocsinventory-agent.cfg "${pkgdir}/etc/ocsinventory/ocsinventory-agent.cfg"
  install -D -m744 -D ocsinventory-agent "${pkgdir}/etc/cron.d/ocsinventory-agent"
}
