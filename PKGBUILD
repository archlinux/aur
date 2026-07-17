# Maintainer: Kendoo285 <mathias.rittweger@proton.me>
pkgname=deskreen-ce-bin-next
pkgver=3.1.25
pkgrel=1
pkgdesc="Turn any device into a secondary screen for your computer - Community Edition (binary release, NEXT-branch maintainer)"
arch=('x86_64')
url="https://github.com/pavlobu/deskreen"
license=('AGPL-3.0-only')
depends=('avahi' 'gtk3' 'libseccomp' 'nss' 'sqlite' 'systemd-libs' 'hicolor-icon-theme')
provides=('deskreen' 'deskreen-ce' 'deskreen-ce-bin')
conflicts=('deskreen' 'deskreen-bin' 'deskreen-ce' 'deskreen-ce-bin')
options=('!strip')

# Direkter, funktionierender SourceForge Mirror-Link für das originale 3.1.25 .deb
source_x86_64=("deskreen-ce-3.1.25-amd64.deb::https://sourceforge.net")
sha256sums_x86_64=('a1a7a0d8b0b2098987edff91ad1688b9e01ad8af4dba9a8ae8152d0ba2c766d1')

package() {
  # 1. Entpacke die funktionierende Debian-Verzeichnisstruktur (usr/ und opt/)
  tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"

  # 2. Erstelle das globale System-Binärverzeichnis
  install -d "${pkgdir}/usr/bin"

  # 3. WICHTIG: In Version 3.1.25 heißt der Ordner im deb-Paket "deskreen-ce" (kleingeschrieben)!
  # Das war der Grund, warum der Starter vorhin ins Leere lief!
  ln -sf "/opt/deskreen-ce/deskreen-ce" "${pkgdir}/usr/bin/deskreen-ce"

  # 4. Erzwinge das Neuschreiben des Starters, damit der Pfad garantiert stimmt
  rm -f "${pkgdir}/usr/share/applications/"*.desktop
  install -d "${pkgdir}/usr/share/applications"
  cat <<EOF >"${pkgdir}/usr/share/applications/deskreen-ce.desktop"
[Desktop Entry]
Name=Deskreen CE
Comment=Turn any device into a secondary screen for your computer
Exec=/usr/bin/deskreen-ce
Icon=deskreen-ce
Terminal=false
Type=Application
Categories=Network;Utility;
EOF

  # 5. Setze Systemrechte für den Starter
  chmod 644 "${pkgdir}/usr/share/applications/deskreen-ce.desktop"
}
