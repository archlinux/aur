# $Id$
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Marc Schulte <bomba@nerdstube.de>
# Maintainer: Aaditya Bagga <aaditya_gnulinux@zoho.com>

pkgname=('tlp-pmu')
_pkgname=tlp
pkgver=0.8
pkgrel=1
pkgdesc='Advanced Power Management for Linux, with pm-utils support'
depends=('hdparm' 'iw' 'pciutils' 'rfkill' 'usbutils' 'util-linux' 'pm-utils')
optdepends=('acpi_call: Sandy Bridge and newer ThinkPad battery functions'
            'ethtool: Disable Wake On Lan'
            'lsb-release: Display LSB release version in tlp-stat'
            'smartmontools: Display S.M.A.R.T. data in tlp-stat'
            'tp_smapi: ThinkPad battery functions'
            'x86_energy_perf_policy: Set energy versus performance policy on x86 processors')
conflicts=('laptop-mode-tools' 'tlp')
provides=($_pkgname)
backup=('etc/default/tlp')
install=("$pkgname.install")
arch=('any')
url='http://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html'
license=('GPL2' 'GPL3')
source=("https://github.com/linrunner/TLP/archive/${pkgver}.tar.gz"
        'tlp-arch.patch')
sha256sums=('d5c0423fde7247cc519001caebd60e538ff5ef2be9456d2049303eef4da1aae3'
            'd62af086a8c97db354c2bb57d21f4a2b4faa8e60335d5994fad07698e67b4eba')

prepare() {
  cd TLP-${pkgver}

  patch -Np1 -i ../tlp-arch.patch
}

package() {

  cd TLP-${pkgver}

  export TLP_SBIN='/usr/bin'
  export TLP_ULIB='/usr/lib/udev'
  export TLP_NO_INIT='0'
  export TLP_NO_PMUTILS='0'
  export TLP_WITH_SYSTEMD='0'

  make DESTDIR="${pkgdir}" install-tlp

  install -dm 755 "${pkgdir}"/usr/share/man/man{1,8}
  install -m 644 man/*.1 "${pkgdir}"/usr/share/man/man1/
  install -m 644 man/*.8 "${pkgdir}"/usr/share/man/man8/
}

# vim: ts=2 sw=2 et:
