# Maintainer: Kendoo285 <mathias.rittweger@proton.me>
pkgname=deskreen-ce-bin-next
pkgver=3.1.25
pkgrel=1
pkgdesc="Turn any device into a secondary screen for your computer - Community Edition (binary release, NEXT-branch maintainer)"
arch=('x86_64')
url="https://github.com"
license=("AGPL-3.0-only")
depends=('avahi' 'gtk3' 'libseccomp' 'nss' 'sqlite' 'systemd-libs' 'hicolor-icon-theme')
provides=('deskreen' 'deskreen-ce' 'deskreen-ce-bin')
conflicts=('deskreen' 'deskreen-bin' 'deskreen-ce' 'deskreen-ce-bin')
options=('!strip')

# Funktionierender SourceForge Mirror-Link für das originale 3.1.25 .deb
source_x86_64=("deskreen-ce-3.1.25-amd64.deb::https://sourceforge.net")
sha256sums_x86_64=('a1a7a0d8b0b2098987edff91ad1688b9e01ad8af4dba9a8ae8152d0ba2c766d1')

package() {
  # Makepkg entpackt das .deb Paket automatisch in ${srcdir}.
  # Wir wechseln dorthin, um die Struktur zu kopieren.
  cd "${srcdir}"

  # 1. Kopiere die entpackten Systemordner direkt ins Paket-Zielverzeichnis
  if [ -d opt ]; then
    cp -r opt "${pkgdir}/"
  fi

  if [ -d usr ]; then
    cp -r usr "${pkgdir}/"
  fi

  # 2. Erstelle das globale System-Binärverzeichnis, falls noch nicht existent
  install -d "${pkgdir}/usr/bin"

  # 3. Setze den symbolischen Link auf die ausführbare Datei im opt-Verzeichnis
  ln -sf "/opt/deskreen-ce/deskreen-ce" "${pkgdir}/usr/bin/deskreen-ce"

  # 4. Überschreibe den alten Starter mit unserem fixen, sauberen Pfad
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

  # 5. Setze korrekte Berechtigungen für den Starter
  chmod 644 "${pkgdir}/usr/share/applications/deskreen-ce.desktop"
}
