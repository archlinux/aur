# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Marc Schulte <bomba@nerdstube.de>

pkgbase=tlp-git
pkgname=(
  tlp-git
  tlp-pd-git
  tlp-rdw-git
)
pkgver=1.9.0.r3.380d1bb
pkgrel=1
arch=(any)
url=https://linrunner.de/en/tlp/tlp.html
license=('GPL-2.0-or-later AND GPL-3.0-only')
makedepends=(git)
source=(git+https://github.com/linrunner/TLP.git)
sha256sums=(SKIP)
install=tlp.install

pkgver() {
  cd TLP

  git describe --tags | sed 's/[–-]alpha./.a/; s/[–-]beta./.b/; s/-/.r/; s/-g/./'
}

package_tlp-git() {
  pkgdesc='Optimize laptop battery life'
  depends=(
    bash
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
    'tlp-pd: Switch power profiles from the desktop'
    'tlp-rdw: Switch wifi and bluetooth on/off automatically'
    'tp_smapi: Older ThinkPad battery functions (before Sandy Bridge)'
  )
  provides=(tlp)
  conflicts=(
    laptop-mode-tools
    pm-utils
    tlp
    tuned
  )
  backup=(etc/tlp.conf)

  export TLP_NO_INIT=1
  export TLP_SBIN=/usr/bin
  export TLP_WITH_ELOGIND=0

  make DESTDIR="${pkgdir}" -C TLP install-tlp install-man-tlp
}

package_tlp-pd-git() {
  pkgdesc='Switch power profiles from the desktop'
  depends=(
    glib2
    polkit
    python
    python-dbus
    python-gobject
    tlp
  )
  provides=(
    power-profiles-daemon
    tlp-pd
  )
  conflicts=(
    power-profiles-daemon
    tlp-pd
    tuned-ppd
  )

  export TLP_SBIN=/usr/bin

  make DESTDIR="${pkgdir}" -C TLP install-pd install-man-pd
}

package_tlp-rdw-git() {
  pkgdesc='Switch wifi and bluetooth on/off automatically'
  depends=(
    bash
    networkmanager
    tlp
  )
  provides=(tlp-rdw)
  conflicts=(tlp-rdw)

  make DESTDIR="${pkgdir}" -C TLP install-rdw install-man-rdw
}

# vim: ts=2 sw=2 et:
