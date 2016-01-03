# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Marc Schulte <bomba@nerdstube.de>

pkgbase=tlp-git
pkgname=('tlp-git' 'tlp-rdw-git')
pkgver=0.8.r34.788c4df
pkgrel=1
arch=('any')
url='http://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html'
license=('GPL2' 'GPL3')
makedepends=('git')
source=('tlp::git+https://github.com/linrunner/TLP.git'
        '0001-Fix-man-path.patch')
sha256sums=('SKIP'
            'f5a6e1d417fff03ca37a12e6203c2a53d0b266ceedc5ad21e51e57e686d601bf')

pkgver() {
  cd tlp

  tag='0.8'

  echo "$(git describe --tags | sed 's/-/.r/; s/-g/./')"
}

prepare() {
  cd tlp

  patch -Np1 -i ../0001-Fix-man-path.patch
}

package_tlp-git() {
  pkgdesc='Linux Advanced Power Management'
  depends=('hdparm' 'iw' 'pciutils' 'rfkill' 'usbutils' 'util-linux')
  optdepends=('acpi_call: Sandy Bridge and newer ThinkPad battery functions'
              'ethtool: Disable Wake On Lan'
              'lsb-release: Display LSB release version in tlp-stat'
              'smartmontools: Display S.M.A.R.T. data in tlp-stat'
              'tp_smapi: ThinkPad battery functions'
              'x86_energy_perf_policy: Set energy versus performance policy on x86 processors')
  provides=('tlp')
  conflicts=('laptop-mode-tools' 'pm-utils' 'tlp')
  backup=('etc/default/tlp')

  cd tlp

  export TLP_SBIN='/usr/bin'
  export TLP_ULIB='/usr/lib/udev'
  export TLP_SYSD='/usr/lib/systemd/system'
  export TLP_NO_INIT='1'
  export TLP_NO_PMUTILS='1'
  export TLP_WITH_SYSTEMD='1'

  make DESTDIR="${pkgdir}" install-tlp install-man
}

package_tlp-rdw-git() {
  pkgdesc='Linux Advanced Power Management - Radio Device Wizard'
  depends=('networkmanager' 'tlp')
  provides=('tlp-rdw')
  conflicts=('tlp-rdw')

  cd tlp

  make DESTDIR="${pkgdir}" install-rdw
}

# vim: ts=2 sw=2 et:
