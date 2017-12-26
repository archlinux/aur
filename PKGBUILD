# Maintainer: Det <nimetonmaili gmail a-dot com>

pkgname=biglybt
pkgver=1.2.0.0
pkgrel=1
pkgdesc="Feature-filled Bittorrent client based on the Azureus project"
arch=('x86_64')
url="https://www.biglybt.com/"
license=('GPL3')
depends=('desktop-file-utils' 'java-runtime>=8')
makedepends=('java-runtime=8')
options=('!strip')
install=$pkgname.install
source=("https://github.com/BiglySoftware/BiglyBT/releases/download/v$pkgver/GitHub_BiglyBT_Installer.sh")
md5sums=('a6f5f9297a9dfdcfdc80d22fe8e2c776')

prepare() {
  rm -rf $pkgname

  msg2 "Extrcting GitHub_BiglyBT_Installer.sh..."
  sh GitHub_BiglyBT_Installer.sh -q -dir "$pkgdir"/opt/$pkgname
}

package() {
  cd "$pkgdir"/opt/$pkgname

  msg2 "Creating directory structure..."
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/licenses/$pkgname/
  install -d "$pkgdir"/usr/share/pixmaps/

  msg2 "Moving stuff in place..."
  # Launchers
  mv $pkgname "$pkgdir"/usr/bin/

  # Icon and desktop
  mv $pkgname.svg "$pkgdir"/usr/share/pixmaps/
  mv $pkgname.desktop "$pkgdir"/usr/share/applications/

  # Licenses
  mv 3rdPartyLicences.txt GPL.txt GPLv3.txt "$pkgdir"/usr/share/licenses/$pkgname/  

  msg2 "Removing redundancies..."
  rm swt/swt-{bsd,ppc64,ppc64le,x86}.jar
  rm biglybt-lightgray.svg biglybt.png
  rm installer.log
  rm {,un}registerBiglyBT uninstall updateBiglyBT

  msg2 "Fixing paths..."
  sed -i "s|#PROGRAM_DIR=.*|PROGRAM_DIR=\"/opt/$pkgname\"|" "$pkgdir"/usr/bin/$pkgname
  sed -e "s|Exec=.*|Exec=$pkgname %U|" -e "s|Icon=.*|Icon=$pkgname|" \
      -i "$pkgdir"/usr/share/applications/$pkgname.desktop
}


