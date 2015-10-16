# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>

# A valid license to Maple is required and you must have the installer ready.

pkgname=maple18
pkgver=latest
pkgrel=3
pkgdesc="A commercial computer algebra system developed and sold commercially by Maplesoft.  Version 18."
url=http://www.maplesoft.com/products/maple/
arch=('i686' 'x86_64')
license=('custom')
install='maple18.install'
depends=('ld-lsb')
source=(maple18.desktop)
sha256sums=('96a752f09a60e1a70f1da6a7389ddaf1bb977aab54c5ff955a781ee78c3e22c2')
options=(!strip)
PKGEXT='.pkg.tar' # XZ is too slow

if [[ $CARCH == 'x86_64' ]]; then
  _arch='X64'
elif [[ $CARCH == 'i686' ]]; then
  _arch='X86'
fi

build() {
  msg "Searching for installer in \"$startdir\"..."
  pkgpath="$startdir"

  if [[ ! -f "${pkgpath}/Maple18Linux${_arch}Installer.run" ]]; then
    error "Maple 18 installer not found! Please type path to Maple18Linux${_arch}Installer.run"
    read pkgpath
   if [[ ! -f "${pkgpath}/Maple18Linux${_arch}Installer.run" ]]; then
      error "Unable to find Maple 18 installer! Aborting!"  && return 1
    fi
  fi 

  msg "Found installer, unpacking..."
  $pkgpath/Maple18Linux${_arch}Installer.run --mode unattended --installdir ${srcdir}/maple18 --desktopshortcut 0
  
  # removing the installer's .desktop files from where they shouldn't be
  rm ~/.local/share/applications/maple18.desktop
  rm ~/.local/share/applications/mapleclassic18.desktop
  rm ~/.local/share/applications/maplearchive18.desktop
}

package () {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/licenses/maple18/"
  install -D -m755 "${srcdir}/maple18.desktop" "${pkgdir}/usr/share/applications/maple18.desktop"

  cp -r ${srcdir}/maple18 ${pkgdir}/usr/share/
  
  ln -s /usr/share/maple18/bin/maple ${pkgdir}/usr/bin/maple
  ln -s /usr/share/maple18/bin/maple.system.type ${pkgdir}/usr/bin/maple.system.type
  ln -s /usr/share/maple18/bin/mint ${pkgdir}/usr/bin/mint
  ln -s /usr/share/maple18/EULA.html ${pkgdir}/usr/share/licenses/maple18/LICENSE.html
  
  find ${pkgdir}/ -name "*.log" -delete
  find ${pkgdir}/ -type f -exec sed -i "s|${srcdir}|/usr/share|g" {} \;
}

