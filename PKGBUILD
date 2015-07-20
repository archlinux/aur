# Maintainer: Jakub Luzny <jakub@luzny.cz>
pkgname=lpcxpresso
pkgver=7.8.0
_build=426
pkgrel=1
pkgdesc="NXP LPC microcontroller development suite"
url="https://www.lpcware.com/lpcxpresso"
arch=('x86_64' 'i686')
license=('custom:EULA')
depends_i686=('libusb-compat' 'gtk2')
depends_x86_64=('lib32-libusb-compat' 'lib32-gtk2')
options=(!strip)
source=("https://s3.amazonaws.com/LPCXpresso7/Installer_LPCXpresso_${pkgver}_${_build}_Linux-x86.tar.gz"
        "lpcxpresso.desktop")
md5sums=('229da033c514df0f8e5e37ee2c8ba45a'
         '9c6615c32b42bd5bfa72261a5dec569e')


package() {
  cd "${srcdir}"
  
  ./Installer_LPCXpresso_7.8.0_426_Linux-x86  --prefix "`pwd`" --mode silent || true
  
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
  install -Dm 644 "$srcdir/LPCXpressoLicense.txt" "$pkgdir/usr/share/licenses/enemy-territory"

}

# vim:set ts=2 sw=2 et: