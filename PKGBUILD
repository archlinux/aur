# $Id$
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Marc Schulte <bomba@nerdstube.de>
# Maintainer: Aaditya Bagga <aaditya_gnulinux@zoho.com>

pkgname=('tlp-pmu')
_pkgname=tlp
pkgver=1.1
pkgrel=1
pkgdesc='Advanced Power Management for Linux, with pm-utils support'
depends=('hdparm' 'iw' 'pciutils' 'rfkill' 'usbutils' 'util-linux' 'pm-utils')
optdepends=('acpi_call: ThinkPad battery functions, Sandy Bridge and newer'
            'bash-completion: Bash completion'
            'ethtool: Disable Wake On Lan'
            'lsb-release: Display LSB release version in tlp-stat'
            'smartmontools: Display S.M.A.R.T. data in tlp-stat'
            'tp_smapi: ThinkPad battery functions'
            'x86_energy_perf_policy: Set energy versus performance policy on x86 processors'
            'openrc: for using openrc tlp service'
)
conflicts=('laptop-mode-tools' 'tlp')
provides=($_pkgname)
backup=('etc/default/tlp')
install="$pkgname.install"
arch=('any')
url='http://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html'
license=('GPL2' 'GPL3')
source=("https://github.com/linrunner/TLP/archive/${pkgver}.tar.gz"
        'https://github.com/dywisor/tlp-portage/raw/maint/app-laptop/tlp/files/tlp-init.openrc-r2')
sha256sums=('76e1a091eed1055f7af75f49621be51ed41b1e8f872eeb9506c0749060fd1019'
            'dd2a5bade0e904d685a6a8d0313cda6455820dd3bf634b424dac6ebb7c8334ff')

prepare() {
  sed -e 's/\/sbin\/openrc-run/\/usr\/bin\/openrc-run/' -e 's/\/usr\/sbin\/tlp/\/usr\/bin\/tlp/g' -i tlp-init.openrc-r2
}

package() {

  cd TLP-${pkgver}

  export TLP_SBIN='/usr/bin'
  export TLP_ULIB='/usr/lib/udev'
  export TLP_NO_INIT='0'
  export TLP_NO_PMUTILS='0'
  export TLP_WITH_SYSTEMD='0'

  make DESTDIR="${pkgdir}" install-tlp install-man

  # Move out tlp sysvinit service and replace it with the openrc one
  mv "${pkgdir}/etc/init.d/tlp" "${pkgdir}/etc/init.d/tlp.sysvinit"
  install -m 755 "${srcdir}/tlp-init.openrc-r2" "${pkgdir}/etc/init.d/tlp"
}

# vim: ts=2 sw=2 et:
