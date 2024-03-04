# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Marc Schulte <bomba@nerdstube.de>

pkgbase=tlp-ppd-git
pkgname=(
  tlp-ppd-git
#  tlp-rdw-git
)
pkgver=1.6.1.r67.3a12e12
pkgrel=1
arch=(any)
url=https://linrunner.de/en/tlp/tlp.html
license=(GPL2)
makedepends=(git)
source=(git+https://github.com/linrunner/TLP.git
        ignore-pdd.patch
       )
sha256sums=('SKIP'
            '8cd7136d79e8543d3af2bd5e59ae826f3c1b523112b5a8824086dcd429637886')
install=tlp.install

pkgver() {
  cd TLP

  git describe --tags | sed 's/[–-]alpha./.a/; s/[–-]beta./.b/; s/-/.r/; s/-g/./'
}

package_tlp-ppd-git() {
  pkgdesc='Linux Advanced Power Management (Works with power-profile-daemon)'
  depends=(
    hdparm
    iw
    pciutils
    perl
    rfkill
    usbutils
    util-linux
  )
  optdepends=(
    'bash-completion: Bash completion'
    'ethtool: Disable Wake On Lan'
    'smartmontools: Display S.M.A.R.T. data in tlp-stat'
    'tp_smapi: ThinkPad battery functions'
  )
  provides=(tlp)
  conflicts=(
    laptop-mode-tools
    pm-utils
#    power-profiles-daemon
    tlp
  )
  backup=(etc/tlp.conf)

  export TLP_NO_INIT=1
  export TLP_SBIN=/usr/bin
  export TLP_SDSL=/usr/lib/systemd/system-sleep
  export TLP_SYSD=/usr/lib/systemd/system
  export TLP_ULIB=/usr/lib/udev
  export TLP_WITH_ELOGIND=0
  export TLP_WITH_SYSTEMD=1

  cd "${srcdir}/TLP"
  patch -Np1 < ../ignore-pdd.patch

  cd "${srcdir}"
  make DESTDIR="${pkgdir}" -C TLP install-tlp install-man-tlp
}

package_tlp-rdw-git() {
  pkgdesc='Linux Advanced Power Management - Radio Device Wizard'
  depends=(
    networkmanager
    tlp
  )
  provides=(tlp-rdw)
  conflicts=(tlp-rdw)

  make DESTDIR="${pkgdir}" -C TLP install-rdw install-man-rdw
}

# vim: ts=2 sw=2 et:
