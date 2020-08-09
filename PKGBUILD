# Maintainer: Mads Mogensen <mads256h at gmail dot com>
# Contributor: Alice Ryhl <alice at ryhl dot io>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>

# Based on Alice Ryhls maple2019 package

# A valid license to Maple is required and you must have the installer ready.

pkgname=maple2020
pkgver=latest
pkgrel=3
pkgdesc="A commercial computer algebra system developed and sold commercially by Maplesoft. Version 2020."
arch=('x86_64')
url=https://www.maplesoft.com/download/
license=('custom')
depends=('ld-lsb')
conflicts=(maple18 maple2019)
options=(!strip)
install='maple2020.install'
source=(maple2020.desktop Maplesoft-x-maple-worksheet.xml local://Maple2020.1LinuxX64Installer.run)
sha256sums=('e4cff7025bd62f66b8d2d361da87b2772c5eb86efa985cf286b5b48c02b6bfff'
            'e29ded05d8cda39ae2c8dd2b204c3b47e5c432d75d8e2bde3ddae0b71136b643'
            'SKIP')

build() {
  echo "Unpacking installer... If the installation fails make sure your /tmp directory is not full"
  "${srcdir}/Maple2020.1LinuxX64Installer.run" --mode unattended --installdir "${srcdir}/maple2020" --desktopshortcut 0 --defaultapp 0
}

package () {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/licenses/maple2020/"
  install -D -m755 "${srcdir}/maple2020.desktop" "${pkgdir}/usr/share/applications/maple2020.desktop"
  install -D -m755 "${srcdir}/Maplesoft-x-maple-worksheet.xml" "${pkgdir}/usr/share/mime/packages/Maplesoft-x-maple-worksheet.xml"

  cp -r "${srcdir}/maple2020/man" "${pkgdir}/usr/share/"
  cp -r "${srcdir}/maple2020" "${pkgdir}/usr/share/"

  ln -s "/usr/share/maple2020/bin/maple" "${pkgdir}/usr/bin/maple"
  ln -s "/usr/share/maple2020/bin/xmaple" "${pkgdir}/usr/bin/xmaple"
  ln -s "/usr/share/maple2020/bin/maple.system.type" "${pkgdir}/usr/bin/maple.system.type"
  ln -s "/usr/share/maple2020/bin/mint" "${pkgdir}/usr/bin/mint"
  ln -s "/usr/share/maple2020/EULA.html" "${pkgdir}/usr/share/licenses/maple2020/LICENSE.html"

  find "${pkgdir}/" -name "*.log" -delete
  find "${pkgdir}/" -type f -exec sed -i "s|${srcdir}|/usr/share|g" {} \;
}

