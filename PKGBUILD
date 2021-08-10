# Maintainer: Mads Mogensen <mads256h at gmail dot com>
# Contributor: Alice Ryhl <alice at ryhl dot io>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>

# Based on Alice Ryhls maple2019 package

# A valid license to Maple is required and you must have the installer ready.

pkgname=maple2021
pkgver=latest
pkgrel=1
pkgdesc="A commercial computer algebra system developed and sold commercially by Maplesoft. Version 2021."
arch=('x86_64')
url=https://www.maplesoft.com/download/
license=('custom')
depends=('ld-lsb')
conflicts=(maple18 maple2019 maple2020)
options=(!strip)
install='maple2021.install'
source=(maple2021.desktop Maplesoft-x-maple-worksheet.xml local://Maple2021.1LinuxX64Installer.run)
sha256sums=('f5dc3735d44e7db229a73d60752932fc86160c06e5d67e5d50bbfe9ca45ecf52'
            'e29ded05d8cda39ae2c8dd2b204c3b47e5c432d75d8e2bde3ddae0b71136b643'
            'SKIP')

build() {
  echo "Unpacking installer... If the installation fails make sure your /tmp directory is not full"
  "${srcdir}/Maple2021.1LinuxX64Installer.run" --mode unattended --installdir "${srcdir}/maple2021" --desktopshortcut 0 --defaultapp 0
}

package () {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/licenses/maple2021/"
  install -D -m755 "${srcdir}/maple2021.desktop" "${pkgdir}/usr/share/applications/maple2021.desktop"
  install -D -m755 "${srcdir}/Maplesoft-x-maple-worksheet.xml" "${pkgdir}/usr/share/mime/packages/Maplesoft-x-maple-worksheet.xml"

  cp -r "${srcdir}/maple2021/man" "${pkgdir}/usr/share/"
  cp -r "${srcdir}/maple2021" "${pkgdir}/usr/share/"

  ln -s "/usr/share/maple2021/bin/maple" "${pkgdir}/usr/bin/maple"
  ln -s "/usr/share/maple2021/bin/xmaple" "${pkgdir}/usr/bin/xmaple"
  ln -s "/usr/share/maple2021/bin/maple.system.type" "${pkgdir}/usr/bin/maple.system.type"
  ln -s "/usr/share/maple2021/bin/mint" "${pkgdir}/usr/bin/mint"
  ln -s "/usr/share/maple2021/EULA.html" "${pkgdir}/usr/share/licenses/maple2021/LICENSE.html"

  find "${pkgdir}/" -name "*.log" -delete
  find "${pkgdir}/" -type f -exec sed -i "s|${srcdir}|/usr/share|g" {} \;
}

