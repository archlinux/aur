# Maintainer: nezu <nezu@nezu.cc>
pkgname=lcn-pro
pkgver=6.9.5
pkgrel=1
pkgdesc="PC program for setting up LCN modules"
arch=('x86_64')
url="https://www.lcn.eu/en/service/software-2/"
license=('custom')
options=(!debug !strip)
depends=(wine)
makedepends=(gendesk icoutils 7zip)
conflicts=('lcn-pro')
source=(
  "LCN-PRO-${pkgver}_Setup.exe.zip::https://www.lcn.eu/en/?wpdmdl=8089"
  "lcn-pro.sh"
)
sha256sums=('82a79207886768c58b68665024b28f2a197138594726de7ba7087c7a624a5fcf'
            'fe1761f84dee22e2c04f2ec4dfbf9fbfd850076295cf6889ac44d6a340b0b610')

prepare() {
  # extract the installer
  7z x -y LCN-PRO-${pkgver}_Setup.exe -olcn-pro

  # extract the icon out of the executable
  wrestool -x -n MAINICON lcn-pro/LCNPRO.exe -o lcn-pro.ico

  # get the highest quality PNG from the icon file
  icotool -x lcn-pro.ico -i 1 -o lcn-pro.png

  # generate a .desktop file
  gendesk -f -n \
    --name "LCN-PRO" \
    --pkgname "$pkgname" \
    --pkgdesc "$pkgdesc" \
    --exec lcn-pro \
    --icon lcn-pro.png \
    --categories "Utility;Network;HardwareSettings"
}

package() {
  install -d "$pkgdir"/usr/share/"$pkgname"
  cp -a lcn-pro/{*.exe,*.dll,Data,locale} "$pkgdir"/usr/share/"$pkgname"
  find "$pkgdir"/usr/share -type f -exec chmod 644 "{}" \;
  find "$pkgdir"/usr/share -type d -exec chmod 755 "{}" \;
  chmod 755 "$pkgdir"/usr/share/"$pkgname"/LCNPRO.exe

  install -Dm755 lcn-pro.sh "$pkgdir"/usr/bin/lcn-pro

  install -Dm644 lcn-pro.png "$pkgdir"/usr/share/pixmaps/lcn-pro.png
  install -Dm644 lcn-pro.desktop "$pkgdir"/usr/share/applications/lcn-pro.desktop
}
