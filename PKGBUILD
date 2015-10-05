# Maintainer: Jakub Luzny <jakub@luzny.cz>
pkgname=lpcxpresso
pkgver=7.9.2
_build=493
pkgrel=1
pkgdesc="NXP LPC microcontroller development suite"
url="https://www.lpcware.com/lpcxpresso"
arch=('x86_64' 'i686')
license=('custom:EULA')
depends_i686=('libusb-compat' 'gtk2' 'libxtst')
depends_x86_64=('lib32-libusb-compat' 'lib32-gtk2' 'lib32-libxtst')
options=(!strip)
source=("https://s3.amazonaws.com/LPCXpresso7/Installer_LPCXpresso_${pkgver}_${_build}_Linux-x86.tar.gz"
        "lpcxpresso.desktop")
md5sums=('c362e892973d7a3303b6aad4627f6ef0'
         '9c6615c32b42bd5bfa72261a5dec569e')

         #libxtst, ncursers, systemd

package() {
  cd "${srcdir}"
  
  ./Installer_LPCXpresso_${pkgver}_${_build}_Linux-x86  --prefix "`pwd`" --mode silent || true
  
  #udev rules
  install -Dm 644 UdevRules/85-lpcxpresso.rules "${pkgdir}/etc/udev/rules.d/85-lpcxpresso.rules"
  
  #lpcpresso files
  mkdir "${pkgdir}/opt"
  cp -r lpcxpresso "${pkgdir}/opt/"
  
  # /usr/bin symlink
  mkdir -p "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  ln -s ../../opt/lpcxpresso/lpcxpresso .
  
  #license storage dir
  mkdir -p "${pkgdir}/usr/share/NXPLPCXpresso"
  chmod 777 "${pkgdir}/usr/share/NXPLPCXpresso"
  
  #icon and desktop file
  install -Dm 644 "${srcdir}/lpcxpresso/icon.xpm" "${pkgdir}/usr/share/pixmaps/$pkgname.xpm"
  install -Dm 644 "${srcdir}/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  
  #license
  install -Dm 644 "$srcdir/LPCXpressoLicense.txt" "$pkgdir/usr/share/licenses/${pkgname}"

}

# vim:set ts=2 sw=2 et:
