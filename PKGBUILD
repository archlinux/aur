# Maintainer: jerosch <jeroch@users.noreply.github.com>
pkgname=gnome-shell-extension-ufw-switcher
pkgver=1.0.0
pkgrel=1
pkgdesc="Toggle the ufw firewall and switch between location profiles (Home/Office/Public) from GNOME Quick Settings"
arch=('any')
url="https://github.com/jerosch/gnome-ufw-switcher"
license=('GPL-2.0-or-later')
depends=('gnome-shell' 'ufw' 'python-gobject' 'polkit')
makedepends=('glib2' 'gettext')
optdepends=('gufw: graphical firewall configuration')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c516c5906c1274cfb47dd144d11a5100ac4a198074ee6e88b1c1f0356b5fbde0')
install="${pkgname}.install"

build() {
  cd "${srcdir}/gnome-ufw-switcher-${pkgver}"
  make build
}

package() {
  cd "${srcdir}/gnome-ufw-switcher-${pkgver}"

  # GNOME Shell extension (system-wide)
  local ext_dir="${pkgdir}/usr/share/gnome-shell/extensions/ufw-switcher@jerosch.github.io"
  install -d "${ext_dir}"
  cp -r build/. "${ext_dir}/"

  # Privileged helper daemon (D-Bus service, PolicyKit-guarded)
  install -d "${pkgdir}/usr/lib/gnome-ufw-switcher"
  install -m 0755 daemon/ufw_switcherd.py "${pkgdir}/usr/lib/gnome-ufw-switcher/"
  install -d "${pkgdir}/usr/share/dbus-1/system.d"
  install -m 0644 daemon/org.gnome.UfwSwitcher.conf "${pkgdir}/usr/share/dbus-1/system.d/"
  install -d "${pkgdir}/usr/share/polkit-1/actions"
  install -m 0644 daemon/org.gnome.ufw-switcher.policy "${pkgdir}/usr/share/polkit-1/actions/"
  install -d "${pkgdir}/usr/lib/systemd/system"
  install -m 0644 daemon/gnome-ufw-switcherd.service "${pkgdir}/usr/lib/systemd/system/"

  # Preferences launcher
  install -d "${pkgdir}/usr/share/applications"
  sed 's/@UUID@/ufw-switcher@jerosch.github.io/g' \
      dist/ufw-switcher-prefs.desktop.in \
      > "${pkgdir}/usr/share/applications/ufw-switcher-prefs.desktop"
}
