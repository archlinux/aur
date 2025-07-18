# Maintainer: Geyslan G. Bem <geyslan@gmail.com>
# Maintainer: Pedro Henrique Quitete Barreto <pedrohqb@gmail.com>

pkgname=pje-office
pkgver=2.5.16u
pkgrel=6
pkgdesc="PJeOffice is a software made available by CNJ for electronic signing PJe system's documents"
arch=('any')
url='https://pjeoffice.trf3.jus.br'
license=('custom')
options=(!debug)
depends=('jre11-openjdk' 'bash')
makedepends=('unzip')
source=("https://pje-office.pje.jus.br/pro/pjeoffice-pro-v${pkgver}-linux_x64.zip")
sha256sums=('6087391759c7cba11fb5ef815fe8be91713b46a8607c12eb664a9d9a6882c4c7')

prepare() {
  # Extract the archive first
  bsdtar -xf "${srcdir}/pjeoffice-pro-v${pkgver}-linux_x64.zip" -C "${srcdir}"

  # Remove the bundled JRE
  rm -rf "${srcdir}/pjeoffice-pro/jre"

  # Remove not applicable README file
  rm -rf "${srcdir}/pjeoffice-pro/LEIA-ME.TXT"

  # Create the target directory structure within srcdir before moving files
  install -d "${srcdir}/usr/share/"

  # Move the extracted content to its final location within srcdir
  mv "${srcdir}/pjeoffice-pro" "${srcdir}/usr/share/"

  # Remove .gitignore from the moved directory
  rm -f "${srcdir}/usr/share/pjeoffice-pro/.gitignore"

  # Now create the launch script inside the moved directory
  install -Dm775 /dev/null "${srcdir}/usr/share/pjeoffice-pro/pjeoffice-pro.sh"
  cat << EOF > "${srcdir}/usr/share/pjeoffice-pro/pjeoffice-pro.sh"
#!/bin/bash
# PJeOffice CLEAN script

echo "Iniciando o PJeOffice!"

exec /usr/lib/jvm/java-11-openjdk/bin/java \
-XX:+UseG1GC \
-XX:MinHeapFreeRatio=3 \
-XX:MaxHeapFreeRatio=3 \
-Xms20m \
-Xmx2048m \
-Dpjeoffice_home="/usr/share/pjeoffice-pro/" \
-Dffmpeg_home="/usr/share/pjeoffice-pro/" \
-Dpjeoffice_looksandfeels="Metal" \
-Dcutplayer4j_looksandfeels="Nimbus" \
-jar \
/usr/share/pjeoffice-pro/pjeoffice-pro.jar
EOF

  # Extract the 512x512 icon directly to a temporary location
  unzip -p "${srcdir}/usr/share/pjeoffice-pro/pjeoffice-pro.jar" 'images/pje-icon-pje-feather.png' > "${srcdir}/pjeoffice.png"

  # Create the .desktop file inside the moved directory
  install -Dm644 /dev/null "${srcdir}/usr/share/pjeoffice-pro/pje-office.desktop"
  cat << EOF > "${srcdir}/usr/share/pjeoffice-pro/pje-office.desktop"
[Desktop Entry]
Encoding=UTF-8
Name=PJeOffice
GenericName=PJeOffice
Exec=/usr/bin/pjeoffice-pro
Type=Application
Terminal=false
Categories=Office;
Comment=PJeOffice
Icon=pjeoffice
EOF
}

package() {
  # Copy the prepared 'usr' directory to the package root
  cp -R "${srcdir}/usr/" "${pkgdir}/"

  # Install the 512x512 PNG icon to the correct hicolor directory
  install -Dm644 "${srcdir}/pjeoffice.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/pjeoffice.png"

  # Create symbolic links to the executable and desktop file
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/pjeoffice-pro/pjeoffice-pro.sh" "${pkgdir}/usr/bin/pjeoffice-pro"

  install -d "${pkgdir}/usr/share/applications"
  ln -s "/usr/share/pjeoffice-pro/pje-office.desktop" "${pkgdir}/usr/share/applications/pje-office.desktop"

  # Make ffmpeg.exe executable
  chmod +x "${pkgdir}/usr/share/pjeoffice-pro/ffmpeg.exe"
}
