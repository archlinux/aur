# Maintainer: Mads Mogensen <mads256h at gmail dot com>
# Contributor: Alice Ryhl <alice at ryhl dot io>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>

# Based on Alice Ryhls maple2019 package

# A valid license to Maple is required and you must have the installer ready.

pkgname=maple2024
pkgver=latest
pkgrel=1
pkgdesc="A commercial computer algebra system developed and sold commercially by Maplesoft. Version 2024."
arch=('x86_64')
url=https://www.maplesoft.com/download/
license=('custom')
depends=('ld-lsb')
conflicts=(maple18 maple2019 maple2020 maple2021 maple2023)
options=(!strip)
install='maple2024.install'
source=(maple2024.desktop Maplesoft-x-maple-worksheet.xml local://Maple2024.1LinuxX64Installer.run)
sha256sums=('507ceb084cb771afbdf480133f4fec7906426207648690f3998e90333743cb4b'
            'e29ded05d8cda39ae2c8dd2b204c3b47e5c432d75d8e2bde3ddae0b71136b643'
            'SKIP')

build() {
  echo "Unpacking installer... If the installation fails make sure your /tmp directory is not full"
  "${srcdir}/Maple2024.1LinuxX64Installer.run" --mode unattended --installdir "${srcdir}/maple2024" --desktopshortcut 0 --defaultapp 0 --enableUpdates 0 --checkForUpdatesNow 0
}

package () {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/licenses/maple2024/"
  install -D -m755 "${srcdir}/maple2024.desktop" "${pkgdir}/usr/share/applications/maple2024.desktop"
  install -D -m755 "${srcdir}/Maplesoft-x-maple-worksheet.xml" "${pkgdir}/usr/share/mime/packages/Maplesoft-x-maple-worksheet.xml"

  cp -r "${srcdir}/maple2024/man" "${pkgdir}/usr/share/"
  cp -r "${srcdir}/maple2024" "${pkgdir}/usr/share/"

  ln -s "/usr/share/maple2024/bin/maple" "${pkgdir}/usr/bin/maple"
  ln -s "/usr/share/maple2024/bin/xmaple" "${pkgdir}/usr/bin/xmaple"
  ln -s "/usr/share/maple2024/bin/maple.system.type" "${pkgdir}/usr/bin/maple.system.type"
  ln -s "/usr/share/maple2024/bin/mint" "${pkgdir}/usr/bin/mint"
  ln -s "/usr/share/maple2024/EULA.html" "${pkgdir}/usr/share/licenses/maple2024/LICENSE.html"

  find "${pkgdir}/" -name "*.log" -delete
  find "${pkgdir}/" -type f -exec sed -i "s|${srcdir}|/usr/share|g" {} \;
}

