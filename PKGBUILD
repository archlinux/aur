# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Marc Schulte <bomba@nerdstube.de>

pkgbase=tlp-git
pkgname=('tlp-git' 'tlp-rdw-git')
pkgver=0.7.r1.3409912
pkgrel=1
arch=('any')
url='http://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html'
license=('GPL2' 'GPL3')
makedepends=('git')
source=('tlp::git+https://github.com/linrunner/TLP.git#branch=devel'
        'tlp-arch.patch')
sha256sums=('SKIP'
            '836a07ebb222d7d696ac33d8596a9b129debb70793bb4dbb6283ce8311ea303c')

pkgver() {
  cd tlp

  tag='0.7'

  echo "${tag}.r$(git rev-list --count ${tag}..HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd tlp

  patch -Np1 -i ../tlp-arch.patch
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

  make DESTDIR="${pkgdir}" install-tlp

  install -dm 755 "${pkgdir}"/usr/share/man/man{1,8}
  install -m 644 man/*.1 "${pkgdir}"/usr/share/man/man1/
  install -m 644 man/*.8 "${pkgdir}"/usr/share/man/man8/
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
