# Contributor: Elis Hughes <elishughes@googlemail.com>
# Contributor: djerome <jerome _at_ j2ze dot org>
# Contributor: zeppelinlg <zeppelinlg@gmail.com>
# Contributor: dncrash <dncrash@gmail.com>
# Maintainer: mhaquila
# Co-Maintainer: executter

pkgname=ocsinventory-agent
pkgver=2.10.5
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
    "ocsinventory-agent" "ocsinventory-agent.cfg"
    "ocsinventory-agent.service" "ocsinventory-agent.timer")
sha256sums=('477835b3813df4f6e222df5288d8830f838a5a1dbd2914c7d5f89790023fb9c6'
     '71aaa77f9c99f86a11fcedcc6cf8c7f78afa953d877561b36685d06036c098d7'
     '96708ef480c0ec7ba58bc4e9e2074ee3f133965e3c378dca3281aef18cb202b1'
     'b5cddb343e940907c2f785973264c6f60c2b4013f3eb393a9ddfa1597b515f55'
     'dff1030d95bc55188c219b354bdf1aa5a31b6e7377475ba8f171704ea0caae43')

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
  install -D -m644 ocsinventory-agent.service "${pkgdir}/usr/lib/systemd/system/ocsinventory-agent.service"
  install -D -m644 ocsinventory-agent.timer "${pkgdir}/usr/lib/systemd/system/ocsinventory-agent.timer"
}
