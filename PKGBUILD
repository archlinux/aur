# Maintainers: arraen, thadah
pkgname="synergy3-bin"
pkgver="3.3.0"
pkgrel="2"
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="https://symless.com/synergy"
license=('unknown')
arch=("x86_64")
source_x86_64=("https://symless.com/synergy/synergy/api/download/synergy-$pkgver-linux-noble-x64.deb")
sha256sums_x86_64=("927441a6fa20c58cdc6387f62ecdfb53909796cb3b0c36e1a79abe2ede905443")

conflicts=('synergy' 'synergy1-bin' 'synergy-git' 'synergy-1.6' 'synergy2-bin' 'synergy3-bin' 'synergy3-beta-bin')
depends=('openssl' 'alsa-lib' 'libei' 'libnotify' 'nss' 'qt6-base' 'libxkbfile' 'libappindicator-gtk3' 'libayatana-appindicator' 'pugixml')
optdepends=()
options=("!strip")

package() {
  bsdtar -xf "${srcdir}/data.tar.bz2" -C "${pkgdir}/"

  # Install binaries and create symlinks
  mkdir -p "${pkgdir}/usr/bin"
  ln -s /opt/Synergy/synergys "${pkgdir}/usr/bin/synergys"
  ln -s /opt/Synergy/synergyc "${pkgdir}/usr/bin/synergyc"
  ln -s /opt/Synergy/synergy-core "${pkgdir}/usr/bin/synergy-core"

  # Install the user service and enable it.
  mkdir -p "${pkgdir}/etc/systemd/user/graphical-session.target.wants"
  cp "${pkgdir}/opt/Synergy/resources/services/global/synergy.service" "${pkgdir}/etc/systemd/user/"
  ln -s /etc/systemd/user/synergy.service "${pkgdir}/etc/systemd/user/graphical-session.target.wants/synergy.service"

  # Install the login service into the system unit directory (disabled).
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  cp "${pkgdir}/opt/Synergy/resources/services/system/synergy.service" "${pkgdir}/usr/lib/systemd/system/"

  chmod 4755 "${pkgdir}/opt/Synergy/chrome-sandbox" || true
}

post_install() {
  update-mime-database /usr/share/mime || true
  update-desktop-database /usr/share/applications || true
}

post_remove() {
  rm -f '/usr/bin/synergys'
  rm -f '/usr/bin/synergyc'
  rm -f '/usr/bin/synergy-core'
  rm -f '/etc/systemd/user/synergy.service'
  rm -f '/usr/lib/systemd/system/synergy.service'
}
