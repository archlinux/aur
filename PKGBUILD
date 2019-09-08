# Maintainer: Alice Ryhl <alice at ryhl dot io>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>

# A valid license to Maple is required and you must have the installer ready.

pkgname=maple2019
pkgver=latest
pkgrel=1
pkgdesc="A commercial computer algebra system developed and sold commercially by Maplesoft.  Version 2019."
arch=('i686' 'x86_64')
url=https://www.maplesoft.com/download/
license=('custom')
depends=('ld-lsb')
conflicts=(maple18)
options=(!strip)
install='maple2019.install'
source=(maple2019.desktop Maplesoft-x-maple-worksheet.xml)
sha256sums=('62d6d6c4976e1c401a88094af373c07486963ca3507cf0c8fc45958c2dac460f'
            'e29ded05d8cda39ae2c8dd2b204c3b47e5c432d75d8e2bde3ddae0b71136b643')
PKGEXT='.pkg.tar' # XZ is too slow

if [[ $CARCH == 'x86_64' ]]; then
  _arch='X64'
elif [[ $CARCH == 'i686' ]]; then
  _arch='X86'
fi

build() {
  msg "Searching for installer in \"$startdir\"..."
  pkgpath="$startdir"

  if [[ ! -f "${pkgpath}/Maple2019.1Linux${_arch}Installer.run" ]]; then
    error "Maple 19 installer not found! Please type path to Maple2019.1Linux${_arch}Installer.run"
    read pkgpath
    if [[ ! -f "${pkgpath}/Maple2019.1Linux${_arch}Installer.run" ]]; then
      error "Unable to find Maple 19 installer! Aborting!"  && return 1
    fi
  fi

  msg "Found installer, unpacking..."
  "${pkgpath}/Maple2019.1Linux${_arch}Installer.run" --mode unattended --installdir ${srcdir}/maple2019 --desktopshortcut 0 --defaultapp 0
}

package () {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/licenses/maple2019/"
  install -D -m755 "${srcdir}/maple2019.desktop" "${pkgdir}/usr/share/applications/maple2019.desktop"
  install -D -m755 "${srcdir}/Maplesoft-x-maple-worksheet.xml" "${pkgdir}/usr/share/mime/packages/Maplesoft-x-maple-worksheet.xml"

  cp -r "${srcdir}/maple2019/man" "${pkgdir}/usr/share/"
  cp -r "${srcdir}/maple2019" "${pkgdir}/usr/share/"

  ln -s /usr/share/maple2019/bin/maple ${pkgdir}/usr/bin/maple
  ln -s /usr/share/maple2019/bin/xmaple ${pkgdir}/usr/bin/xmaple
  ln -s /usr/share/maple2019/bin/maple.system.type ${pkgdir}/usr/bin/maple.system.type
  ln -s /usr/share/maple2019/bin/mint ${pkgdir}/usr/bin/mint
  ln -s /usr/share/maple2019/EULA.html ${pkgdir}/usr/share/licenses/maple2019/LICENSE.html

  find ${pkgdir}/ -name "*.log" -delete
  find ${pkgdir}/ -type f -exec sed -i "s|${srcdir}|/usr/share|g" {} \;
}

