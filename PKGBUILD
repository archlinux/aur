# Maintainer: Det <nimetonmaili gmail a-dot com>

pkgname=biglybt
pkgver=1.5.0.0
pkgrel=1
pkgdesc="Feature-filled Bittorrent client based on the Azureus project"
arch=('x86_64')
url="https://www.biglybt.com/"
license=('GPL3')
depends=('desktop-file-utils' 'java-runtime>=9')
options=('!strip')
install=$pkgname.install
source=("GitHub_BiglyBT_Installer_$pkgver.sh::https://github.com/BiglySoftware/BiglyBT/releases/download/v$pkgver/GitHub_BiglyBT_Installer.sh")
md5sums=('91c9893dd2480207e278ba8fc030f203')

package() {
  if [[ ! -f /usr/bin/javac ]]; then
    warning "Installation without JDK will cause prompts for Root password during build!"
  fi

  rm -rf $pkgname
  
  msg2 "Extrcting GitHub_BiglyBT_Installer_$pkgver.sh..."
  export app_java_home=/usr/lib/jvm/default
  sh GitHub_BiglyBT_Installer_$pkgver.sh -q -dir "$srcdir"/$pkgname

  cd "$srcdir"/$pkgname

  msg2 "Creating directory structure..."
  install -d "$pkgdir"/opt/$pkgname/
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

  msg2 "Installing to /opt..."
  mv * "$pkgdir"/opt/$pkgname/
  
  msg2 "Fixing paths..."
  sed -i "s|#PROGRAM_DIR=.*|PROGRAM_DIR=\"/opt/$pkgname\"|" "$pkgdir"/usr/bin/$pkgname
  sed -e "s|Exec=.*|Exec=$pkgname %U|" -e "s|Icon=.*|Icon=$pkgname|" \
      -i "$pkgdir"/usr/share/applications/$pkgname.desktop
}
